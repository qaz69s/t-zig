#!/usr/bin/env python3
"""Regression: many streams over ONE QUIC connection.

Usage: regress.py <server-binary> [rust|zig] [native|quic] [n_tcp] [n_udp]
- n_tcp short TCP connections in a row through the same tuic-client
  (each = one bidi QUIC stream), echo 16 bytes, close.
- n_udp UDP request/response packets (in quic mode each = one uni stream
  each way).
- then an iperf3 UDP run at 200 Mbit/s in the chosen relay mode.
"""
import json, os, socket, subprocess, sys, time

BENCH = os.path.dirname(os.path.abspath(__file__))
BIN = os.path.join(BENCH, '..', 'bin')
srv_bin = sys.argv[1]
kind = sys.argv[2] if len(sys.argv) > 2 else 'zig'
mode = sys.argv[3] if len(sys.argv) > 3 else 'native'
N_TCP = int(sys.argv[4]) if len(sys.argv) > 4 else 2500
N_UDP = int(sys.argv[5]) if len(sys.argv) > 5 else 3000

if kind == 'rust':
    srv_cmd = [srv_bin, '-c', os.path.join(BENCH, 'rust-server.toml')]
    base_cfg = os.path.join(BENCH, 'client-8443.json'); base = 18443
else:
    srv_cmd = [srv_bin, '-c', os.path.join(BENCH, 'zig-server.json')]
    base_cfg = os.path.join(BENCH, 'client-8444.json'); base = 28444
P_IPERF, P_ECHO, P_UDP = base, base + 2, base + 3

cfg = json.load(open(base_cfg))
cfg['relay']['udp_relay_mode'] = mode
cli_cfg = f'/tmp/regress-client-{kind}-{mode}.json'
json.dump(cfg, open(cli_cfg, 'w'))

def spawn(cmd, cpu):
    return subprocess.Popen(['taskset', '-c', str(cpu)] + cmd, stdout=subprocess.DEVNULL,
                            stderr=open(f'/tmp/regress-{os.path.basename(cmd[0])}.log', 'w'), start_new_session=True)

def tcp_many(n):
    ok = 0; first_fail = None; t0 = time.time()
    for i in range(n):
        try:
            s = socket.create_connection(('127.0.0.1', P_ECHO), timeout=3)
            s.settimeout(3)
            s.sendall(b'0123456789abcdef')
            got = b''
            while len(got) < 16:
                d = s.recv(64)
                if not d: break
                got += d
            s.close()
            if got == b'0123456789abcdef':
                ok += 1
                continue
        except Exception:
            pass
        if first_fail is None: first_fail = i
        if i - (first_fail or 0) > 20: break   # stuck: stop early
    return {'ok': ok, 'tried': i + 1, 'first_fail': first_fail, 'secs': round(time.time() - t0, 1)}

def udp_many(n):
    u = socket.socket(socket.AF_INET, socket.SOCK_DGRAM); u.settimeout(1.0)
    ok = 0; first_fail = None; consec = 0
    for i in range(n):
        msg = i.to_bytes(4, 'big') * 16
        u.sendto(msg, ('127.0.0.1', P_UDP))
        try:
            while True:
                d, _ = u.recvfrom(2048)
                if d == msg: break
            ok += 1; consec = 0
        except socket.timeout:
            if first_fail is None: first_fail = i
            consec += 1
            if consec >= 10: break
    return {'ok': ok, 'tried': i + 1, 'first_fail': first_fail}

def iperf_udp():
    try:
        out = subprocess.run(['taskset', '-c', '0', 'iperf3', '-c', '127.0.0.1', '-p', str(P_IPERF), '-J', '-t', '6',
                              '-u', '-b', '200M', '-l', '1200'], capture_output=True, text=True, timeout=30)
        j = json.loads(out.stdout)
    except Exception as ex:
        return {'error': type(ex).__name__}
    if 'error' in j: return {'error': j['error']}
    s = j['end']['sum']
    return {'mbps_sent': round(s['bits_per_second'] / 1e6, 1), 'loss_pct': round(s.get('lost_percent', 0), 2)}

def main():
    ip = spawn(['iperf3', '-s', '-p', '5201'], 0)
    ec = spawn(['python3', os.path.join(BENCH, 'echo.py')], 0)
    srv = spawn(srv_cmd, 1)
    time.sleep(0.6)
    cli = spawn([os.path.join(BIN, 'tuic-client'), '-c', cli_cfg], 0)
    time.sleep(1.2)
    res = {'server': os.path.basename(srv_bin), 'mode': mode}
    try:
        res['tcp'] = tcp_many(N_TCP); print('tcp', res['tcp'], file=sys.stderr, flush=True)
        res['udp'] = udp_many(N_UDP); print('udp', res['udp'], file=sys.stderr, flush=True)
        res['iperf_udp'] = iperf_udp()
        res['server_alive'] = srv.poll() is None
    finally:
        for p in (cli, srv, ec, ip):
            try: os.killpg(p.pid, 9)
            except Exception: pass
    print(json.dumps(res))

main()
