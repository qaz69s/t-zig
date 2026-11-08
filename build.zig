const std = @import("std");

pub fn build(b: *std.Build) void {
    const target = b.standardTargetOptions(.{});
    const optimize = b.standardOptimizeOption(.{});
    const deps = b.option([]const u8, "deps", "ngtcp2 install prefix") orelse "/workspace/work/deps";

    const mod = b.createModule(.{
        .root_source_file = b.path("src/main.zig"),
        .target = target,
        .optimize = optimize,
        .link_libc = true,
    });
    const exe = b.addExecutable(.{ .name = "tuic-zig", .root_module = mod });
    exe.addIncludePath(.{ .cwd_relative = b.fmt("{s}/include", .{deps}) });
    exe.addCSourceFile(.{ .file = b.path("src/shim.c"), .flags = &.{"-O2"} });
    exe.addObjectFile(.{ .cwd_relative = b.fmt("{s}/lib/libngtcp2_crypto_ossl.a", .{deps}) });
    exe.addObjectFile(.{ .cwd_relative = b.fmt("{s}/lib/libngtcp2.a", .{deps}) });
    exe.linkSystemLibrary("ssl");
    exe.linkSystemLibrary("crypto");
    b.installArtifact(exe);

    const run = b.addRunArtifact(exe);
    if (b.args) |a| run.addArgs(a);
    b.step("run", "run the server").dependOn(&run.step);

    const tmod = b.createModule(.{ .root_source_file = b.path("src/main.zig"), .target = target, .optimize = optimize, .link_libc = true });
    const t = b.addTest(.{ .root_module = tmod });
    t.addIncludePath(.{ .cwd_relative = b.fmt("{s}/include", .{deps}) });
    b.step("test", "unit tests").dependOn(&b.addRunArtifact(t).step);
}
