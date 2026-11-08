//! TUIC v5 wire format (SPEC.md, protocol version 0x05).
const std = @import("std");

pub const VERSION: u8 = 0x05;

pub const Cmd = enum(u8) {
    authenticate = 0x00,
    connect = 0x01,
    packet = 0x02,
    dissociate = 0x03,
    heartbeat = 0x04,
    _,
};

pub const AddrType = enum(u8) {
    domain = 0x00,
    ipv4 = 0x01,
    ipv6 = 0x02,
    none = 0xff,
    _,
};

pub const Address = union(enum) {
    none,
    ipv4: struct { ip: [4]u8, port: u16 },
    ipv6: struct { ip: [16]u8, port: u16 },
    domain: struct { name: [255]u8, len: u8, port: u16 },

    pub fn port(self: Address) u16 {
        return switch (self) {
            .none => 0,
            .ipv4 => |a| a.port,
            .ipv6 => |a| a.port,
            .domain => |a| a.port,
        };
    }

    pub fn domainName(self: *const Address) []const u8 {
        return switch (self.*) {
            .domain => |*d| d.name[0..d.len],
            else => "",
        };
    }

    pub fn encodedLen(self: Address) usize {
        return switch (self) {
            .none => 1,
            .ipv4 => 1 + 4 + 2,
            .ipv6 => 1 + 16 + 2,
            .domain => |d| 1 + 1 + @as(usize, d.len) + 2,
        };
    }

    /// Writes the address into `out`; returns bytes written. `out` must hold encodedLen().
    pub fn encode(self: *const Address, out: []u8) usize {
        switch (self.*) {
            .none => {
                out[0] = @intFromEnum(AddrType.none);
                return 1;
            },
            .ipv4 => |a| {
                out[0] = @intFromEnum(AddrType.ipv4);
                @memcpy(out[1..5], &a.ip);
                std.mem.writeInt(u16, out[5..7], a.port, .big);
                return 7;
            },
            .ipv6 => |a| {
                out[0] = @intFromEnum(AddrType.ipv6);
                @memcpy(out[1..17], &a.ip);
                std.mem.writeInt(u16, out[17..19], a.port, .big);
                return 19;
            },
            .domain => |*d| {
                out[0] = @intFromEnum(AddrType.domain);
                out[1] = d.len;
                @memcpy(out[2 .. 2 + d.len], d.name[0..d.len]);
                std.mem.writeInt(u16, out[2 + d.len ..][0..2], d.port, .big);
                return 2 + @as(usize, d.len) + 2;
            },
        }
    }
};

pub const ParseError = error{ Incomplete, Invalid };

pub const AddrResult = struct { addr: Address, len: usize };

pub fn parseAddress(buf: []const u8) ParseError!AddrResult {
    if (buf.len < 1) return error.Incomplete;
    switch (@as(AddrType, @enumFromInt(buf[0]))) {
        .none => return .{ .addr = .none, .len = 1 },
        .ipv4 => {
            if (buf.len < 7) return error.Incomplete;
            return .{ .addr = .{ .ipv4 = .{ .ip = buf[1..5].*, .port = std.mem.readInt(u16, buf[5..7], .big) } }, .len = 7 };
        },
        .ipv6 => {
            if (buf.len < 19) return error.Incomplete;
            return .{ .addr = .{ .ipv6 = .{ .ip = buf[1..17].*, .port = std.mem.readInt(u16, buf[17..19], .big) } }, .len = 19 };
        },
        .domain => {
            if (buf.len < 2) return error.Incomplete;
            const n: usize = buf[1];
            if (n == 0) return error.Invalid;
            if (buf.len < 2 + n + 2) return error.Incomplete;
            var a: Address = .{ .domain = .{ .name = undefined, .len = @intCast(n), .port = std.mem.readInt(u16, buf[2 + n ..][0..2], .big) } };
            @memcpy(a.domain.name[0..n], buf[2 .. 2 + n]);
            return .{ .addr = a, .len = 2 + n + 2 };
        },
        _ => return error.Invalid,
    }
}

pub const PacketHdr = struct {
    assoc_id: u16,
    pkt_id: u16,
    frag_total: u8,
    frag_id: u8,
    size: u16,
    addr: Address,
};

pub const PacketParse = struct { hdr: PacketHdr, payload: []const u8 };

/// Parses a complete `Packet` command (header included) from `buf`.
pub fn parsePacket(buf: []const u8) ParseError!PacketParse {
    if (buf.len < 2 + 8) return error.Incomplete;
    if (buf[0] != VERSION or buf[1] != @intFromEnum(Cmd.packet)) return error.Invalid;
    const r = try parseAddress(buf[10..]);
    const size = std.mem.readInt(u16, buf[8..10], .big);
    const off = 10 + r.len;
    if (buf.len < off + size) return error.Incomplete;
    return .{
        .hdr = .{
            .assoc_id = std.mem.readInt(u16, buf[2..4], .big),
            .pkt_id = std.mem.readInt(u16, buf[4..6], .big),
            .frag_total = buf[6],
            .frag_id = buf[7],
            .size = size,
            .addr = r.addr,
        },
        .payload = buf[off .. off + size],
    };
}

/// Total byte length of the single TUIC command at the start of `buf`
/// (as carried on a unidirectional stream), or error.Incomplete when more
/// bytes are needed to know/complete it.
pub fn commandLen(buf: []const u8) ParseError!usize {
    if (buf.len < 2) return error.Incomplete;
    if (buf[0] != VERSION) return error.Invalid;
    switch (@as(Cmd, @enumFromInt(buf[1]))) {
        .authenticate => return if (buf.len >= 50) 50 else error.Incomplete,
        .dissociate => return if (buf.len >= 4) 4 else error.Incomplete,
        .heartbeat => return 2,
        .packet => {
            if (buf.len < 10) return error.Incomplete;
            const r = try parseAddress(buf[10..]);
            const total = 10 + r.len + @as(usize, std.mem.readInt(u16, buf[8..10], .big));
            return if (buf.len >= total) total else error.Incomplete;
        },
        else => return error.Invalid,
    }
}

/// Writes a Packet command header into `out` and returns its length.
pub fn writePacketHdr(out: []u8, assoc_id: u16, pkt_id: u16, frag_total: u8, frag_id: u8, size: u16, addr: *const Address) usize {
    out[0] = VERSION;
    out[1] = @intFromEnum(Cmd.packet);
    std.mem.writeInt(u16, out[2..4], assoc_id, .big);
    std.mem.writeInt(u16, out[4..6], pkt_id, .big);
    out[6] = frag_total;
    out[7] = frag_id;
    std.mem.writeInt(u16, out[8..10], size, .big);
    return 10 + addr.encode(out[10..]);
}

pub fn parseUuid(s: []const u8) ![16]u8 {
    var out: [16]u8 = undefined;
    var n: usize = 0;
    var i: usize = 0;
    while (i < s.len) {
        if (s[i] == '-') {
            i += 1;
            continue;
        }
        if (i + 1 >= s.len or n >= 16) return error.InvalidUuid;
        out[n] = std.fmt.parseInt(u8, s[i .. i + 2], 16) catch return error.InvalidUuid;
        n += 1;
        i += 2;
    }
    if (n != 16) return error.InvalidUuid;
    return out;
}

test "address roundtrip" {
    var buf: [300]u8 = undefined;
    const a: Address = .{ .ipv4 = .{ .ip = .{ 1, 2, 3, 4 }, .port = 443 } };
    const n = a.encode(&buf);
    const r = try parseAddress(buf[0..n]);
    try std.testing.expectEqual(@as(usize, 7), r.len);
    try std.testing.expectEqual(@as(u16, 443), r.addr.port());
    var d: Address = .{ .domain = .{ .name = undefined, .len = 11, .port = 80 } };
    @memcpy(d.domain.name[0..11], "example.com");
    const m = d.encode(&buf);
    const r2 = try parseAddress(buf[0..m]);
    try std.testing.expectEqualStrings("example.com", r2.addr.domainName());
    try std.testing.expectError(error.Incomplete, parseAddress(buf[0 .. m - 1]));
}

test "uuid" {
    const u = try parseUuid("123e4567-e89b-12d3-a456-426614174000");
    try std.testing.expectEqual(@as(u8, 0x12), u[0]);
    try std.testing.expectEqual(@as(u8, 0x00), u[15]);
}

test "commandLen" {
    var b: [64]u8 = undefined;
    b[0] = VERSION;
    b[1] = @intFromEnum(Cmd.authenticate);
    try std.testing.expectError(error.Incomplete, commandLen(b[0..49]));
    try std.testing.expectEqual(@as(usize, 50), try commandLen(b[0..64]));
    const a: Address = .{ .ipv4 = .{ .ip = .{ 1, 2, 3, 4 }, .port = 53 } };
    const h = writePacketHdr(&b, 1, 2, 1, 0, 5, &a);
    try std.testing.expectEqual(@as(usize, 17), h);
    try std.testing.expectError(error.Incomplete, commandLen(b[0 .. h + 4]));
    try std.testing.expectEqual(h + 5, try commandLen(b[0 .. h + 9]));
}
