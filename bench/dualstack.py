#!/usr/bin/env python3
"""Dual-stack functional test for a TUIC server, driven through the Rust
tuic-client's SOCKS5 port (CONNECT + UDP ASSOCIATE with IPv4 / IPv6 / domain
targets).

Usage: dualstack.py <server-binary> [zig|rust]
Needs /etc/hosts:  127.0.0.1 dual.test / ::1 dual.test / ::1 v6only.test
Echo servers (started here) prefix replies with "4:" or "6:" so we can see
which family the server actually reached.
"""
import json, os, socket, struct, subprocess, sys, threading, time

BENCH = os.path.dirname(os.path.abspath(__file__))
BIN = os.path.join(BENCH, '..', 'bin')
srv_bin = sys.argv[1]
kind = sys.argv[2] if len(sys.argv) > 2 else 'zig'
PORT = 8460
SOCKS = 28460
DUAL, V4ONLY = 7801, 7802   # 7801: v4+v6 echo, 7802: v4-only TCP echo

# ---------------- echo servers ----------------
def tcp_echo(fam, host, port, tag):
    s = socket.socket(fam, socket.SOCK_STREAM)
    if fam == socket.AF_INET6: s.setsockopt(socket.IPPROTO_IPV6, socket.IPV6_V6ONLY, 1)
    s.setsockopt(socket.SOL_SOCKET, socket.SO_REUSEADDR, 1)
    s.bind((host, port)); s.listen(64)
    def serve():
        while True:
            c, _ = s.accept()
            def h(c=c):
                try:
                    while True:
                        d = c.recv(4096)
                        if not d: break
                        c.sendall(tag + d)
                finally: c.close()
            threading.Thread(target=h, daemon=True).start()
    threading.Thread(target=serve, daemon=True).start()

def udp_echo(fam, host, port, tag):
    s = socket.socket(fam, socket.SOCK_DGRAM)
    if fam == socket.AF_INET6: s.setsockopt(socket.IPPROTO_IPV6, socket.IPV6_V6ONLY, 1)
    s.bind((host, port))
    def serve():
        while True:
            d, a = s.recvfrom(65535); s.sendto(tag + d, a)
    threading.Thread(target=serve, daemon=True).start()

tcp_echo(socket.AF_INET, '127.0.0.1', DUAL, b'4:'); tcp_echo(socket.AF_INET6, '::1', DUAL, b'6:')
udp_echo(socket.AF_INET, '127.0.0.1', DUAL, b'4:'); udp_echo(socket.AF_INET6, '::1', DUAL, b'6:')
tcp_echo(socket.AF_INET, '127.0.0.1', V4ONLY, b'4:')

# ---------------- socks5 helpers ----------------
def enc_addr(host, port):
    try:
        return b'\x01' + socket.inet_pton(socket.AF_INET, host) + struct.pack('>H', port)
    except OSError: pass
    try:
        return b'\x04' + socket.inet_pton(socket.AF_INET6, host) + struct.pack('>H', port)
    except OSError: pass
    h = host.encode(); return b'\x03' + bytes([len(h)]) + h + struct.pack('>H', port)

def socks_hello():
    s = socket.create_connection(('127.0.0.1', SOCKS), timeout=6)
    s.sendall(b'\x05\x01\x00'); assert s.recv(2) == b'\x05\x00'
    return s

def read_reply(s):
    h = s.recv(4)
    if len(h) < 4 or h[1] != 0: return None
    if h[3] == 1: rest = s.recv(6); return (socket.inet_ntop(socket.AF_INET, rest[:4]), struct.unpack('>H', rest[4:])[0])
    if h[3] == 4: rest = s.recv(18); return (socket.inet_ntop(socket.AF_INET6, rest[:16]), struct.unpack('>H', rest[16:])[0])
    n = s.recv(1)[0]; s.recv(n + 2); return ('?', 0)

def tcp_test(host, port):
    try:
        s = socks_hello()
        s.sendall(b'\x05\x01\x00' + enc_addr(host, port))
        if read_reply(s) is None: return 'FAIL(reply)'
        s.sendall(b'hello'); s.settimeout(6)
        d = s.recv(64); s.close()
        return d[:2].decode() + 'ok' if d.endswith(b'hello') else 'FAIL(' + repr(d) + ')'
    except Exception as e:
        return 'FAIL(' + type(e).__name__ + ')'

def udp_test(host, port):
    try:
        s = socks_hello()
        s.sendall(b'\x05\x03\x00\x01\x00\x00\x00\x00\x00\x00')
        relay = read_reply(s)
        if relay is None: return 'FAIL(assoc)'
        fam = socket.AF_INET6 if ':' in relay[0] else socket.AF_INET
        u = socket.socket(fam, socket.SOCK_DGRAM); u.settimeout(3)
        hdr = b'\x00\x00\x00' + enc_addr(host, port)
        for _ in range(3):
            u.sendto(hdr + b'ping', relay)
            try:
                d, _ = u.recvfrom(65535)
                break
            except socket.timeout:
                d = None
        s.close()
        if not d: return 'FAIL(timeout)'
        a = d[3]; off = 4 + (4 if a == 1 else 16 if a == 4 else 1 + d[4]) + 2
        p = d[off:]
        return p[:2].decode() + 'ok' if p.endswith(b'ping') else 'FAIL(' + repr(p) + ')'
    except Exception as e:
        return 'FAIL(' + type(e).__name__ + ')'

# ---------------- server / client ----------------
procs = []
def start_server(ip_mode):
    if kind == 'rust':
        raise SystemExit('rust variant not wired')
    cfg = {"server": f"[::]:{PORT}", "users": {"123e4567-e89b-12d3-a456-426614174000": "bench-pass"},
           "certificate": f"{BENCH}/cert.pem", "private_key": f"{BENCH}/key.pem", "alpn": ["h3"],
           "congestion_control": "bbr", "udp_relay_ipv6": True, "ip_mode": ip_mode,
           "log_level": "warn", "drop_loopback": False, "drop_private": False}
    path = f'/tmp/ds-server-{ip_mode}.json'; json.dump(cfg, open(path, 'w'))
    p = subprocess.Popen([srv_bin, '-c', path], stdout=subprocess.DEVNULL,
                         stderr=open(f'/tmp/ds-server-{ip_mode}.log', 'w'), start_new_session=True)
    procs.append(p); time.sleep(0.5); return p

def start_client(server_addr):
    cfg = {"relay": {"server": server_addr, "uuid": "123e4567-e89b-12d3-a456-426614174000", "password": "bench-pass",
                     "certificates": [f"{BENCH}/ca.pem"], "sni": "localhost", "alpn": ["h3"],
                     "udp_relay_mode": "native", "congestion_control": "bbr"},
           "local": {"server": f"127.0.0.1:{SOCKS}"}, "log_level": "warn"}
    path = '/tmp/ds-client.json'; json.dump(cfg, open(path, 'w'))
    p = subprocess.Popen([os.path.join(BIN, 'tuic-client'), '-c', path], stdout=subprocess.DEVNULL,
                         stderr=open('/tmp/ds-client.log', 'w'), start_new_session=True)
    procs.append(p); time.sleep(1.0); return p

def stop(p):
    try: os.killpg(p.pid, 9); p.wait()
    except Exception: pass

results = {}
try:
    # 1) client reaches the server over IPv4 and over IPv6; literal targets of both families
    for mode in ['v4first']:
        srv = start_server(mode)
        for cli_addr, cname in [(f'127.0.0.1:{PORT}', 'client-v4'), (f'[::1]:{PORT}', 'client-v6')]:
            cli = start_client(cli_addr)
            r = {}
            r['tcp 127.0.0.1'] = tcp_test('127.0.0.1', DUAL)
            r['tcp ::1'] = tcp_test('::1', DUAL)
            r['tcp dual.test'] = tcp_test('dual.test', DUAL)
            r['udp 127.0.0.1'] = udp_test('127.0.0.1', DUAL)
            r['udp ::1'] = udp_test('::1', DUAL)
            r['udp dual.test'] = udp_test('dual.test', DUAL)
            results[cname] = r; print(cname, r, file=sys.stderr, flush=True)
            stop(cli)
        stop(srv)
    # 2) ip_mode ordering and fallback, client over IPv6
    for mode in ['v4first', 'v6first', 'v4only', 'v6only']:
        srv = start_server(mode); cli = start_client(f'[::1]:{PORT}')
        r = {}
        r['tcp dual.test (both up)'] = tcp_test('dual.test', DUAL)
        r['tcp dual.test (v6 refused)'] = tcp_test('dual.test', V4ONLY)
        r['tcp v6only.test'] = tcp_test('v6only.test', DUAL)
        r['udp dual.test'] = udp_test('dual.test', DUAL)
        results['ip_mode=' + mode] = r; print(mode, r, file=sys.stderr, flush=True)
        stop(cli); stop(srv)
finally:
    for p in procs: stop(p)
print(json.dumps(results, indent=1))
