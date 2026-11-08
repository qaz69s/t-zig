//! TUIC v5 server: single-threaded epoll event loop, QUIC by ngtcp2 (+ OpenSSL 3.5
//! QUIC TLS API), everything above QUIC (auth, TCP relay, UDP relay, fragment
//! reassembly, flow control plumbing, DNS) implemented here.
const std = @import("std");
const cmod = @import("c.zig");
const c = cmod.c;
const proto = @import("proto.zig");
const sb = @import("sendbuf.zig");
const Resolver = @import("resolver.zig").Resolver;
const Req = @import("resolver.zig").Req;
const setPort = @import("resolver.zig").setPort;
const IpMode = @import("resolver.zig").IpMode;
const MAX_ADDRS = @import("resolver.zig").MAX_ADDRS;

/// Remaining candidate addresses of a resolved domain target (TCP).
const AltAddrs = struct {
    addrs: [MAX_ADDRS]c.struct_sockaddr_in6,
    lens: [MAX_ADDRS]c.socklen_t,
    n: u8,
    next: u8,
};
const Config = @import("config.zig").Config;

const log = std.log.scoped(.tuic);

const SCID_LEN = 18;
const EPOLLET: u32 = 1 << 31;
const MAX_TX_BUF: u64 = 4 * 1024 * 1024; // per-stream TCP->QUIC buffer cap
const MAX_UNI_LEN = 70 * 1024;
const MAX_DGRAM_Q = 8192;
const MAX_PENDING = 256;
const TXBUF_LEN = 64 * 1024;
const RX_BATCH = 16;
const RX_SLOT = 65536;

const MMsgHdr = extern struct { hdr: c.struct_msghdr, len: c_uint };
extern fn recvmmsg(fd: c_int, msgs: [*]MMsgHdr, vlen: c_uint, flags: c_int, timeout: ?*anyopaque) c_int;

/// Returns the UDP_GRO segment size from a recvmsg control buffer, 0 if absent.
fn groSize(ctrl: []const u8, clen: usize) usize {
    const H = @sizeOf(usize) + 2 * @sizeOf(c_int);
    var off: usize = 0;
    while (off + H <= clen) {
        const l = std.mem.readInt(usize, ctrl[off..][0..@sizeOf(usize)], .little);
        const level = std.mem.readInt(c_int, ctrl[off + @sizeOf(usize) ..][0..4], .little);
        const typ = std.mem.readInt(c_int, ctrl[off + @sizeOf(usize) + 4 ..][0..4], .little);
        if (l < H) break;
        if (level == c.IPPROTO_UDP and typ == 104 and l >= H + 4)
            return @intCast(std.mem.readInt(c_int, ctrl[off + H ..][0..4], .little));
        off += (l + 7) & ~@as(usize, 7);
    }
    return 0;
}

pub fn now() u64 {
    var ts: c.struct_timespec = undefined;
    _ = c.clock_gettime(c.CLOCK_MONOTONIC, &ts);
    return @as(u64, @intCast(ts.tv_sec)) * 1_000_000_000 + @as(u64, @intCast(ts.tv_nsec));
}

const Kind = enum { listener, timer, dns, tcp, udp };
const Ev = struct { kind: Kind, fd: c_int = -1 };

pub const Addr = struct {
    ss: c.struct_sockaddr_storage = std.mem.zeroes(c.struct_sockaddr_storage),
    len: c.socklen_t = 0,

    fn sa(self: *Addr) *c.struct_sockaddr {
        return @ptrCast(&self.ss);
    }
    fn saConst(self: *const Addr) *const c.struct_sockaddr {
        return @ptrCast(&self.ss);
    }
};

const CidKey = struct {
    len: u8 = 0,
    data: [c.NGTCP2_MAX_CIDLEN]u8 = [_]u8{0} ** c.NGTCP2_MAX_CIDLEN,

    fn from(p: [*c]const u8, n: usize) CidKey {
        var k = CidKey{ .len = @intCast(n) };
        @memcpy(k.data[0..n], p[0..n]);
        return k;
    }
    fn fromCid(cid: *const c.ngtcp2_cid) CidKey {
        return from(&cid.data, cid.datalen);
    }
};

fn setFromNg(dst: *Addr, a: *const c.ngtcp2_addr) void {
    if (a.addr == null or a.addrlen == 0 or a.addrlen > @sizeOf(c.struct_sockaddr_storage)) return;
    const src: [*]const u8 = @ptrCast(a.addr);
    dst.ss = std.mem.zeroes(c.struct_sockaddr_storage);
    @memcpy(std.mem.asBytes(&dst.ss)[0..a.addrlen], src[0..a.addrlen]);
    dst.len = a.addrlen;
}

fn toNgAddr(a: *const Addr) c.ngtcp2_addr {
    return .{ .addr = @constCast(a.saConst()), .addrlen = a.len };
}

fn parseHostPort(str: []const u8) !std.net.Address {
    const colon = std.mem.lastIndexOfScalar(u8, str, ':') orelse return error.BadListenAddress;
    var host = str[0..colon];
    if (host.len >= 2 and host[0] == '[' and host[host.len - 1] == ']') host = host[1 .. host.len - 1];
    const port = try std.fmt.parseInt(u16, str[colon + 1 ..], 10);
    return std.net.Address.parseIp(host, port);
}

// ------------------------------------------------------------------------
// Streams
// ------------------------------------------------------------------------

const StreamKind = enum { bidi, uni_in, uni_out };
const Phase = enum { header, wait_auth, resolving, connecting, relaying, failed };

const Stream = struct {
    ev: Ev = .{ .kind = .tcp },
    conn: *Conn,
    id: i64,
    kind: StreamKind,
    phase: Phase = .header,
    dead: bool = false,

    hdr: [2 + 1 + 1 + 255 + 2]u8 = undefined,
    hdr_len: usize = 0,
    target: proto.Address = .none,
    dns: ?*Req = null,
    alts: ?*AltAddrs = null,

    // QUIC -> TCP
    rx: std.ArrayListUnmanaged(u8) = .{},
    rx_off: usize = 0,
    rx_fin: bool = false,
    tcp_shut_wr: bool = false,
    tcp_writable: bool = false,

    // TCP -> QUIC
    tx: sb.SendBuf = .{},
    tx_fin: bool = false,
    fin_sent: bool = false,
    tcp_readable: bool = false,
    tcp_eof: bool = false,
    blocked: bool = false,
    in_q: bool = false,
    q_next: ?*Stream = null,
    in_wake: bool = false,
    want_abort: bool = false,
    want_flush: bool = false,

    // uni stream accumulation
    uni: std.ArrayListUnmanaged(u8) = .{},
    uni_bad: bool = false,
    uni_done: bool = false,

    fn rxPending(self: *const Stream) usize {
        return self.rx.items.len - self.rx_off;
    }
    fn hasSendWork(self: *const Stream) bool {
        return self.tx.unsent() > 0 or (self.tx_fin and !self.fin_sent);
    }
};

// ------------------------------------------------------------------------
// UDP sessions
// ------------------------------------------------------------------------

const UdpMode = enum { native, quic };

const FragBuf = struct {
    total: u8,
    got: u8 = 0,
    parts: []?[]u8,
    addr: proto.Address = .none,
    created: u64,
};

const UdpSession = struct {
    ev: Ev = .{ .kind = .udp },
    conn: *Conn,
    assoc: u16,
    mode: UdpMode,
    v6: bool,
    dead: bool = false,
    next_pkt_id: u16 = 0,
    frags: std.AutoHashMapUnmanaged(u16, *FragBuf) = .{},
    dns_pending: std.ArrayListUnmanaged(*Req) = .{},
};

const Pending = struct { data: []u8, is_dgram: bool };

// ------------------------------------------------------------------------
// Connection
// ------------------------------------------------------------------------

const ConnState = enum { normal, closing, draining };

const Conn = struct {
    srv: *Server,
    conn: ?*c.ngtcp2_conn = null,
    ssl: ?*anyopaque = null,
    ossl: ?*anyopaque = null,
    conn_ref: c.ngtcp2_crypto_conn_ref = undefined,
    remote: Addr,
    index: usize = 0,
    state: ConnState = .normal,
    deadline: u64 = std.math.maxInt(u64),
    dead: bool = false,
    in_dirty: bool = false,
    want_close: bool = false,
    last_err: c.ngtcp2_ccerr = undefined,
    closebuf: [1500]u8 = undefined,
    closebuf_len: usize = 0,

    cids: std.ArrayListUnmanaged(CidKey) = .{},
    streams: std.AutoHashMapUnmanaged(i64, *Stream) = .{},
    q_head: ?*Stream = null,
    q_tail: ?*Stream = null,
    wake: std.ArrayListUnmanaged(*Stream) = .{},
    dgram_q: std.ArrayListUnmanaged([]u8) = .{},
    dgram_head: usize = 0,
    sessions: std.AutoHashMapUnmanaged(u16, *UdpSession) = .{},

    hs_done: bool = false,
    authed: bool = false,
    auth_deadline: u64,
    pending_auth: ?[48]u8 = null,
    pending: std.ArrayListUnmanaged(Pending) = .{},

    // send blocked on EAGAIN
    blocked_len: usize = 0,
    blocked_gso: usize = 0,
    blocked_buf: ?[]u8 = null,
    blocked_dst: Addr = .{},

    fn ng(self: *Conn) *c.ngtcp2_conn {
        return self.conn.?;
    }

    fn markDirty(self: *Conn) void {
        if (self.in_dirty or self.dead) return;
        self.in_dirty = true;
        self.srv.dirty.append(self.srv.alloc, self) catch {};
    }

    fn enqueue(self: *Conn, s: *Stream) void {
        if (s.in_q or s.blocked or s.dead or !s.hasSendWork()) return;
        s.in_q = true;
        s.q_next = null;
        if (self.q_tail) |t| t.q_next = s else self.q_head = s;
        self.q_tail = s;
        self.markDirty();
    }

    fn qPopFront(self: *Conn) void {
        const h = self.q_head orelse return;
        self.q_head = h.q_next;
        if (self.q_head == null) self.q_tail = null;
        h.q_next = null;
        h.in_q = false;
    }

    fn qRemove(self: *Conn, s: *Stream) void {
        if (!s.in_q) return;
        var prev: ?*Stream = null;
        var it = self.q_head;
        while (it) |x| : (it = x.q_next) {
            if (x == s) {
                if (prev) |p| p.q_next = x.q_next else self.q_head = x.q_next;
                if (self.q_tail == x) self.q_tail = prev;
                break;
            }
            prev = x;
        }
        s.in_q = false;
        s.q_next = null;
    }

    /// Moves the head stream to the tail (round robin).
    fn qRotate(self: *Conn) void {
        const h = self.q_head orelse return;
        if (h.q_next == null) return;
        self.q_head = h.q_next;
        h.q_next = null;
        self.q_tail.?.q_next = h;
        self.q_tail = h;
    }

    fn wakeStream(self: *Conn, s: *Stream) void {
        if (s.in_wake or s.dead) return;
        s.in_wake = true;
        self.wake.append(self.srv.alloc, s) catch {};
        self.markDirty();
    }

    fn requestClose(self: *Conn, code: u64, reason: []const u8) void {
        if (self.want_close) return;
        c.ngtcp2_ccerr_set_application_error(&self.last_err, code, reason.ptr, reason.len);
        self.want_close = true;
        self.markDirty();
    }

    fn maxDatagramPayload(self: *Conn) usize {
        const rp = c.ngtcp2_conn_get_remote_transport_params(self.ng());
        if (rp == null or rp.*.max_datagram_frame_size == 0) return 0;
        const pl = c.ngtcp2_conn_get_path_max_tx_udp_payload_size(self.ng());
        const dcid = c.ngtcp2_conn_get_dcid(self.ng());
        const overhead: usize = 1 + dcid.*.datalen + 4 + 16 + 1 + 4;
        if (pl <= overhead) return 0;
        var m = pl - overhead;
        if (rp.*.max_datagram_frame_size < m + 5) m = @intCast(rp.*.max_datagram_frame_size -| 5);
        return m;
    }

    fn pushDatagram(self: *Conn, d: []u8) void {
        if (self.dgram_q.items.len - self.dgram_head >= MAX_DGRAM_Q) {
            self.srv.alloc.free(d);
            return;
        }
        self.dgram_q.append(self.srv.alloc, d) catch {
            self.srv.alloc.free(d);
            return;
        };
        self.markDirty();
    }

    fn popDatagram(self: *Conn) void {
        self.srv.alloc.free(self.dgram_q.items[self.dgram_head]);
        self.dgram_head += 1;
        if (self.dgram_head == self.dgram_q.items.len) {
            self.dgram_q.clearRetainingCapacity();
            self.dgram_head = 0;
        } else if (self.dgram_head > 1024) {
            const rest = self.dgram_q.items.len - self.dgram_head;
            std.mem.copyForwards([]u8, self.dgram_q.items[0..rest], self.dgram_q.items[self.dgram_head..]);
            self.dgram_q.shrinkRetainingCapacity(rest);
            self.dgram_head = 0;
        }
    }

    fn nextDeadline(self: *Conn) u64 {
        if (self.state != .normal) return self.deadline;
        var d = c.ngtcp2_conn_get_expiry(self.ng());
        if (!self.authed) d = @min(d, self.auth_deadline);
        return d;
    }
};

// ------------------------------------------------------------------------
// Server
// ------------------------------------------------------------------------

pub const Server = struct {
    alloc: std.mem.Allocator,
    cfg: *const Config,
    users: std.AutoHashMapUnmanaged([16]u8, []const u8) = .{},
    epfd: c_int = -1,
    lev: Ev = .{ .kind = .listener },
    tev: Ev = .{ .kind = .timer },
    dev: Ev = .{ .kind = .dns },
    local: Addr = .{},
    v6: bool = false,
    ip_mode: IpMode = .v4first,
    ssl_ctx: *anyopaque = undefined,
    callbacks: c.ngtcp2_callbacks = undefined,
    static_secret: [32]u8 = undefined,
    cids: std.AutoHashMapUnmanaged(CidKey, *Conn) = .{},
    conns: std.ArrayListUnmanaged(*Conn) = .{},
    dirty: std.ArrayListUnmanaged(*Conn) = .{},
    garbage_streams: std.ArrayListUnmanaged(*Stream) = .{},
    garbage_sessions: std.ArrayListUnmanaged(*UdpSession) = .{},
    garbage_conns: std.ArrayListUnmanaged(*Conn) = .{},
    blocked_conns: std.ArrayListUnmanaged(*Conn) = .{},
    pool: sb.Pool,
    resolver: Resolver = undefined,
    gso: bool = true,
    timer_at: u64 = 0,
    last_gc: u64 = 0,
    txbuf: [TXBUF_LEN]u8 align(16) = undefined,
    rxbuf: [65536]u8 align(16) = undefined,
    rxslab: []u8 = &.{},
    alpn_wire: [256]u8 = undefined,

    pub fn init(self: *Server, alloc: std.mem.Allocator, cfg: *const Config) !void {
        self.* = .{ .alloc = alloc, .cfg = cfg, .pool = .{ .alloc = alloc } };
        self.gso = cfg.gso;
        self.rxslab = try alloc.alignedAlloc(u8, 16, RX_BATCH * RX_SLOT);
        std.crypto.random.bytes(&self.static_secret);

        var it = cfg.users.map.iterator();
        while (it.next()) |e| {
            const u = try proto.parseUuid(e.key_ptr.*);
            try self.users.put(alloc, u, e.value_ptr.*);
        }

        if (cmod.tz_crypto_init() != 0) return error.CryptoInit;
        var alen: usize = 0;
        for (cfg.alpn) |a| {
            if (a.len == 0 or a.len > 255 or alen + 1 + a.len > self.alpn_wire.len) return error.BadAlpn;
            self.alpn_wire[alen] = @intCast(a.len);
            @memcpy(self.alpn_wire[alen + 1 .. alen + 1 + a.len], a);
            alen += 1 + a.len;
        }
        const certz = try alloc.dupeZ(u8, cfg.certificate);
        const keyz = try alloc.dupeZ(u8, cfg.private_key);
        self.ssl_ctx = cmod.tz_tls_ctx_new(certz, keyz, &self.alpn_wire, alen, @intFromBool(cfg.zero_rtt_handshake)) orelse return error.TlsInit;

        self.setupCallbacks();

        self.epfd = c.epoll_create1(c.EPOLL_CLOEXEC);
        if (self.epfd < 0) return error.Epoll;

        // listener
        const la = try parseHostPort(cfg.server);
        self.ip_mode = IpMode.parse(cfg.ip_mode) orelse return error.BadIpMode;
        self.v6 = la.any.family == std.posix.AF.INET6;
        var la4 = la;
        var fd = c.socket(if (self.v6) c.AF_INET6 else c.AF_INET, c.SOCK_DGRAM | c.SOCK_NONBLOCK | c.SOCK_CLOEXEC, 0);
        if (fd < 0 and self.v6 and std.mem.allEqual(u8, &la.in6.sa.addr, 0)) {
            // kernel without IPv6: "[::]:port" degrades to "0.0.0.0:port"
            log.warn("IPv6 unavailable, listening on IPv4 only", .{});
            la4 = std.net.Address.initIp4(.{ 0, 0, 0, 0 }, la.getPort());
            self.v6 = false;
            fd = c.socket(c.AF_INET, c.SOCK_DGRAM | c.SOCK_NONBLOCK | c.SOCK_CLOEXEC, 0);
        }
        if (fd < 0) return error.Socket;
        const one: c_int = 1;
        const zero: c_int = 0;
        if (self.v6) _ = c.setsockopt(fd, c.IPPROTO_IPV6, c.IPV6_V6ONLY, &zero, @sizeOf(c_int));
        _ = c.setsockopt(fd, c.SOL_SOCKET, c.SO_REUSEADDR, &one, @sizeOf(c_int));
        const bufsz: c_int = 8 * 1024 * 1024;
        _ = c.setsockopt(fd, c.SOL_SOCKET, c.SO_RCVBUF, &bufsz, @sizeOf(c_int));
        _ = c.setsockopt(fd, c.SOL_SOCKET, c.SO_SNDBUF, &bufsz, @sizeOf(c_int));
        if (cfg.gro) _ = c.setsockopt(fd, c.IPPROTO_UDP, 104, &one, @sizeOf(c_int)); // UDP_GRO
        if (c.bind(fd, @ptrCast(&la4.any), la4.getOsSockLen()) != 0) return error.Bind;
        self.local.len = @sizeOf(c.struct_sockaddr_storage);
        _ = c.getsockname(fd, self.local.sa(), &self.local.len);
        self.lev.fd = fd;
        try self.epollAdd(fd, c.EPOLLIN, &self.lev);

        self.tev.fd = c.timerfd_create(c.CLOCK_MONOTONIC, c.TFD_NONBLOCK | c.TFD_CLOEXEC);
        if (self.tev.fd < 0) return error.Timerfd;
        try self.epollAdd(self.tev.fd, c.EPOLLIN, &self.tev);

        try self.resolver.init(alloc);
        self.dev.fd = self.resolver.efd;
        try self.epollAdd(self.dev.fd, c.EPOLLIN, &self.dev);

        log.info("listening on {s} (alpn={d} entries, cc={s})", .{ cfg.server, cfg.alpn.len, cfg.congestion_control });
    }

    fn epollAdd(self: *Server, fd: c_int, events: u32, ev: *Ev) !void {
        var e = c.struct_epoll_event{ .events = events, .data = .{ .u64 = @intFromPtr(ev) } };
        if (c.epoll_ctl(self.epfd, c.EPOLL_CTL_ADD, fd, &e) != 0) return error.EpollCtl;
    }

    fn epollMod(self: *Server, fd: c_int, events: u32, ev: *Ev) void {
        var e = c.struct_epoll_event{ .events = events, .data = .{ .u64 = @intFromPtr(ev) } };
        _ = c.epoll_ctl(self.epfd, c.EPOLL_CTL_MOD, fd, &e);
    }

    fn setupCallbacks(self: *Server) void {
        var cb = std.mem.zeroes(c.ngtcp2_callbacks);
        cb.recv_client_initial = c.ngtcp2_crypto_recv_client_initial_cb;
        cb.recv_crypto_data = c.ngtcp2_crypto_recv_crypto_data_cb;
        cb.encrypt = c.ngtcp2_crypto_encrypt_cb;
        cb.decrypt = c.ngtcp2_crypto_decrypt_cb;
        cb.hp_mask = c.ngtcp2_crypto_hp_mask_cb;
        cb.update_key = c.ngtcp2_crypto_update_key_cb;
        cb.delete_crypto_aead_ctx = c.ngtcp2_crypto_delete_crypto_aead_ctx_cb;
        cb.delete_crypto_cipher_ctx = c.ngtcp2_crypto_delete_crypto_cipher_ctx_cb;
        cb.get_path_challenge_data = c.ngtcp2_crypto_get_path_challenge_data_cb;
        cb.version_negotiation = c.ngtcp2_crypto_version_negotiation_cb;
        cb.handshake_completed = cbHandshakeCompleted;
        cb.recv_stream_data = cbRecvStreamData;
        cb.acked_stream_data_offset = cbAckedStreamDataOffset;
        cb.stream_open = cbStreamOpen;
        cb.stream_close = cbStreamClose;
        cb.stream_reset = cbStreamReset;
        cb.stream_stop_sending = cbStreamStopSending;
        cb.extend_max_stream_data = cbExtendMaxStreamData;
        cb.rand = cbRand;
        cb.get_new_connection_id = cbGetNewConnectionId;
        cb.remove_connection_id = cbRemoveConnectionId;
        cb.recv_datagram = cbRecvDatagram;
        self.callbacks = cb;
    }

    // --------------------------------------------------------------------
    // event loop
    // --------------------------------------------------------------------

    pub fn run(self: *Server) !void {
        var events: [256]c.struct_epoll_event = undefined;
        while (true) {
            self.armTimer();
            const n = c.epoll_wait(self.epfd, &events, events.len, -1);
            if (n < 0) {
                if (cmod.errno() == c.EINTR) continue;
                return error.EpollWait;
            }
            for (events[0..@intCast(n)]) |e| {
                const ev: *Ev = @ptrFromInt(e.data.u64);
                switch (ev.kind) {
                    .listener => {
                        if (e.events & c.EPOLLIN != 0) self.onListenerReadable();
                        if (e.events & c.EPOLLOUT != 0) self.onListenerWritable();
                    },
                    .timer => {
                        var v: u64 = 0;
                        _ = c.read(ev.fd, &v, 8);
                    },
                    .dns => self.onDns(),
                    .tcp => {
                        const s: *Stream = @alignCast(@fieldParentPtr("ev", ev));
                        if (!s.dead) self.onTcpEvent(s, e.events);
                    },
                    .udp => {
                        const u: *UdpSession = @alignCast(@fieldParentPtr("ev", ev));
                        if (!u.dead) self.onUdpReadable(u);
                    },
                }
            }
            self.processTimers();
            self.flush();
            self.collectGarbage();
        }
    }

    fn armTimer(self: *Server) void {
        var next: u64 = std.math.maxInt(u64);
        for (self.conns.items) |cn| {
            if (cn.dead) continue;
            next = @min(next, cn.nextDeadline());
        }
        if (self.conns.items.len > 0) next = @min(next, self.last_gc + std.time.ns_per_s);
        if (next == self.timer_at) return;
        self.timer_at = next;
        var its = std.mem.zeroes(c.struct_itimerspec);
        if (next != std.math.maxInt(u64)) {
            const t = @max(next, 1);
            its.it_value.tv_sec = @intCast(t / std.time.ns_per_s);
            its.it_value.tv_nsec = @intCast(t % std.time.ns_per_s);
        }
        _ = c.timerfd_settime(self.tev.fd, c.TFD_TIMER_ABSTIME, &its, null);
    }

    fn processTimers(self: *Server) void {
        const t = now();
        for (self.conns.items) |cn| {
            if (cn.dead) continue;
            switch (cn.state) {
                .closing, .draining => {
                    if (cn.deadline <= t) self.destroyConn(cn);
                    continue;
                },
                .normal => {},
            }
            if (!cn.authed and cn.auth_deadline <= t) {
                log.debug("auth timeout", .{});
                cn.requestClose(0, "auth timeout");
                continue;
            }
            if (c.ngtcp2_conn_get_expiry(cn.ng()) <= t) {
                const rv = c.ngtcp2_conn_handle_expiry(cn.ng(), t);
                if (rv != 0) {
                    if (rv == c.NGTCP2_ERR_IDLE_CLOSE) {
                        log.debug("idle close", .{});
                        self.destroyConn(cn);
                        continue;
                    }
                    c.ngtcp2_ccerr_set_liberr(&cn.last_err, rv, null, 0);
                    self.startClosing(cn);
                    continue;
                }
                cn.markDirty();
            }
        }
        if (t >= self.last_gc + std.time.ns_per_s) {
            self.last_gc = t;
            self.gcFragments(t);
        }
    }

    fn flush(self: *Server) void {
        var i: usize = 0;
        while (i < self.dirty.items.len) : (i += 1) {
            const cn = self.dirty.items[i];
            cn.in_dirty = false;
            if (cn.dead) continue;
            self.processWake(cn);
            if (cn.want_close and cn.state == .normal) {
                self.startClosing(cn);
                continue;
            }
            self.writeConn(cn);
        }
        self.dirty.clearRetainingCapacity();
    }

    fn collectGarbage(self: *Server) void {
        for (self.garbage_streams.items) |s| self.alloc.destroy(s);
        self.garbage_streams.clearRetainingCapacity();
        for (self.garbage_sessions.items) |u| self.alloc.destroy(u);
        self.garbage_sessions.clearRetainingCapacity();
        for (self.garbage_conns.items) |cn| {
            // swap-remove from conns
            const idx = cn.index;
            const last = self.conns.items[self.conns.items.len - 1];
            self.conns.items[idx] = last;
            last.index = idx;
            _ = self.conns.pop();
            self.alloc.destroy(cn);
        }
        self.garbage_conns.clearRetainingCapacity();
    }

    // --------------------------------------------------------------------
    // UDP listener
    // --------------------------------------------------------------------

    fn onListenerReadable(self: *Server) void {
        // recvmmsg() + UDP GRO: one syscall returns up to RX_BATCH datagrams, and
        // each may be a GRO super-packet carrying many same-size QUIC packets.
        var msgs: [RX_BATCH]MMsgHdr = undefined;
        var iovs: [RX_BATCH]c.struct_iovec = undefined;
        var names: [RX_BATCH]Addr = undefined;
        var ctrl: [RX_BATCH][64]u8 align(8) = undefined;
        var rounds: usize = 0;
        while (rounds < 64) : (rounds += 1) {
            for (0..RX_BATCH) |i| {
                iovs[i] = .{ .iov_base = self.rxslab[i * RX_SLOT ..].ptr, .iov_len = RX_SLOT };
                msgs[i] = std.mem.zeroes(MMsgHdr);
                msgs[i].hdr.msg_name = @ptrCast(&names[i].ss);
                msgs[i].hdr.msg_namelen = @sizeOf(c.struct_sockaddr_storage);
                msgs[i].hdr.msg_iov = &iovs[i];
                msgs[i].hdr.msg_iovlen = 1;
                msgs[i].hdr.msg_control = &ctrl[i];
                msgs[i].hdr.msg_controllen = ctrl[i].len;
            }
            const n = recvmmsg(self.lev.fd, &msgs, RX_BATCH, 0, null);
            if (n <= 0) {
                if (n < 0 and cmod.errno() == c.EINTR) continue;
                break;
            }
            const cnt: usize = @intCast(n);
            for (0..cnt) |i| {
                names[i].len = msgs[i].hdr.msg_namelen;
                const len: usize = msgs[i].len;
                const buf = self.rxslab[i * RX_SLOT ..][0..len];
                const seg = groSize(&ctrl[i], msgs[i].hdr.msg_controllen);
                if (seg == 0 or seg >= len) {
                    self.handlePacket(buf, &names[i]);
                } else {
                    var off: usize = 0;
                    while (off < len) : (off += seg) {
                        self.handlePacket(buf[off..@min(len, off + seg)], &names[i]);
                    }
                }
            }
            if (cnt < RX_BATCH) break;
        }
    }

    fn onListenerWritable(self: *Server) void {
        var i: usize = 0;
        while (i < self.blocked_conns.items.len) {
            const cn = self.blocked_conns.items[i];
            if (cn.dead or cn.blocked_buf == null) {
                _ = self.blocked_conns.swapRemove(i);
                continue;
            }
            const buf = cn.blocked_buf.?;
            const r = self.sendTo(&cn.blocked_dst, buf[0..cn.blocked_len], cn.blocked_gso);
            if (r == .blocked) {
                i += 1;
                continue;
            }
            self.alloc.free(buf);
            cn.blocked_buf = null;
            _ = self.blocked_conns.swapRemove(i);
            cn.markDirty();
        }
        if (self.blocked_conns.items.len == 0) self.epollMod(self.lev.fd, c.EPOLLIN, &self.lev);
    }

    const SendResult = enum { ok, blocked, failed };

    fn sendTo(self: *Server, dst: *const Addr, data: []const u8, gso: usize) SendResult {
        var iov = c.struct_iovec{ .iov_base = @constCast(data.ptr), .iov_len = data.len };
        var cbuf: [32]u8 align(8) = undefined;
        var msg = std.mem.zeroes(c.struct_msghdr);
        msg.msg_name = @constCast(@ptrCast(dst.saConst()));
        msg.msg_namelen = dst.len;
        msg.msg_iov = &iov;
        msg.msg_iovlen = 1;
        if (self.gso and gso > 0 and data.len > gso) {
            // struct cmsghdr { size_t len; int level; int type; } + u16 segment size
            const hdr_len = @sizeOf(usize) + 2 * @sizeOf(c_int);
            @memset(&cbuf, 0);
            std.mem.writeInt(usize, cbuf[0..@sizeOf(usize)], hdr_len + 2, .little);
            std.mem.writeInt(c_int, cbuf[@sizeOf(usize)..][0..4], c.IPPROTO_UDP, .little);
            std.mem.writeInt(c_int, cbuf[@sizeOf(usize) + 4 ..][0..4], 103, .little); // UDP_SEGMENT
            std.mem.writeInt(u16, cbuf[hdr_len..][0..2], @intCast(gso), .little);
            msg.msg_control = &cbuf;
            msg.msg_controllen = (hdr_len + 2 + 7) & ~@as(usize, 7);
        }
        while (true) {
            const n = c.sendmsg(self.lev.fd, &msg, 0);
            if (n >= 0) return .ok;
            const e = cmod.errno();
            if (e == c.EINTR) continue;
            if (e == c.EAGAIN or e == c.EWOULDBLOCK) return .blocked;
            if (e == c.EIO and msg.msg_control != null) {
                // GSO not supported on this path: fall back to per-packet sends.
                log.warn("GSO send failed, disabling GSO", .{});
                self.gso = false;
                var off: usize = 0;
                while (off < data.len) {
                    const l = @min(gso, data.len - off);
                    _ = self.sendTo(dst, data[off .. off + l], 0);
                    off += l;
                }
                return .ok;
            }
            return .failed;
        }
    }

    fn handlePacket(self: *Server, data: []u8, src: *Addr) void {
        var vc: c.ngtcp2_version_cid = undefined;
        const rv = c.ngtcp2_pkt_decode_version_cid(&vc, data.ptr, data.len, SCID_LEN);
        if (rv == c.NGTCP2_ERR_VERSION_NEGOTIATION) {
            self.sendVersionNegotiation(&vc, src);
            return;
        }
        if (rv != 0) return;
        if (self.cids.get(CidKey.from(vc.dcid, vc.dcidlen))) |cn| {
            self.connRead(cn, data, src);
            return;
        }
        if (vc.version == 0) return; // short header for unknown connection
        var hd: c.ngtcp2_pkt_hd = undefined;
        if (c.ngtcp2_accept(&hd, data.ptr, data.len) != 0) return;
        const cn = self.newConn(&hd, src) catch |e| {
            log.warn("failed to create connection: {s}", .{@errorName(e)});
            return;
        };
        self.connRead(cn, data, src);
    }

    fn sendVersionNegotiation(self: *Server, vc: *const c.ngtcp2_version_cid, src: *Addr) void {
        var buf: [256]u8 = undefined;
        const sv = [_]u32{ c.NGTCP2_PROTO_VER_V1, c.NGTCP2_PROTO_VER_V2 };
        var rb: [1]u8 = undefined;
        std.crypto.random.bytes(&rb);
        const n = c.ngtcp2_pkt_write_version_negotiation(&buf, buf.len, rb[0], vc.scid, vc.scidlen, vc.dcid, vc.dcidlen, &sv, sv.len);
        if (n > 0) _ = self.sendTo(src, buf[0..@intCast(n)], 0);
    }

    fn newConn(self: *Server, hd: *const c.ngtcp2_pkt_hd, src: *Addr) !*Conn {
        const cfg = self.cfg;
        const cn = try self.alloc.create(Conn);
        errdefer self.alloc.destroy(cn);
        const t = now();
        cn.* = .{ .srv = self, .remote = src.*, .auth_deadline = t + cfg.auth_timeout_ms * std.time.ns_per_ms };
        c.ngtcp2_ccerr_default(&cn.last_err);

        var scid = std.mem.zeroes(c.ngtcp2_cid);
        scid.datalen = SCID_LEN;
        std.crypto.random.bytes(scid.data[0..SCID_LEN]);

        var settings: c.ngtcp2_settings = undefined;
        cmod.tz_settings_default(&settings);
        settings.initial_ts = t;
        settings.cc_algo = if (std.mem.eql(u8, cfg.congestion_control, "cubic"))
            c.NGTCP2_CC_ALGO_CUBIC
        else if (std.mem.eql(u8, cfg.congestion_control, "new_reno") or std.mem.eql(u8, cfg.congestion_control, "reno"))
            c.NGTCP2_CC_ALGO_RENO
        else
            c.NGTCP2_CC_ALGO_BBR;
        settings.max_window = cfg.max_conn_window;
        settings.max_stream_window = cfg.max_stream_window;
        settings.handshake_timeout = 10 * c.NGTCP2_SECONDS;
        settings.no_pmtud = @intFromBool(!cfg.pmtu);
        if (cfg.max_udp_payload > 0) settings.max_tx_udp_payload_size = cfg.max_udp_payload;

        var params: c.ngtcp2_transport_params = undefined;
        cmod.tz_transport_params_default(&params);
        params.initial_max_stream_data_bidi_local = cfg.stream_window;
        params.initial_max_stream_data_bidi_remote = cfg.stream_window;
        params.initial_max_stream_data_uni = 128 * 1024;
        params.initial_max_data = cfg.conn_window;
        params.initial_max_streams_bidi = cfg.max_concurrent_bidi;
        params.initial_max_streams_uni = cfg.max_concurrent_uni;
        params.max_idle_timeout = cfg.max_idle_time_ms * c.NGTCP2_MILLISECONDS;
        params.active_connection_id_limit = 7;
        params.max_datagram_frame_size = 65535;
        params.original_dcid = hd.dcid;
        params.original_dcid_present = 1;
        params.stateless_reset_token_present = 1;
        if (c.ngtcp2_crypto_generate_stateless_reset_token(&params.stateless_reset_token, &self.static_secret, self.static_secret.len, &scid) != 0)
            return error.ResetToken;

        const path = c.ngtcp2_path{ .local = toNgAddr(&self.local), .remote = toNgAddr(src), .user_data = null };
        var conn: ?*c.ngtcp2_conn = null;
        if (cmod.tz_conn_server_new(&conn, &hd.scid, &scid, &path, hd.version, &self.callbacks, &settings, &params, cn) != 0)
            return error.ConnNew;
        cn.conn = conn;
        cn.conn_ref = .{ .get_conn = cbGetConn, .user_data = cn };
        if (cmod.tz_conn_tls_new(self.ssl_ctx, conn, &cn.conn_ref, @intFromBool(cfg.zero_rtt_handshake), &cn.ssl, &cn.ossl) != 0) {
            c.ngtcp2_conn_del(conn);
            return error.TlsNew;
        }
        cn.index = self.conns.items.len;
        try self.conns.append(self.alloc, cn);
        self.addCid(cn, CidKey.fromCid(&scid));
        self.addCid(cn, CidKey.fromCid(&hd.dcid));
        log.debug("new connection", .{});
        return cn;
    }

    fn addCid(self: *Server, cn: *Conn, k: CidKey) void {
        self.cids.put(self.alloc, k, cn) catch return;
        cn.cids.append(self.alloc, k) catch {};
    }

    fn connRead(self: *Server, cn: *Conn, data: []u8, src: *Addr) void {
        switch (cn.state) {
            .closing => {
                if (cn.closebuf_len > 0) _ = self.sendTo(src, cn.closebuf[0..cn.closebuf_len], 0);
                return;
            },
            .draining => return,
            .normal => {},
        }
        const path = c.ngtcp2_path{ .local = toNgAddr(&self.local), .remote = toNgAddr(src), .user_data = null };
        var pi = std.mem.zeroes(c.ngtcp2_pkt_info);
        const rv = cmod.tz_conn_read_pkt(cn.conn, &path, &pi, data.ptr, data.len, now());
        if (rv != 0) {
            log.debug("read_pkt: {s}", .{c.ngtcp2_strerror(rv)});
            switch (rv) {
                c.NGTCP2_ERR_DRAINING => self.startDraining(cn),
                c.NGTCP2_ERR_DROP_CONN => self.destroyConn(cn),
                c.NGTCP2_ERR_CRYPTO => {
                    if (!cn.want_close) c.ngtcp2_ccerr_set_tls_alert(&cn.last_err, c.ngtcp2_conn_get_tls_alert(cn.ng()), null, 0);
                    self.startClosing(cn);
                },
                else => {
                    if (!cn.want_close) c.ngtcp2_ccerr_set_liberr(&cn.last_err, rv, null, 0);
                    self.startClosing(cn);
                },
            }
            return;
        }
        // Follow ngtcp2's current path (it handles migration and path
        // validation); never redirect replies to an unvalidated source.
        setFromNg(&cn.remote, &c.ngtcp2_conn_get_path(cn.ng()).*.remote);
        cn.markDirty();
    }

    // --------------------------------------------------------------------
    // writing
    // --------------------------------------------------------------------

    fn writeConn(self: *Server, cn: *Conn) void {
        if (cn.state != .normal or cn.blocked_buf != null) return;
        if (c.ngtcp2_conn_in_closing_period(cn.ng()) != 0 or c.ngtcp2_conn_in_draining_period(cn.ng()) != 0) return;
        var rounds: usize = 0;
        while (rounds < 16) : (rounds += 1) {
            var ps: c.ngtcp2_path_storage = undefined;
            c.ngtcp2_path_storage_zero(&ps);
            var pi = std.mem.zeroes(c.ngtcp2_pkt_info);
            var gso: usize = 0;
            const ts = now();
            const maxpl = c.ngtcp2_conn_get_max_tx_udp_payload_size(cn.ng());
            const burst: usize = if (self.gso) self.cfg.gso_burst else 1;
            const buflen = @min(self.txbuf.len, maxpl * burst);
            const nw = cmod.tz_conn_write_aggregate_pkt2(cn.conn, &ps.path, &pi, &self.txbuf, buflen, &gso, cbWritePkt, burst, ts);
            if (nw < 0) {
                if (!cn.want_close) c.ngtcp2_ccerr_set_liberr(&cn.last_err, @intCast(nw), null, 0);
                log.debug("write: {s}", .{c.ngtcp2_strerror(@intCast(nw))});
                self.startClosing(cn);
                return;
            }
            c.ngtcp2_conn_update_pkt_tx_time(cn.ng(), ts);
            if (nw == 0) return;
            const data = self.txbuf[0..@intCast(nw)];
            // ngtcp2 tells us which path each burst belongs to (e.g. PATH_CHALLENGE
            // probes go to the candidate address, everything else to the current one).
            var dst = cn.remote;
            setFromNg(&dst, &ps.path.remote);
            switch (self.sendTo(&dst, data, gso)) {
                .ok, .failed => {},
                .blocked => {
                    const copy = self.alloc.dupe(u8, data) catch return;
                    cn.blocked_buf = copy;
                    cn.blocked_len = copy.len;
                    cn.blocked_gso = gso;
                    cn.blocked_dst = dst;
                    self.blocked_conns.append(self.alloc, cn) catch {};
                    self.epollMod(self.lev.fd, c.EPOLLIN | c.EPOLLOUT, &self.lev);
                    return;
                },
            }
        }
        // more to write: come back on the next loop iteration
        cn.markDirty();
    }

    fn startClosing(self: *Server, cn: *Conn) void {
        if (cn.state != .normal) return;
        self.teardownApp(cn);
        cn.state = .closing;
        cn.deadline = now() + 3 * c.ngtcp2_conn_get_pto(cn.ng());
        if (c.ngtcp2_conn_in_closing_period(cn.ng()) != 0 or c.ngtcp2_conn_in_draining_period(cn.ng()) != 0) return;
        var ps: c.ngtcp2_path_storage = undefined;
        c.ngtcp2_path_storage_zero(&ps);
        var pi = std.mem.zeroes(c.ngtcp2_pkt_info);
        const n = cmod.tz_conn_write_connection_close(cn.conn, &ps.path, &pi, &cn.closebuf, cn.closebuf.len, &cn.last_err, now());
        if (n > 0) {
            cn.closebuf_len = @intCast(n);
            _ = self.sendTo(&cn.remote, cn.closebuf[0..cn.closebuf_len], 0);
        } else {
            // nothing to send (e.g. handshake not started): drop right away
            self.destroyConn(cn);
        }
    }

    fn startDraining(self: *Server, cn: *Conn) void {
        if (cn.state != .normal) return;
        self.teardownApp(cn);
        cn.state = .draining;
        cn.deadline = now() + 3 * c.ngtcp2_conn_get_pto(cn.ng());
    }

    fn destroyConn(self: *Server, cn: *Conn) void {
        if (cn.dead) return;
        if (cn.state == .normal) self.teardownApp(cn);
        cn.dead = true;
        for (cn.cids.items) |k| {
            if (self.cids.get(k)) |owner| {
                if (owner == cn) _ = self.cids.remove(k);
            }
        }
        cn.cids.deinit(self.alloc);
        c.ngtcp2_conn_del(cn.conn);
        cmod.tz_conn_tls_free(cn.ssl, cn.ossl);
        cn.conn = null;
        if (cn.blocked_buf) |b| self.alloc.free(b);
        cn.blocked_buf = null;
        self.garbage_conns.append(self.alloc, cn) catch {};
        log.debug("connection destroyed", .{});
    }

    /// Releases every TCP/UDP resource of the connection.
    fn teardownApp(self: *Server, cn: *Conn) void {
        var it = cn.streams.valueIterator();
        while (it.next()) |sp| self.releaseStream(sp.*);
        cn.streams.deinit(self.alloc);
        cn.streams = .{};
        cn.q_head = null;
        cn.q_tail = null;
        cn.wake.deinit(self.alloc);
        cn.wake = .{};
        var ui = cn.sessions.valueIterator();
        while (ui.next()) |u| self.releaseSession(u.*);
        cn.sessions.deinit(self.alloc);
        cn.sessions = .{};
        for (cn.dgram_q.items[cn.dgram_head..]) |d| self.alloc.free(d);
        cn.dgram_q.deinit(self.alloc);
        cn.dgram_q = .{};
        cn.dgram_head = 0;
        for (cn.pending.items) |p| self.alloc.free(p.data);
        cn.pending.deinit(self.alloc);
        cn.pending = .{};
    }

    fn releaseStream(self: *Server, s: *Stream) void {
        if (s.dead) return;
        s.dead = true;
        if (s.ev.fd >= 0) {
            _ = c.close(s.ev.fd); // also removes it from epoll
            s.ev.fd = -1;
        }
        if (s.dns) |r| {
            r.cancelled = true;
            s.dns = null;
        }
        if (s.alts) |al| {
            self.alloc.destroy(al);
            s.alts = null;
        }
        s.rx.deinit(self.alloc);
        s.uni.deinit(self.alloc);
        s.tx.deinit(&self.pool);
        self.garbage_streams.append(self.alloc, s) catch {};
    }

    fn releaseSession(self: *Server, u: *UdpSession) void {
        if (u.dead) return;
        u.dead = true;
        if (u.ev.fd >= 0) _ = c.close(u.ev.fd);
        u.ev.fd = -1;
        for (u.dns_pending.items) |r| r.cancelled = true;
        u.dns_pending.deinit(self.alloc);
        var fi = u.frags.valueIterator();
        while (fi.next()) |f| self.freeFrag(f.*);
        u.frags.deinit(self.alloc);
        self.garbage_sessions.append(self.alloc, u) catch {};
    }

    fn freeFrag(self: *Server, f: *FragBuf) void {
        for (f.parts) |p| if (p) |b| self.alloc.free(b);
        self.alloc.free(f.parts);
        self.alloc.destroy(f);
    }

    // --------------------------------------------------------------------
    // streams: deferred work
    // --------------------------------------------------------------------

    fn processWake(self: *Server, cn: *Conn) void {
        var i: usize = 0;
        while (i < cn.wake.items.len) : (i += 1) {
            const s = cn.wake.items[i];
            s.in_wake = false;
            if (s.dead) continue;
            if (s.want_abort) {
                self.abortStream(s);
                continue;
            }
            if (s.want_flush) {
                s.want_flush = false;
                if (s.phase == .relaying) self.flushRx(s);
                if (s.dead) continue;
            }
            if (s.phase == .relaying and s.tcp_readable and s.tx.buffered() < MAX_TX_BUF) self.tcpRead(s);
        }
        cn.wake.clearRetainingCapacity();
    }

    fn abortStream(_: *Server, s: *Stream) void {
        const cn = s.conn;
        if (s.ev.fd >= 0) {
            _ = c.close(s.ev.fd);
            s.ev.fd = -1;
        }
        if (s.dns) |r| {
            r.cancelled = true;
            s.dns = null;
        }
        s.phase = .failed;
        cn.qRemove(s);
        _ = c.ngtcp2_conn_shutdown_stream(cn.ng(), 0, s.id, 0);
        cn.markDirty();
    }

    fn startRelay(self: *Server, s: *Stream) void {
        var a = Addr{};
        switch (s.target) {
            .ipv4 => |v| {
                const sin: *c.struct_sockaddr_in = @ptrCast(@alignCast(&a.ss));
                sin.sin_family = c.AF_INET;
                sin.sin_port = std.mem.nativeToBig(u16, v.port);
                @memcpy(std.mem.asBytes(&sin.sin_addr), &v.ip);
                a.len = @sizeOf(c.struct_sockaddr_in);
            },
            .ipv6 => |v| {
                const sin6: *c.struct_sockaddr_in6 = @ptrCast(@alignCast(&a.ss));
                sin6.sin6_family = c.AF_INET6;
                sin6.sin6_port = std.mem.nativeToBig(u16, v.port);
                @memcpy(std.mem.asBytes(&sin6.sin6_addr), &v.ip);
                a.len = @sizeOf(c.struct_sockaddr_in6);
            },
            .domain => {
                const r = self.alloc.create(Req) catch {
                    self.abortStream(s);
                    return;
                };
                r.* = .{ .kind = .tcp, .owner = s, .port = s.target.port(), .mode = self.ip_mode };
                const name = s.target.domainName();
                @memcpy(r.host[0..name.len], name);
                r.host_len = name.len;
                s.dns = r;
                s.phase = .resolving;
                self.resolver.submit(r);
                return;
            },
            .none => {
                self.abortStream(s);
                return;
            },
        }
        self.tcpConnect(s, &a);
    }

    /// Destination guard (tuic-server's `experimental.drop_loopback/drop_private`).
    fn blocked(self: *Server, a: *const Addr) bool {
        var v4: ?[4]u8 = null;
        var v6: ?[16]u8 = null;
        if (a.ss.ss_family == c.AF_INET) {
            const sin: *const c.struct_sockaddr_in = @ptrCast(@alignCast(&a.ss));
            v4 = std.mem.asBytes(&sin.sin_addr)[0..4].*;
        } else {
            const sin6: *const c.struct_sockaddr_in6 = @ptrCast(@alignCast(&a.ss));
            const b = std.mem.asBytes(&sin6.sin6_addr)[0..16].*;
            if (std.mem.allEqual(u8, b[0..10], 0) and b[10] == 0xff and b[11] == 0xff) v4 = b[12..16].* else v6 = b;
        }
        if (v4) |ip| {
            if (self.cfg.drop_loopback and ip[0] == 127) return true;
            if (self.cfg.drop_private and (ip[0] == 10 or (ip[0] == 172 and ip[1] & 0xf0 == 16) or
                (ip[0] == 192 and ip[1] == 168) or (ip[0] == 169 and ip[1] == 254) or
                (ip[0] == 100 and ip[1] & 0xc0 == 64) or ip[0] == 0)) return true;
            return false;
        }
        const ip = v6.?;
        if (self.cfg.drop_loopback and std.mem.allEqual(u8, ip[0..15], 0) and ip[15] == 1) return true;
        if (self.cfg.drop_private and ((ip[0] & 0xfe) == 0xfc or (ip[0] == 0xfe and ip[1] & 0xc0 == 0x80) or std.mem.allEqual(u8, &ip, 0))) return true;
        return false;
    }

    /// Connects to the next untried address of a resolved domain, or aborts.
    fn tcpNextOrAbort(self: *Server, s: *Stream) void {
        if (s.ev.fd >= 0) {
            _ = c.close(s.ev.fd);
            s.ev.fd = -1;
        }
        const al = s.alts orelse return self.abortStream(s);
        while (al.next < al.n) {
            const i = al.next;
            al.next += 1;
            var a = Addr{ .len = al.lens[i] };
            @memcpy(std.mem.asBytes(&a.ss)[0..al.lens[i]], std.mem.asBytes(&al.addrs[i])[0..al.lens[i]]);
            if (self.blocked(&a)) continue;
            if (self.tcpAttempt(s, &a)) return;
        }
        self.abortStream(s);
    }

    fn tcpConnect(self: *Server, s: *Stream, a: *const Addr) void {
        if (self.blocked(a)) {
            log.debug("destination rejected by guard", .{});
            self.abortStream(s);
            return;
        }
        if (!self.tcpAttempt(s, a)) self.abortStream(s);
    }

    /// Starts a non-blocking connect; false when it failed immediately.
    fn tcpAttempt(self: *Server, s: *Stream, a: *const Addr) bool {
        const fam: c_int = a.ss.ss_family;
        const fd = c.socket(fam, c.SOCK_STREAM | c.SOCK_NONBLOCK | c.SOCK_CLOEXEC, 0);
        if (fd < 0) return false;
        const one: c_int = 1;
        _ = c.setsockopt(fd, c.IPPROTO_TCP, c.TCP_NODELAY, &one, @sizeOf(c_int));
        if (s.alts) |al| {
            // another address is waiting: give up on a silent one after ~3 s
            // (1 SYN retry) instead of the kernel's ~2 min
            if (al.next < al.n) {
                const syncnt: c_int = 1;
                _ = c.setsockopt(fd, c.IPPROTO_TCP, c.TCP_SYNCNT, &syncnt, @sizeOf(c_int));
            }
        }
        s.ev.fd = fd;
        const rv = c.connect(fd, a.saConst(), a.len);
        if (rv != 0 and cmod.errno() != c.EINPROGRESS) {
            log.debug("connect failed: errno {d}", .{cmod.errno()});
            _ = c.close(fd);
            s.ev.fd = -1;
            return false;
        }
        s.phase = .connecting;
        self.epollAdd(fd, @as(u32, c.EPOLLIN | c.EPOLLOUT | c.EPOLLRDHUP) | EPOLLET, &s.ev) catch {
            _ = c.close(fd);
            s.ev.fd = -1;
            return false;
        };
        return true;
    }

    fn onTcpEvent(self: *Server, s: *Stream, events: u32) void {
        const cn = s.conn;
        if (s.phase == .connecting) {
            if (events & (c.EPOLLOUT | c.EPOLLERR | c.EPOLLHUP) == 0) return;
            var err: c_int = 0;
            var len: c.socklen_t = @sizeOf(c_int);
            _ = c.getsockopt(s.ev.fd, c.SOL_SOCKET, c.SO_ERROR, &err, &len);
            if (err != 0) {
                log.debug("tcp connect error {d}", .{err});
                self.tcpNextOrAbort(s);
                return;
            }
            s.phase = .relaying;
            s.tcp_writable = true;
            s.tcp_readable = true;
            self.flushRx(s);
            if (!s.dead and s.phase == .relaying) self.tcpRead(s);
            cn.markDirty();
            return;
        }
        if (s.phase != .relaying) return;
        if (events & c.EPOLLOUT != 0) {
            s.tcp_writable = true;
            self.flushRx(s);
        }
        if (s.phase != .relaying) return;
        if (events & (c.EPOLLIN | c.EPOLLRDHUP | c.EPOLLHUP | c.EPOLLERR) != 0) {
            s.tcp_readable = true;
            self.tcpRead(s);
        }
    }

    fn tcpRead(self: *Server, s: *Stream) void {
        const cn = s.conn;
        if (s.tcp_eof or s.ev.fd < 0) {
            s.tcp_readable = false;
            return;
        }
        var got = false;
        while (s.tx.buffered() < MAX_TX_BUF) {
            const w = s.tx.writable(&self.pool) catch break;
            const n = c.read(s.ev.fd, w.ptr, w.len);
            if (n > 0) {
                s.tx.commit(@intCast(n));
                got = true;
                continue;
            }
            if (n == 0) {
                s.tcp_eof = true;
                s.tcp_readable = false;
                s.tx_fin = true;
                got = true;
                break;
            }
            const e = cmod.errno();
            if (e == c.EINTR) continue;
            s.tcp_readable = false;
            if (e != c.EAGAIN and e != c.EWOULDBLOCK) {
                self.abortStream(s);
                return;
            }
            break;
        }
        if (got) cn.enqueue(s);
    }

    fn flushRx(self: *Server, s: *Stream) void {
        const cn = s.conn;
        var used_bytes: usize = 0;
        while (s.rxPending() > 0 and s.tcp_writable) {
            const p = s.rx.items[s.rx_off..];
            const n = c.send(s.ev.fd, p.ptr, p.len, c.MSG_NOSIGNAL);
            if (n < 0) {
                const e = cmod.errno();
                if (e == c.EINTR) continue;
                if (e == c.EAGAIN or e == c.EWOULDBLOCK) {
                    s.tcp_writable = false;
                    break;
                }
                self.abortStream(s);
                return;
            }
            s.rx_off += @intCast(n);
            used_bytes += @intCast(n);
        }
        if (s.rx_off == s.rx.items.len) {
            s.rx.clearRetainingCapacity();
            s.rx_off = 0;
            if (s.rx.capacity > 256 * 1024) {
                s.rx.deinit(self.alloc);
                s.rx = .{};
            }
        } else if (s.rx_off > 64 * 1024 and s.rx_off * 2 > s.rx.items.len) {
            const rest = s.rx.items.len - s.rx_off;
            std.mem.copyForwards(u8, s.rx.items[0..rest], s.rx.items[s.rx_off..]);
            s.rx.shrinkRetainingCapacity(rest);
            s.rx_off = 0;
        }
        if (used_bytes > 0) {
            _ = c.ngtcp2_conn_extend_max_stream_offset(cn.ng(), s.id, used_bytes);
            c.ngtcp2_conn_extend_max_offset(cn.ng(), used_bytes);
            cn.markDirty();
        }
        if (s.rxPending() == 0 and s.rx_fin and !s.tcp_shut_wr and s.ev.fd >= 0) {
            _ = c.shutdown(s.ev.fd, c.SHUT_WR);
            s.tcp_shut_wr = true;
        }
    }

    /// QUIC -> TCP data of a bidirectional stream.
    fn onBidiData(self: *Server, s: *Stream, data: []const u8, fin: bool) void {
        const cn = s.conn;
        var d = data;
        if (s.phase == .header) {
            const take = @min(d.len, s.hdr.len - s.hdr_len);
            @memcpy(s.hdr[s.hdr_len .. s.hdr_len + take], d[0..take]);
            s.hdr_len += take;
            d = d[take..];
            if (s.hdr_len < 2) {
                if (fin) s.want_abort = true;
                if (fin) cn.wakeStream(s);
                return;
            }
            if (s.hdr[0] != proto.VERSION or s.hdr[1] != @intFromEnum(proto.Cmd.connect)) {
                log.debug("bad bidi header {x} {x}", .{ s.hdr[0], s.hdr[1] });
                s.want_abort = true;
                cn.wakeStream(s);
                return;
            }
            const r = proto.parseAddress(s.hdr[2..s.hdr_len]) catch |e| {
                if (e == error.Incomplete and s.hdr_len < s.hdr.len and !fin) return;
                s.want_abort = true;
                cn.wakeStream(s);
                return;
            };
            const used = 2 + r.len;
            s.target = r.addr;
            // bytes of the header buffer past the address are payload
            if (s.hdr_len > used) s.rx.appendSlice(self.alloc, s.hdr[used..s.hdr_len]) catch {};
            _ = c.ngtcp2_conn_extend_max_stream_offset(cn.ng(), s.id, used);
            c.ngtcp2_conn_extend_max_offset(cn.ng(), used);
            if (cn.authed) {
                s.phase = .resolving; // placeholder until startRelay picks a state
                self.startRelay(s);
            } else {
                s.phase = .wait_auth;
            }
        }
        if (s.dead or s.phase == .failed) return;
        if (d.len > 0) {
            if (d.len > 0) s.rx.appendSlice(self.alloc, d) catch {
                s.want_abort = true;
                cn.wakeStream(s);
                return;
            };
        }
        if (fin) s.rx_fin = true;
        // Coalesce: many QUIC packets land in one event-loop pass; write them to
        // TCP with a single send() from processWake instead of one per packet.
        if (s.phase == .relaying) {
            s.want_flush = true;
            cn.wakeStream(s);
        }
    }

    // --------------------------------------------------------------------
    // TUIC commands
    // --------------------------------------------------------------------

    fn onUniComplete(self: *Server, cn: *Conn, data: []const u8) void {
        if (data.len < 2 or data[0] != proto.VERSION) return;
        const cmd: proto.Cmd = @enumFromInt(data[1]);
        if (cmd == .authenticate) {
            if (data.len < 2 + 48) return;
            self.handleAuth(cn, data[2..50].*);
            return;
        }
        if (!cn.authed) {
            self.deferPending(cn, data, false);
            return;
        }
        self.processUni(cn, data);
    }

    fn processUni(self: *Server, cn: *Conn, data: []const u8) void {
        switch (@as(proto.Cmd, @enumFromInt(data[1]))) {
            .packet => {
                const p = proto.parsePacket(data) catch return;
                self.onClientPacket(cn, &p.hdr, p.payload, .quic);
            },
            .dissociate => {
                if (data.len < 4) return;
                const assoc = std.mem.readInt(u16, data[2..4], .big);
                if (cn.sessions.fetchRemove(assoc)) |kv| self.releaseSession(kv.value);
                log.debug("dissociate {d}", .{assoc});
            },
            else => {},
        }
    }

    fn onDatagram(self: *Server, cn: *Conn, data: []const u8) void {
        if (data.len < 2 or data[0] != proto.VERSION) return;
        if (!cn.authed) {
            if (data[1] == @intFromEnum(proto.Cmd.packet)) self.deferPending(cn, data, true);
            return;
        }
        self.processDatagram(cn, data);
    }

    fn processDatagram(self: *Server, cn: *Conn, data: []const u8) void {
        switch (@as(proto.Cmd, @enumFromInt(data[1]))) {
            .packet => {
                const p = proto.parsePacket(data) catch return;
                self.onClientPacket(cn, &p.hdr, p.payload, .native);
            },
            else => {}, // heartbeat
        }
    }

    fn deferPending(self: *Server, cn: *Conn, data: []const u8, is_dgram: bool) void {
        if (cn.pending.items.len >= MAX_PENDING) return;
        const copy = self.alloc.dupe(u8, data) catch return;
        cn.pending.append(self.alloc, .{ .data = copy, .is_dgram = is_dgram }) catch self.alloc.free(copy);
    }

    fn handleAuth(self: *Server, cn: *Conn, body: [48]u8) void {
        if (cn.authed) {
            cn.requestClose(0, "already authenticated");
            return;
        }
        if (!cn.hs_done) {
            cn.pending_auth = body;
            return;
        }
        const uuid = body[0..16].*;
        const token = body[16..48];
        const dummy = "\x00\x00\x00\x00\x00\x00\x00\x00";
        const known = self.users.get(uuid);
        const pw: []const u8 = known orelse dummy;
        var expect: [32]u8 = undefined;
        const ok_export = cmod.tz_export_token(cn.ssl, &uuid, 16, pw.ptr, pw.len, &expect) == 0;
        var diff: u8 = 0;
        for (token, expect) |a, b| diff |= a ^ b;
        if (known == null or !ok_export or diff != 0) {
            log.info("authentication failed", .{});
            cn.requestClose(0, "auth failed");
            return;
        }
        cn.authed = true;
        log.info("authenticated {x}", .{uuid});
        // resume paused work
        var waiting = std.ArrayListUnmanaged(*Stream){};
        defer waiting.deinit(self.alloc);
        var it = cn.streams.valueIterator();
        while (it.next()) |sp| {
            if (sp.*.phase == .wait_auth) waiting.append(self.alloc, sp.*) catch {};
        }
        for (waiting.items) |s| {
            if (s.dead) continue;
            self.startRelay(s);
            if (!s.dead and s.phase == .relaying) self.flushRx(s);
        }
        var pend = cn.pending;
        cn.pending = .{};
        defer {
            for (pend.items) |p| self.alloc.free(p.data);
            pend.deinit(self.alloc);
        }
        for (pend.items) |p| {
            if (cn.state != .normal) break;
            if (p.is_dgram) self.processDatagram(cn, p.data) else self.processUni(cn, p.data);
        }
        cn.markDirty();
    }

    // --------------------------------------------------------------------
    // UDP relay
    // --------------------------------------------------------------------

    fn getSession(self: *Server, cn: *Conn, assoc: u16, mode: UdpMode) ?*UdpSession {
        if (cn.sessions.get(assoc)) |u| return u;
        var v6 = self.cfg.udp_relay_ipv6 and self.ip_mode != .v4only;
        var fd = c.socket(if (v6) c.AF_INET6 else c.AF_INET, c.SOCK_DGRAM | c.SOCK_NONBLOCK | c.SOCK_CLOEXEC, 0);
        if (fd < 0 and v6) {
            v6 = false; // no IPv6 in this kernel
            fd = c.socket(c.AF_INET, c.SOCK_DGRAM | c.SOCK_NONBLOCK | c.SOCK_CLOEXEC, 0);
        }
        if (fd < 0) return null;
        if (v6) {
            const zero: c_int = 0;
            _ = c.setsockopt(fd, c.IPPROTO_IPV6, c.IPV6_V6ONLY, &zero, @sizeOf(c_int));
        }
        const u = self.alloc.create(UdpSession) catch {
            _ = c.close(fd);
            return null;
        };
        u.* = .{ .conn = cn, .assoc = assoc, .mode = mode, .v6 = v6 };
        u.ev.fd = fd;
        self.epollAdd(fd, c.EPOLLIN, &u.ev) catch {
            _ = c.close(fd);
            self.alloc.destroy(u);
            return null;
        };
        cn.sessions.put(self.alloc, assoc, u) catch {
            _ = c.close(fd);
            self.alloc.destroy(u);
            return null;
        };
        log.debug("udp session {d} ({s})", .{ assoc, @tagName(mode) });
        return u;
    }

    fn onClientPacket(self: *Server, cn: *Conn, h: *const proto.PacketHdr, payload: []const u8, mode: UdpMode) void {
        if (h.frag_total == 0 or h.frag_id >= h.frag_total) return;
        const u = self.getSession(cn, h.assoc_id, mode) orelse return;
        if (h.frag_total == 1) {
            self.udpSendOut(u, &h.addr, payload);
            return;
        }
        const gop = u.frags.getOrPut(self.alloc, h.pkt_id) catch return;
        if (!gop.found_existing) {
            const f = self.alloc.create(FragBuf) catch {
                _ = u.frags.remove(h.pkt_id);
                return;
            };
            const parts = self.alloc.alloc(?[]u8, h.frag_total) catch {
                self.alloc.destroy(f);
                _ = u.frags.remove(h.pkt_id);
                return;
            };
            @memset(parts, null);
            f.* = .{ .total = h.frag_total, .parts = parts, .created = now() };
            gop.value_ptr.* = f;
        }
        const f = gop.value_ptr.*;
        if (f.total != h.frag_total or f.parts[h.frag_id] != null) return;
        f.parts[h.frag_id] = self.alloc.dupe(u8, payload) catch return;
        f.got += 1;
        if (h.frag_id == 0) f.addr = h.addr;
        if (f.got < f.total) return;
        var total: usize = 0;
        for (f.parts) |p| total += p.?.len;
        if (total <= 65535) {
            var buf: [65535]u8 = undefined;
            var off: usize = 0;
            for (f.parts) |p| {
                @memcpy(buf[off .. off + p.?.len], p.?);
                off += p.?.len;
            }
            self.udpSendOut(u, &f.addr, buf[0..off]);
        }
        _ = u.frags.remove(h.pkt_id);
        self.freeFrag(f);
    }

    fn udpSendOut(self: *Server, u: *UdpSession, addr: *const proto.Address, data: []const u8) void {
        var a = Addr{};
        switch (addr.*) {
            .ipv4 => |v| {
                if (u.v6) {
                    const sin6: *c.struct_sockaddr_in6 = @ptrCast(@alignCast(&a.ss));
                    sin6.sin6_family = c.AF_INET6;
                    sin6.sin6_port = std.mem.nativeToBig(u16, v.port);
                    const b = std.mem.asBytes(&sin6.sin6_addr);
                    @memset(b[0..10], 0);
                    b[10] = 0xff;
                    b[11] = 0xff;
                    @memcpy(b[12..16], &v.ip);
                    a.len = @sizeOf(c.struct_sockaddr_in6);
                } else {
                    const sin: *c.struct_sockaddr_in = @ptrCast(@alignCast(&a.ss));
                    sin.sin_family = c.AF_INET;
                    sin.sin_port = std.mem.nativeToBig(u16, v.port);
                    @memcpy(std.mem.asBytes(&sin.sin_addr), &v.ip);
                    a.len = @sizeOf(c.struct_sockaddr_in);
                }
            },
            .ipv6 => |v| {
                if (!u.v6) return;
                const sin6: *c.struct_sockaddr_in6 = @ptrCast(@alignCast(&a.ss));
                sin6.sin6_family = c.AF_INET6;
                sin6.sin6_port = std.mem.nativeToBig(u16, v.port);
                @memcpy(std.mem.asBytes(&sin6.sin6_addr), &v.ip);
                a.len = @sizeOf(c.struct_sockaddr_in6);
            },
            .domain => {
                if (u.dns_pending.items.len >= 64) return;
                const r = self.alloc.create(Req) catch return;
                r.* = .{ .kind = .udp, .owner = u, .port = addr.port(), .mode = if (u.v6) self.ip_mode else .v4only };
                const name = addr.domainName();
                @memcpy(r.host[0..name.len], name);
                r.host_len = name.len;
                r.payload = self.alloc.dupe(u8, data) catch {
                    self.alloc.destroy(r);
                    return;
                };
                u.dns_pending.append(self.alloc, r) catch {
                    self.alloc.free(r.payload.?);
                    self.alloc.destroy(r);
                    return;
                };
                self.resolver.submit(r);
                return;
            },
            .none => return,
        }
        if (self.blocked(&a)) return;
        _ = c.sendto(u.ev.fd, data.ptr, data.len, 0, a.saConst(), a.len);
    }

    fn onUdpReadable(self: *Server, u: *UdpSession) void {
        // batched like the listener; the slab is free here since every
        // packet is fully consumed (copied into datagrams/streams) before return
        var msgs: [RX_BATCH]MMsgHdr = undefined;
        var iovs: [RX_BATCH]c.struct_iovec = undefined;
        var names: [RX_BATCH]Addr = undefined;
        var rounds: usize = 0;
        while (rounds < 16 and !u.dead) : (rounds += 1) {
            for (0..RX_BATCH) |i| {
                iovs[i] = .{ .iov_base = self.rxslab[i * RX_SLOT ..].ptr, .iov_len = RX_SLOT };
                msgs[i] = std.mem.zeroes(MMsgHdr);
                msgs[i].hdr.msg_name = @ptrCast(&names[i].ss);
                msgs[i].hdr.msg_namelen = @sizeOf(c.struct_sockaddr_storage);
                msgs[i].hdr.msg_iov = &iovs[i];
                msgs[i].hdr.msg_iovlen = 1;
            }
            const n = recvmmsg(u.ev.fd, &msgs, RX_BATCH, 0, null);
            if (n <= 0) {
                if (n < 0 and cmod.errno() == c.EINTR) continue;
                break;
            }
            const cnt: usize = @intCast(n);
            for (0..cnt) |i| {
                if (u.dead) break;
                names[i].len = msgs[i].hdr.msg_namelen;
                self.udpReply(u, &names[i], self.rxslab[i * RX_SLOT ..][0..msgs[i].len]);
            }
            if (cnt < RX_BATCH) break;
        }
    }

    fn sockToAddress(src: *const Addr) proto.Address {
        if (src.ss.ss_family == c.AF_INET) {
            const sin: *const c.struct_sockaddr_in = @ptrCast(@alignCast(&src.ss));
            return .{ .ipv4 = .{ .ip = std.mem.asBytes(&sin.sin_addr)[0..4].*, .port = std.mem.bigToNative(u16, sin.sin_port) } };
        }
        const sin6: *const c.struct_sockaddr_in6 = @ptrCast(@alignCast(&src.ss));
        const b = std.mem.asBytes(&sin6.sin6_addr);
        const port = std.mem.bigToNative(u16, sin6.sin6_port);
        if (std.mem.allEqual(u8, b[0..10], 0) and b[10] == 0xff and b[11] == 0xff)
            return .{ .ipv4 = .{ .ip = b[12..16].*, .port = port } };
        return .{ .ipv6 = .{ .ip = b[0..16].*, .port = port } };
    }

    fn udpReply(self: *Server, u: *UdpSession, src: *const Addr, data: []const u8) void {
        const cn = u.conn;
        if (cn.state != .normal) return;
        const addr = sockToAddress(src);
        const pkt_id = u.next_pkt_id;
        u.next_pkt_id +%= 1;
        switch (u.mode) {
            .native => {
                const maxpl = cn.maxDatagramPayload();
                if (maxpl == 0) return;
                const first_hdr = 10 + addr.encodedLen();
                const rest_hdr = 10 + 1;
                if (first_hdr + data.len <= maxpl) {
                    const buf = self.alloc.alloc(u8, first_hdr + data.len) catch return;
                    const h = proto.writePacketHdr(buf, u.assoc, pkt_id, 1, 0, @intCast(data.len), &addr);
                    @memcpy(buf[h..], data);
                    cn.pushDatagram(buf);
                    return;
                }
                if (maxpl <= first_hdr + 1) return;
                const first_cap = maxpl - first_hdr;
                const rest_cap = maxpl - rest_hdr;
                const total = 1 + (data.len - first_cap + rest_cap - 1) / rest_cap;
                if (total > 255) return;
                var off: usize = 0;
                var fid: usize = 0;
                const none: proto.Address = .none;
                while (fid < total) : (fid += 1) {
                    const cap = if (fid == 0) first_cap else rest_cap;
                    const l = @min(cap, data.len - off);
                    const hl = if (fid == 0) first_hdr else rest_hdr;
                    const buf = self.alloc.alloc(u8, hl + l) catch return;
                    _ = proto.writePacketHdr(buf, u.assoc, pkt_id, @intCast(total), @intCast(fid), @intCast(l), if (fid == 0) &addr else &none);
                    @memcpy(buf[hl..], data[off .. off + l]);
                    off += l;
                    cn.pushDatagram(buf);
                }
            },
            .quic => {
                const s = self.alloc.create(Stream) catch return;
                s.* = .{ .conn = cn, .id = -1, .kind = .uni_out, .phase = .relaying };
                var sid: i64 = -1;
                if (c.ngtcp2_conn_open_uni_stream(cn.ng(), &sid, s) != 0) {
                    self.alloc.destroy(s);
                    return;
                }
                s.id = sid;
                cn.streams.put(self.alloc, sid, s) catch {
                    _ = c.ngtcp2_conn_shutdown_stream(cn.ng(), 0, sid, 0);
                    self.alloc.destroy(s);
                    return;
                };
                var hdr: [10 + 19]u8 = undefined;
                const hl = proto.writePacketHdr(&hdr, u.assoc, pkt_id, 1, 0, @intCast(data.len), &addr);
                s.tx.append(&self.pool, hdr[0..hl]) catch {};
                s.tx.append(&self.pool, data) catch {};
                s.tx_fin = true;
                cn.enqueue(s);
            },
        }
    }

    fn gcFragments(self: *Server, t: u64) void {
        const life = self.cfg.gc_lifetime_ms * std.time.ns_per_ms;
        for (self.conns.items) |cn| {
            if (cn.dead or cn.state != .normal) continue;
            var ui = cn.sessions.valueIterator();
            while (ui.next()) |up| {
                const u = up.*;
                var stale = std.ArrayListUnmanaged(u16){};
                defer stale.deinit(self.alloc);
                var fi = u.frags.iterator();
                while (fi.next()) |e| {
                    if (e.value_ptr.*.created + life <= t) stale.append(self.alloc, e.key_ptr.*) catch {};
                }
                for (stale.items) |k| {
                    if (u.frags.fetchRemove(k)) |kv| self.freeFrag(kv.value);
                }
            }
        }
    }

    // --------------------------------------------------------------------
    // DNS completions
    // --------------------------------------------------------------------

    fn onDns(self: *Server) void {
        var it = self.resolver.take();
        while (it) |r| {
            it = r.next;
            defer {
                if (r.payload) |p| self.alloc.free(p);
                self.alloc.destroy(r);
            }
            if (r.cancelled) continue;
            switch (r.kind) {
                .tcp => {
                    const s: *Stream = @ptrCast(@alignCast(r.owner.?));
                    s.dns = null;
                    if (s.dead) continue;
                    if (!r.ok) {
                        log.debug("dns failed: {s}", .{r.host[0..r.host_len]});
                        self.abortStream(s);
                        continue;
                    }
                    const al = self.alloc.create(AltAddrs) catch {
                        self.abortStream(s);
                        continue;
                    };
                    al.* = .{ .addrs = r.addrs, .lens = r.addrlens, .n = r.naddrs, .next = 0 };
                    s.alts = al;
                    self.tcpNextOrAbort(s);
                    s.conn.markDirty();
                },
                .udp => {
                    const u: *UdpSession = @ptrCast(@alignCast(r.owner.?));
                    for (u.dns_pending.items, 0..) |x, i| {
                        if (x == r) {
                            _ = u.dns_pending.swapRemove(i);
                            break;
                        }
                    }
                    if (!r.ok or u.dead) continue;
                    // UDP has no handshake to fail over on: use the first usable address
                    for (0..r.naddrs) |i| {
                        var a = Addr{ .len = r.addrlens[i] };
                        @memcpy(std.mem.asBytes(&a.ss)[0..a.len], std.mem.asBytes(&r.addrs[i])[0..a.len]);
                        if (a.ss.ss_family == c.AF_INET6 and !u.v6) continue;
                        if (self.blocked(&a)) continue;
                        if (a.ss.ss_family == c.AF_INET and u.v6) {
                            const sin: *const c.struct_sockaddr_in = @ptrCast(@alignCast(&a.ss));
                            const ad: proto.Address = .{ .ipv4 = .{ .ip = std.mem.asBytes(&sin.sin_addr)[0..4].*, .port = r.port } };
                            self.udpSendOut(u, &ad, r.payload.?);
                        } else {
                            _ = c.sendto(u.ev.fd, r.payload.?.ptr, r.payload.?.len, 0, a.saConst(), a.len);
                        }
                        break;
                    }
                },
            }
        }
    }
};

// ------------------------------------------------------------------------
// ngtcp2 callbacks
// ------------------------------------------------------------------------

fn connOf(ud: ?*anyopaque) *Conn {
    return @ptrCast(@alignCast(ud.?));
}

fn cbGetConn(ref: [*c]c.ngtcp2_crypto_conn_ref) callconv(.C) ?*c.ngtcp2_conn {
    const cn: *Conn = @ptrCast(@alignCast(ref.*.user_data.?));
    return cn.conn;
}

fn cbRand(dest: [*c]u8, len: usize, _: [*c]const c.ngtcp2_rand_ctx) callconv(.C) void {
    std.crypto.random.bytes(dest[0..len]);
}

fn cbGetNewConnectionId(_: ?*c.ngtcp2_conn, cid: [*c]c.ngtcp2_cid, token: [*c]u8, cidlen: usize, ud: ?*anyopaque) callconv(.C) c_int {
    const cn = connOf(ud);
    cid.*.datalen = cidlen;
    std.crypto.random.bytes(cid.*.data[0..cidlen]);
    if (c.ngtcp2_crypto_generate_stateless_reset_token(token, &cn.srv.static_secret, cn.srv.static_secret.len, cid) != 0)
        return c.NGTCP2_ERR_CALLBACK_FAILURE;
    cn.srv.addCid(cn, CidKey.fromCid(cid));
    return 0;
}

fn cbRemoveConnectionId(_: ?*c.ngtcp2_conn, cid: [*c]const c.ngtcp2_cid, ud: ?*anyopaque) callconv(.C) c_int {
    const cn = connOf(ud);
    const k = CidKey.fromCid(cid);
    if (cn.srv.cids.get(k)) |owner| {
        if (owner == cn) _ = cn.srv.cids.remove(k);
    }
    for (cn.cids.items, 0..) |x, i| {
        if (std.meta.eql(x, k)) {
            _ = cn.cids.swapRemove(i);
            break;
        }
    }
    return 0;
}

fn cbHandshakeCompleted(_: ?*c.ngtcp2_conn, ud: ?*anyopaque) callconv(.C) c_int {
    const cn = connOf(ud);
    cn.hs_done = true;
    if (cn.pending_auth) |body| {
        cn.pending_auth = null;
        cn.srv.handleAuth(cn, body);
    }
    return 0;
}

fn cbStreamOpen(_: ?*c.ngtcp2_conn, sid: i64, ud: ?*anyopaque) callconv(.C) c_int {
    const cn = connOf(ud);
    const srv = cn.srv;
    const s = srv.alloc.create(Stream) catch return c.NGTCP2_ERR_CALLBACK_FAILURE;
    const bidi = (sid & 0x2) == 0;
    s.* = .{ .conn = cn, .id = sid, .kind = if (bidi) .bidi else .uni_in };
    cn.streams.put(srv.alloc, sid, s) catch {
        srv.alloc.destroy(s);
        return c.NGTCP2_ERR_CALLBACK_FAILURE;
    };
    _ = c.ngtcp2_conn_set_stream_user_data(cn.ng(), sid, s);
    return 0;
}

fn streamOf(cn: *Conn, sid: i64, sud: ?*anyopaque) ?*Stream {
    if (sud) |p| return @ptrCast(@alignCast(p));
    return cn.streams.get(sid);
}

fn cbRecvStreamData(_: ?*c.ngtcp2_conn, flags: u32, sid: i64, _: u64, data: [*c]const u8, len: usize, ud: ?*anyopaque, sud: ?*anyopaque) callconv(.C) c_int {
    const cn = connOf(ud);
    const s = streamOf(cn, sid, sud) orelse return 0;
    if (s.dead) return 0;
    const fin = (flags & c.NGTCP2_STREAM_DATA_FLAG_FIN) != 0;
    const d: []const u8 = if (len > 0) data[0..len] else &.{};
    switch (s.kind) {
        .uni_in => {
            _ = c.ngtcp2_conn_extend_max_stream_offset(cn.ng(), sid, len);
            c.ngtcp2_conn_extend_max_offset(cn.ng(), len);
            if (s.uni_bad or s.uni_done) return 0;
            // Process the command as soon as its bytes are in; do not wait for FIN
            // (some clients keep the stream open after sending).
            if (s.uni.items.len == 0) {
                if (proto.commandLen(d)) |n| {
                    s.uni_done = true;
                    cn.srv.onUniComplete(cn, d[0..n]);
                    return 0;
                } else |e| switch (e) {
                    error.Invalid => {
                        s.uni_bad = true;
                        return 0;
                    },
                    error.Incomplete => {},
                }
            }
            if (s.uni.items.len + len > MAX_UNI_LEN) {
                s.uni_bad = true;
                s.uni.deinit(cn.srv.alloc);
                s.uni = .{};
                return 0;
            }
            s.uni.appendSlice(cn.srv.alloc, d) catch return 0;
            if (proto.commandLen(s.uni.items)) |n| {
                s.uni_done = true;
                cn.srv.onUniComplete(cn, s.uni.items[0..n]);
                s.uni.clearAndFree(cn.srv.alloc);
            } else |e| switch (e) {
                error.Invalid => {
                    s.uni_bad = true;
                    s.uni.clearAndFree(cn.srv.alloc);
                },
                error.Incomplete => if (fin) s.uni.clearAndFree(cn.srv.alloc),
            }
        },
        .bidi => cn.srv.onBidiData(s, d, fin),
        .uni_out => {},
    }
    return 0;
}

fn cbAckedStreamDataOffset(_: ?*c.ngtcp2_conn, sid: i64, offset: u64, len: u64, ud: ?*anyopaque, sud: ?*anyopaque) callconv(.C) c_int {
    const cn = connOf(ud);
    const s = streamOf(cn, sid, sud) orelse return 0;
    if (s.dead) return 0;
    s.tx.ack(&cn.srv.pool, offset + len);
    if (s.tcp_readable and s.tx.buffered() < MAX_TX_BUF) cn.wakeStream(s);
    return 0;
}

fn cbStreamClose(conn: ?*c.ngtcp2_conn, _: u32, sid: i64, _: u64, ud: ?*anyopaque, sud: ?*anyopaque) callconv(.C) c_int {
    const cn = connOf(ud);
    // ngtcp2 never raises MAX_STREAMS by itself: give the peer one more
    // stream of the same kind for every peer-initiated stream that closes.
    if (c.ngtcp2_conn_is_local_stream(conn, sid) == 0) {
        if ((sid & 0x2) == 0) {
            c.ngtcp2_conn_extend_max_streams_bidi(conn, 1);
        } else {
            c.ngtcp2_conn_extend_max_streams_uni(conn, 1);
        }
    }
    const s = streamOf(cn, sid, sud) orelse return 0;
    cn.qRemove(s);
    _ = cn.streams.remove(sid);
    cn.srv.releaseStream(s);
    return 0;
}

fn cbStreamReset(_: ?*c.ngtcp2_conn, sid: i64, _: u64, _: u64, ud: ?*anyopaque, sud: ?*anyopaque) callconv(.C) c_int {
    const cn = connOf(ud);
    const s = streamOf(cn, sid, sud) orelse return 0;
    if (s.dead or s.kind != .bidi) return 0;
    s.want_abort = true;
    cn.wakeStream(s);
    return 0;
}

fn cbStreamStopSending(_: ?*c.ngtcp2_conn, sid: i64, _: u64, ud: ?*anyopaque, sud: ?*anyopaque) callconv(.C) c_int {
    return cbStreamReset(null, sid, 0, 0, ud, sud);
}

fn cbExtendMaxStreamData(_: ?*c.ngtcp2_conn, sid: i64, _: u64, ud: ?*anyopaque, sud: ?*anyopaque) callconv(.C) c_int {
    const cn = connOf(ud);
    const s = streamOf(cn, sid, sud) orelse return 0;
    if (s.dead) return 0;
    if (s.blocked) {
        s.blocked = false;
        cn.enqueue(s);
    }
    return 0;
}

fn cbRecvDatagram(_: ?*c.ngtcp2_conn, _: u32, data: [*c]const u8, len: usize, ud: ?*anyopaque) callconv(.C) c_int {
    const cn = connOf(ud);
    cn.srv.onDatagram(cn, data[0..len]);
    return 0;
}

fn cbWritePkt(conn: ?*c.ngtcp2_conn, path: [*c]c.ngtcp2_path, pi: [*c]c.ngtcp2_pkt_info, dest: [*c]u8, destlen: usize, ts: u64, ud: ?*anyopaque) callconv(.C) c.ngtcp2_ssize {
    const cn = connOf(ud);
    while (true) {
        // DATAGRAM frames first: they are latency sensitive (UDP relay)
        if (cn.dgram_head < cn.dgram_q.items.len) {
            const d = cn.dgram_q.items[cn.dgram_head];
            var acc: c_int = 0;
            const v = c.ngtcp2_vec{ .base = d.ptr, .len = d.len };
            const nw = cmod.tz_conn_writev_datagram(conn, path, pi, dest, destlen, &acc, c.NGTCP2_WRITE_DATAGRAM_FLAG_MORE, 0, @ptrCast(&v), 1, ts);
            if (nw < 0) {
                if (nw == c.NGTCP2_ERR_WRITE_MORE) {
                    cn.popDatagram();
                    continue;
                }
                if (nw == c.NGTCP2_ERR_INVALID_ARGUMENT or nw == c.NGTCP2_ERR_INVALID_STATE) {
                    cn.popDatagram();
                    continue;
                }
                return nw;
            }
            if (acc != 0) cn.popDatagram();
            return nw;
        }

        const s = cn.q_head;
        var vecs: [16]sb.Vec = undefined;
        var nv: usize = 0;
        var fin = false;
        var sid: i64 = -1;
        var total: u64 = 0;
        if (s) |st| {
            nv = st.tx.unsentVecs(&vecs);
            for (vecs[0..nv]) |x| total += x.len;
            fin = st.tx_fin and !st.fin_sent and total == st.tx.unsent();
            sid = st.id;
        }
        var flags: u32 = c.NGTCP2_WRITE_STREAM_FLAG_MORE;
        if (fin) flags |= c.NGTCP2_WRITE_STREAM_FLAG_FIN;
        var nd: c.ngtcp2_ssize = -1;
        const nw = cmod.tz_conn_writev_stream(conn, path, pi, dest, destlen, &nd, flags, sid, if (nv > 0) @ptrCast(&vecs) else null, nv, ts);
        if (nw < 0) {
            const st = s orelse return nw;
            switch (nw) {
                c.NGTCP2_ERR_STREAM_DATA_BLOCKED => {
                    st.blocked = true;
                    cn.qRemove(st);
                    continue;
                },
                c.NGTCP2_ERR_STREAM_SHUT_WR, c.NGTCP2_ERR_STREAM_NOT_FOUND => {
                    cn.qRemove(st);
                    st.fin_sent = true;
                    continue;
                },
                c.NGTCP2_ERR_WRITE_MORE => {
                    consumed(cn, st, @intCast(nd), fin, total);
                    continue;
                },
                else => return nw,
            }
        }
        if (s) |st| {
            if (nd >= 0) consumed(cn, st, @intCast(nd), fin, total);
        }
        return nw;
    }
}

fn consumed(cn: *Conn, s: *Stream, nd: u64, fin: bool, total: u64) void {
    s.tx.advance(nd);
    if (fin and nd == total) s.fin_sent = true;
    if (!s.hasSendWork()) {
        cn.qRemove(s);
    } else if (cn.q_head == s) {
        cn.qRotate();
    }
}
