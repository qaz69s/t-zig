//! Send buffer for a QUIC stream. ngtcp2 does not copy stream data: every byte
//! handed to ngtcp2_conn_writev_stream must stay at the same address until it is
//! acknowledged. So data lives in fixed-size chunks that are never moved, and a
//! chunk is recycled only once every byte in it is acked.
const std = @import("std");

pub const CHUNK = 64 * 1024;

pub const Chunk = struct {
    next: ?*Chunk = null,
    buf: [CHUNK]u8 = undefined,
};

/// Global free list of chunks (single-threaded event loop).
pub const Pool = struct {
    alloc: std.mem.Allocator,
    free: ?*Chunk = null,
    nfree: usize = 0,
    max_free: usize = 32, // keep at most 2 MiB of idle chunks

    pub fn get(self: *Pool) !*Chunk {
        if (self.free) |ch| {
            self.free = ch.next;
            self.nfree -= 1;
            ch.next = null;
            return ch;
        }
        const ch = try self.alloc.create(Chunk);
        ch.next = null;
        return ch;
    }

    pub fn put(self: *Pool, ch: *Chunk) void {
        if (self.nfree >= self.max_free) {
            self.alloc.destroy(ch);
            return;
        }
        ch.next = self.free;
        self.free = ch;
        self.nfree += 1;
    }
};

pub const Vec = extern struct { base: [*]const u8, len: usize };

pub const SendBuf = struct {
    head: ?*Chunk = null,
    tail: ?*Chunk = null,
    head_off: u64 = 0, // stream offset of head chunk's first byte
    tail_off: u64 = 0, // stream offset of tail chunk's first byte
    acked: u64 = 0,
    sent: u64 = 0,
    end: u64 = 0,
    // cursor for the chunk containing `sent`
    cur: ?*Chunk = null,
    cur_off: u64 = 0,

    pub fn buffered(self: *const SendBuf) u64 {
        return self.end - self.acked;
    }

    pub fn unsent(self: *const SendBuf) u64 {
        return self.end - self.sent;
    }

    /// Returns writable space at the tail, allocating a chunk if needed.
    pub fn writable(self: *SendBuf, pool: *Pool) ![]u8 {
        if (self.tail) |t| {
            const used: usize = @intCast(self.end - self.tail_off);
            if (used < CHUNK) return t.buf[used..];
        }
        const ch = try pool.get();
        if (self.tail) |t| {
            t.next = ch;
            self.tail_off += CHUNK;
        } else {
            self.head = ch;
            self.head_off = self.end;
            self.tail_off = self.end;
        }
        self.tail = ch;
        if (self.cur == null) {
            self.cur = ch;
            self.cur_off = self.tail_off;
        }
        return ch.buf[0..];
    }

    pub fn commit(self: *SendBuf, n: usize) void {
        self.end += n;
    }

    pub fn append(self: *SendBuf, pool: *Pool, data: []const u8) !void {
        var rest = data;
        while (rest.len > 0) {
            const w = try self.writable(pool);
            const n = @min(w.len, rest.len);
            @memcpy(w[0..n], rest[0..n]);
            self.commit(n);
            rest = rest[n..];
        }
    }

    /// Fills `out` with iovecs covering unsent data. Returns count.
    pub fn unsentVecs(self: *SendBuf, out: []Vec) usize {
        if (self.sent >= self.end) return 0;
        var ch = self.cur orelse return 0;
        var off = self.cur_off;
        var pos = self.sent;
        var n: usize = 0;
        while (n < out.len) {
            const start: usize = @intCast(pos - off);
            const avail_end: u64 = @min(off + CHUNK, self.end);
            if (avail_end > pos) {
                out[n] = .{ .base = ch.buf[start..].ptr, .len = @intCast(avail_end - pos) };
                n += 1;
                pos = avail_end;
            }
            if (pos >= self.end) break;
            ch = ch.next orelse break;
            off += CHUNK;
        }
        return n;
    }

    pub fn advance(self: *SendBuf, n: u64) void {
        self.sent += n;
        std.debug.assert(self.sent <= self.end);
        while (self.cur) |ch| {
            if (self.sent >= self.cur_off + CHUNK) {
                if (ch.next) |nx| {
                    self.cur = nx;
                    self.cur_off += CHUNK;
                    continue;
                }
            }
            break;
        }
    }

    pub fn ack(self: *SendBuf, pool: *Pool, upto: u64) void {
        if (upto > self.acked) self.acked = upto;
        while (self.head) |h| {
            if (self.head_off + CHUNK > self.acked) break;
            // chunk fully acked (implies fully written)
            self.head = h.next;
            self.head_off += CHUNK;
            if (self.cur == h) {
                self.cur = h.next;
                self.cur_off = self.head_off;
            }
            if (self.tail == h) {
                self.tail = null;
                self.tail_off = self.head_off;
            }
            pool.put(h);
        }
    }

    pub fn deinit(self: *SendBuf, pool: *Pool) void {
        var it = self.head;
        while (it) |h| {
            it = h.next;
            pool.put(h);
        }
        self.* = .{};
    }
};

test "sendbuf basic" {
    var pool = Pool{ .alloc = std.testing.allocator };
    defer {
        var it = pool.free;
        while (it) |c| {
            it = c.next;
            std.testing.allocator.destroy(c);
        }
    }
    var sb = SendBuf{};
    const data = try std.testing.allocator.alloc(u8, CHUNK * 2 + 100);
    defer std.testing.allocator.free(data);
    for (data, 0..) |*b, i| b.* = @truncate(i);
    try sb.append(&pool, data);
    var vecs: [8]Vec = undefined;
    var n = sb.unsentVecs(&vecs);
    try std.testing.expectEqual(@as(usize, 3), n);
    try std.testing.expectEqual(@as(usize, CHUNK), vecs[0].len);
    sb.advance(CHUNK + 10);
    n = sb.unsentVecs(&vecs);
    try std.testing.expectEqual(@as(usize, 2), n);
    try std.testing.expectEqual(@as(usize, CHUNK - 10), vecs[0].len);
    try std.testing.expectEqual(data[CHUNK + 10], vecs[0].base[0]);
    sb.ack(&pool, CHUNK + 10);
    try std.testing.expect(sb.head_off == CHUNK);
    sb.advance(sb.unsent());
    sb.ack(&pool, sb.end);
    try std.testing.expectEqual(@as(u64, 100), sb.buffered() + 100);
    sb.deinit(&pool);
}
