const std = @import("std");
const Config = @import("config.zig").Config;
const Server = @import("server.zig").Server;

pub var log_level: std.log.Level = .warn;

pub const std_options: std.Options = .{
    .log_level = .debug,
    .logFn = logFn,
};

fn logFn(comptime level: std.log.Level, comptime scope: @TypeOf(.enum_literal), comptime fmt: []const u8, args: anytype) void {
    if (@intFromEnum(level) > @intFromEnum(log_level)) return;
    const stderr = std.io.getStdErr().writer();
    stderr.print("[" ++ level.asText() ++ "] (" ++ @tagName(scope) ++ ") " ++ fmt ++ "\n", args) catch {};
}

pub fn main() !void {
    const alloc = std.heap.c_allocator;
    const args = try std.process.argsAlloc(alloc);
    var path: ?[]const u8 = null;
    var i: usize = 1;
    while (i < args.len) : (i += 1) {
        if ((std.mem.eql(u8, args[i], "-c") or std.mem.eql(u8, args[i], "--config")) and i + 1 < args.len) {
            path = args[i + 1];
            i += 1;
        } else if (std.mem.eql(u8, args[i], "-v") or std.mem.eql(u8, args[i], "--version")) {
            std.io.getStdOut().writer().print("tuic-zig 0.5.0 (TUIC v5 server)\n", .{}) catch {};
            return;
        }
    }
    const p = path orelse {
        std.io.getStdErr().writer().print("usage: tuic-zig -c config.json\n", .{}) catch {};
        std.process.exit(2);
    };
    const text = try std.fs.cwd().readFileAlloc(alloc, p, 1 << 20);
    const parsed = try std.json.parseFromSlice(Config, alloc, text, .{ .ignore_unknown_fields = true, .allocate = .alloc_always });
    const cfg = &parsed.value;
    log_level = std.meta.stringToEnum(std.log.Level, cfg.log_level) orelse .warn;
    if (std.mem.eql(u8, cfg.log_level, "error")) log_level = .err;
    if (std.mem.eql(u8, cfg.log_level, "trace")) log_level = .debug;

    const srv = try alloc.create(Server);
    try srv.init(alloc, cfg);
    try srv.run();
}

test {
    _ = @import("proto.zig");
    _ = @import("sendbuf.zig");
}
