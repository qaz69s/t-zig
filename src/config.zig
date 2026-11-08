const std = @import("std");

/// JSON configuration. Field names follow tuic-server where a counterpart exists.
pub const Config = struct {
    server: []const u8 = "[::]:8443",
    users: std.json.ArrayHashMap([]const u8) = .{},
    certificate: []const u8 = "",
    private_key: []const u8 = "",
    alpn: []const []const u8 = &.{"h3"},
    congestion_control: []const u8 = "bbr",
    zero_rtt_handshake: bool = false,
    udp_relay_ipv6: bool = true,
    /// Address family order for domain targets: v4first | v6first | v4only | v6only.
    /// Every resolved address is tried in that order until a TCP connect succeeds.
    ip_mode: []const u8 = "v4first",
    auth_timeout_ms: u64 = 3000,
    max_idle_time_ms: u64 = 30000,
    gc_lifetime_ms: u64 = 15000,
    log_level: []const u8 = "warn",
    // destination guard, same defaults as tuic-server's [experimental]
    drop_loopback: bool = true,
    drop_private: bool = true,
    // QUIC tuning
    stream_window: u64 = 8 * 1024 * 1024,
    conn_window: u64 = 16 * 1024 * 1024,
    max_stream_window: u64 = 16 * 1024 * 1024,
    max_conn_window: u64 = 32 * 1024 * 1024,
    max_concurrent_bidi: u64 = 1024,
    max_concurrent_uni: u64 = 1024,
    max_udp_payload: usize = 0, // 0 = ngtcp2 default (1452, PMTUD probes upwards)
    pmtu: bool = true,
    gso: bool = true,
    gro: bool = true,
    gso_burst: usize = 32,
};
