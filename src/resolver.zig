//! Asynchronous DNS: a few worker threads run getaddrinfo() and hand results
//! back to the event loop through an eventfd. The event loop is the only owner
//! of `Req.owner`/`cancelled`; workers touch only the host/result fields.
const std = @import("std");
const c = @import("c.zig").c;

pub const MAX_ADDRS = 8;

/// Address-family policy for resolved names (tuic-server's ip_mode idea).
pub const IpMode = enum {
    v4first, // IPv4 addresses first, then IPv6
    v6first, // IPv6 first, then IPv4
    v4only,
    v6only,

    pub fn parse(sv: []const u8) ?IpMode {
        inline for (@typeInfo(IpMode).@"enum".fields) |f| {
            if (std.mem.eql(u8, sv, f.name)) return @enumFromInt(f.value);
        }
        return null;
    }
};

pub const Req = struct {
    host: [256]u8 = undefined,
    host_len: usize = 0,
    port: u16 = 0,
    mode: IpMode = .v4first,
    // result: every usable address, in the order to try them
    ok: bool = false,
    addrs: [MAX_ADDRS]c.struct_sockaddr_in6 = undefined,
    addrlens: [MAX_ADDRS]c.socklen_t = undefined,
    naddrs: u8 = 0,
    next_try: u8 = 0,
    // owner bookkeeping (event-loop only)
    cancelled: bool = false,
    owner: ?*anyopaque = null,
    kind: enum { tcp, udp } = .tcp,
    payload: ?[]u8 = null,
    next: ?*Req = null,
};

pub const Resolver = struct {
    alloc: std.mem.Allocator,
    efd: c_int,
    mutex: std.Thread.Mutex = .{},
    cond: std.Thread.Condition = .{},
    in_head: ?*Req = null,
    in_tail: ?*Req = null,
    out_head: ?*Req = null,
    threads: [4]std.Thread = undefined,

    pub fn init(self: *Resolver, alloc: std.mem.Allocator) !void {
        self.* = .{ .alloc = alloc, .efd = c.eventfd(0, c.EFD_NONBLOCK | c.EFD_CLOEXEC) };
        if (self.efd < 0) return error.EventFd;
        for (&self.threads) |*t| t.* = try std.Thread.spawn(.{ .stack_size = 256 * 1024 }, worker, .{self});
    }

    pub fn submit(self: *Resolver, r: *Req) void {
        r.next = null;
        self.mutex.lock();
        defer self.mutex.unlock();
        if (self.in_tail) |t| t.next = r else self.in_head = r;
        self.in_tail = r;
        self.cond.signal();
    }

    /// Takes all finished requests (event loop side).
    pub fn take(self: *Resolver) ?*Req {
        var v: u64 = 0;
        _ = c.read(self.efd, &v, 8);
        self.mutex.lock();
        defer self.mutex.unlock();
        const h = self.out_head;
        self.out_head = null;
        return h;
    }

    fn worker(self: *Resolver) void {
        while (true) {
            self.mutex.lock();
            while (self.in_head == null) self.cond.wait(&self.mutex);
            const r = self.in_head.?;
            self.in_head = r.next;
            if (self.in_head == null) self.in_tail = null;
            self.mutex.unlock();

            resolve(r);

            self.mutex.lock();
            r.next = self.out_head;
            self.out_head = r;
            self.mutex.unlock();
            const one: u64 = 1;
            _ = c.write(self.efd, &one, 8);
        }
    }

    fn resolve(r: *Req) void {
        var name: [257]u8 = undefined;
        @memcpy(name[0..r.host_len], r.host[0..r.host_len]);
        name[r.host_len] = 0;
        var hints = std.mem.zeroes(c.struct_addrinfo);
        hints.ai_family = c.AF_UNSPEC;
        hints.ai_socktype = if (r.kind == .tcp) c.SOCK_STREAM else c.SOCK_DGRAM;
        // No AI_ADDRCONFIG: it hides AAAA records on hosts whose only IPv6 is
        // loopback/link-local, and a failing family falls back to the next address anyway.
        hints.ai_flags = 0;
        var res: ?*c.struct_addrinfo = null;
        r.naddrs = 0;
        r.next_try = 0;
        if (c.getaddrinfo(&name, null, &hints, &res) != 0 or res == null) {
            r.ok = false;
            return;
        }
        defer c.freeaddrinfo(res);
        const first: c_int, const second: c_int = switch (r.mode) {
            .v4first => .{ c.AF_INET, c.AF_INET6 },
            .v6first => .{ c.AF_INET6, c.AF_INET },
            .v4only => .{ c.AF_INET, -1 },
            .v6only => .{ c.AF_INET6, -1 },
        };
        for ([_]c_int{ first, second }) |fam| {
            if (fam < 0) continue;
            var it = res;
            while (it) |ai| : (it = ai.ai_next) {
                if (ai.ai_family != fam or r.naddrs >= MAX_ADDRS) continue;
                if (ai.ai_addrlen > @sizeOf(c.struct_sockaddr_in6)) continue;
                const len: usize = ai.ai_addrlen;
                const src = @as([*]const u8, @ptrCast(ai.ai_addr))[0..len];
                // skip duplicates (getaddrinfo may repeat an address)
                var dup = false;
                for (0..r.naddrs) |i| {
                    if (r.addrlens[i] == len and std.mem.eql(u8, std.mem.asBytes(&r.addrs[i])[0..len], src)) dup = true;
                }
                if (dup) continue;
                const dst = &r.addrs[r.naddrs];
                dst.* = std.mem.zeroes(c.struct_sockaddr_in6);
                @memcpy(std.mem.asBytes(dst)[0..len], src);
                r.addrlens[r.naddrs] = @intCast(len);
                setPort(@ptrCast(@alignCast(dst)), r.port);
                r.naddrs += 1;
            }
        }
        r.ok = r.naddrs > 0;
    }
};

pub fn setPort(ss: *align(4) anyopaque, port: u16) void {
    const fam: *const c.sa_family_t = @ptrCast(ss);
    if (fam.* == c.AF_INET) {
        const sin: *c.struct_sockaddr_in = @ptrCast(ss);
        sin.sin_port = std.mem.nativeToBig(u16, port);
    } else {
        const sin6: *c.struct_sockaddr_in6 = @ptrCast(ss);
        sin6.sin6_port = std.mem.nativeToBig(u16, port);
    }
}
