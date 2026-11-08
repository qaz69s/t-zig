#!/usr/bin/env python3
"""TUIC server benchmark: same Rust tuic-client, same targets, swap the server.

Usage: bench.py <rust|zig> [zig-binary] [--quick]
Server is pinned to CPU 1; client, iperf3 and echo servers share CPU 0.
Reports throughput, server CPU-seconds per GB moved, latency, RSS.
"""
import json, os, socket, subprocess, sys, time, statistics

BENCH = os.path.dirname(os.path.abspath(__file__))
BIN = os.path.join(BENCH, '..', 'bin')
which = sys.argv[1]
zig_bin = sys.argv[2] if len(sys.argv) > 2 and not sys.argv[2].startswith('--') else os.path.join(BIN, 'tuic-zig')
QUICK = '--quick' in sys.argv
DUR = 4 if QUICK else 8

if which.startswith('rust'):
    srv_cmd = [os.path.join(BIN, 'tuic-server-o3' if which == 'rust-o3' else 'tuic-server'), '-c', os.path.join(BENCH, 'rust-server.toml')]
    cli_cfg = os.path.join(BENCH, 'client-8443.json'); base = 18443
else:
    srv_cmd = [zig_bin, '-c', os.path.join(BENCH, 'zig-server.json')]
    cli_cfg = os.path.join(BENCH, 'client-8444.json'); base = 28444
P_IPERF, P_ECHO, P_UDP = base, base + 2, base + 3

def spawn(cmd, cpu):
    return subprocess.Popen(['taskset', '-c', str(cpu)] + cmd, stdout=subprocess.DEVNULL,
                            stderr=open(f'/tmp/{os.path.basename(cmd[0])}.log', 'w'), start_new_session=True)

def cpu_secs(pid):
    with open(f'/proc/{pid}/stat') as f:
        parts = f.read().rsplit(')', 1)[1].split()
    return (int(parts[11]) + int(parts[12])) / os.sysconf('SC_CLK_TCK')

def rss_kb(pid):
    with open(f'/proc/{pid}/status') as f:
        for l in f:
            if l.startswith('VmRSS'):
                return int(l.split()[1])
    return 0

def iperf(args):
    out = subprocess.run(['taskset', '-c', '0', 'iperf3', '-c', '127.0.0.1', '-p', str(P_IPERF), '-J', '-t', str(DUR)] + args,
                         capture_output=True, text=True, timeout=DUR + 30)
    j = json.loads(out.stdout)
    if 'error' in j:
        raise RuntimeError(j['error'])
    e = j['end']
    if '-u' in args:
        s = e['sum']
        loss = s.get('lost_percent', 0)
        good = s['bytes'] * (1 - loss / 100)
        return good * 8 / s['seconds'] / 1e6, good, loss
    r = e['sum_received']
    return r['bits_per_second'] / 1e6, r['bytes'], 0

def tcp_rr(n=3000, size=64):
    s = socket.create_connection(('127.0.0.1', P_ECHO), timeout=5)
    s.setsockopt(socket.IPPROTO_TCP, socket.TCP_NODELAY, 1)
    msg = b'x' * size
    lat = []
    for i in range(n):
        t = time.perf_counter_ns()
        s.sendall(msg)
        got = 0
        while got < size:
            got += len(s.recv(65536))
        lat.append((time.perf_counter_ns() - t) / 1000)
    s.close()
    return lat

def tcp_crr(n=400):
    lat = []
    for i in range(n):
        t = time.perf_counter_ns()
        s = socket.create_connection(('127.0.0.1', P_ECHO), timeout=5)
        s.sendall(b'ping')
        s.recv(16)
        lat.append((time.perf_counter_ns() - t) / 1000)
        s.close()
    return lat

def udp_rr(n=3000, size=64):
    s = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
    s.settimeout(1)
    lat = []; lost = 0
    for i in range(n):
        msg = i.to_bytes(4, 'big') + b'u' * (size - 4)
        t = time.perf_counter_ns()
        s.sendto(msg, ('127.0.0.1', P_UDP))
        try:
            while True:
                r, _ = s.recvfrom(65536)
                if r[:4] == msg[:4]:
                    break
            lat.append((time.perf_counter_ns() - t) / 1000)
        except socket.timeout:
            lost += 1
    return lat, lost

def pct(l, p):
    l = sorted(l); return l[min(len(l) - 1, int(len(l) * p / 100))]

def main():
    srv = spawn(srv_cmd, 1)
    time.sleep(0.5)
    cli = spawn([os.path.join(BIN, 'tuic-client'), '-c', cli_cfg], 0)
    time.sleep(1.0)
    res = {'server': which}
    try:
        # warm up (handshake + auth)
        tcp_rr(50)
        res['rss_idle_kb'] = rss_kb(srv.pid)
        for name, args in [('tcp_up', []), ('tcp_down', ['-R']), ('tcp_down_p4', ['-R', '-P', '4']),
                           ('udp_up', ['-u', '-b', '400M', '-l', '1200']), ('udp_down', ['-u', '-b', '400M', '-l', '1200', '-R'])]:
            c0 = cpu_secs(srv.pid)
            try:
                mbps, nbytes, loss = iperf(args)
            except Exception as ex:
                res[name] = {'error': str(ex)}
                continue
            used = cpu_secs(srv.pid) - c0
            res[name] = {'mbps': round(mbps, 1), 'cpu_s_per_gb': round(used / (nbytes / 1e9), 3) if nbytes else None,
                         'srv_cpu_pct': round(100 * used / DUR, 1)}
            if '-u' in args:
                res[name]['loss_pct'] = round(loss, 2)
            print(name, res[name], file=sys.stderr, flush=True)
            time.sleep(1)
        res['rss_after_kb'] = rss_kb(srv.pid)
        l = tcp_rr()
        print('rr', file=sys.stderr, flush=True)
        res['tcp_rr_us'] = {'p50': round(pct(l, 50), 1), 'p99': round(pct(l, 99), 1), 'mean': round(statistics.mean(l), 1)}
        l = tcp_crr()
        res['tcp_crr_us'] = {'p50': round(pct(l, 50), 1), 'p99': round(pct(l, 99), 1), 'mean': round(statistics.mean(l), 1)}
        l, lost = udp_rr()
        res['udp_rr_us'] = {'p50': round(pct(l, 50), 1), 'p99': round(pct(l, 99), 1), 'mean': round(statistics.mean(l), 1), 'lost': lost}
        res['rss_end_kb'] = rss_kb(srv.pid)
    finally:
        for p in (cli, srv):
            os.killpg(p.pid, 9)
    print(json.dumps(res))

main()
