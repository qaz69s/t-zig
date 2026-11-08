pub const __builtin_bswap16 = @import("std").zig.c_builtins.__builtin_bswap16;
pub const __builtin_bswap32 = @import("std").zig.c_builtins.__builtin_bswap32;
pub const __builtin_bswap64 = @import("std").zig.c_builtins.__builtin_bswap64;
pub const __builtin_signbit = @import("std").zig.c_builtins.__builtin_signbit;
pub const __builtin_signbitf = @import("std").zig.c_builtins.__builtin_signbitf;
pub const __builtin_popcount = @import("std").zig.c_builtins.__builtin_popcount;
pub const __builtin_ctz = @import("std").zig.c_builtins.__builtin_ctz;
pub const __builtin_clz = @import("std").zig.c_builtins.__builtin_clz;
pub const __builtin_sqrt = @import("std").zig.c_builtins.__builtin_sqrt;
pub const __builtin_sqrtf = @import("std").zig.c_builtins.__builtin_sqrtf;
pub const __builtin_sin = @import("std").zig.c_builtins.__builtin_sin;
pub const __builtin_sinf = @import("std").zig.c_builtins.__builtin_sinf;
pub const __builtin_cos = @import("std").zig.c_builtins.__builtin_cos;
pub const __builtin_cosf = @import("std").zig.c_builtins.__builtin_cosf;
pub const __builtin_exp = @import("std").zig.c_builtins.__builtin_exp;
pub const __builtin_expf = @import("std").zig.c_builtins.__builtin_expf;
pub const __builtin_exp2 = @import("std").zig.c_builtins.__builtin_exp2;
pub const __builtin_exp2f = @import("std").zig.c_builtins.__builtin_exp2f;
pub const __builtin_log = @import("std").zig.c_builtins.__builtin_log;
pub const __builtin_logf = @import("std").zig.c_builtins.__builtin_logf;
pub const __builtin_log2 = @import("std").zig.c_builtins.__builtin_log2;
pub const __builtin_log2f = @import("std").zig.c_builtins.__builtin_log2f;
pub const __builtin_log10 = @import("std").zig.c_builtins.__builtin_log10;
pub const __builtin_log10f = @import("std").zig.c_builtins.__builtin_log10f;
pub const __builtin_abs = @import("std").zig.c_builtins.__builtin_abs;
pub const __builtin_labs = @import("std").zig.c_builtins.__builtin_labs;
pub const __builtin_llabs = @import("std").zig.c_builtins.__builtin_llabs;
pub const __builtin_fabs = @import("std").zig.c_builtins.__builtin_fabs;
pub const __builtin_fabsf = @import("std").zig.c_builtins.__builtin_fabsf;
pub const __builtin_floor = @import("std").zig.c_builtins.__builtin_floor;
pub const __builtin_floorf = @import("std").zig.c_builtins.__builtin_floorf;
pub const __builtin_ceil = @import("std").zig.c_builtins.__builtin_ceil;
pub const __builtin_ceilf = @import("std").zig.c_builtins.__builtin_ceilf;
pub const __builtin_trunc = @import("std").zig.c_builtins.__builtin_trunc;
pub const __builtin_truncf = @import("std").zig.c_builtins.__builtin_truncf;
pub const __builtin_round = @import("std").zig.c_builtins.__builtin_round;
pub const __builtin_roundf = @import("std").zig.c_builtins.__builtin_roundf;
pub const __builtin_strlen = @import("std").zig.c_builtins.__builtin_strlen;
pub const __builtin_strcmp = @import("std").zig.c_builtins.__builtin_strcmp;
pub const __builtin_object_size = @import("std").zig.c_builtins.__builtin_object_size;
pub const __builtin___memset_chk = @import("std").zig.c_builtins.__builtin___memset_chk;
pub const __builtin_memset = @import("std").zig.c_builtins.__builtin_memset;
pub const __builtin___memcpy_chk = @import("std").zig.c_builtins.__builtin___memcpy_chk;
pub const __builtin_memcpy = @import("std").zig.c_builtins.__builtin_memcpy;
pub const __builtin_expect = @import("std").zig.c_builtins.__builtin_expect;
pub const __builtin_nanf = @import("std").zig.c_builtins.__builtin_nanf;
pub const __builtin_huge_valf = @import("std").zig.c_builtins.__builtin_huge_valf;
pub const __builtin_inff = @import("std").zig.c_builtins.__builtin_inff;
pub const __builtin_isnan = @import("std").zig.c_builtins.__builtin_isnan;
pub const __builtin_isinf = @import("std").zig.c_builtins.__builtin_isinf;
pub const __builtin_isinf_sign = @import("std").zig.c_builtins.__builtin_isinf_sign;
pub const __has_builtin = @import("std").zig.c_builtins.__has_builtin;
pub const __builtin_assume = @import("std").zig.c_builtins.__builtin_assume;
pub const __builtin_unreachable = @import("std").zig.c_builtins.__builtin_unreachable;
pub const __builtin_constant_p = @import("std").zig.c_builtins.__builtin_constant_p;
pub const __builtin_mul_overflow = @import("std").zig.c_builtins.__builtin_mul_overflow;
pub const struct_iovec = extern struct {
    iov_base: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    iov_len: usize = @import("std").mem.zeroes(usize),
};
pub const __u_char = u8;
pub const __u_short = c_ushort;
pub const __u_int = c_uint;
pub const __u_long = c_ulong;
pub const __int8_t = i8;
pub const __uint8_t = u8;
pub const __int16_t = c_short;
pub const __uint16_t = c_ushort;
pub const __int32_t = c_int;
pub const __uint32_t = c_uint;
pub const __int64_t = c_long;
pub const __uint64_t = c_ulong;
pub const __int_least8_t = __int8_t;
pub const __uint_least8_t = __uint8_t;
pub const __int_least16_t = __int16_t;
pub const __uint_least16_t = __uint16_t;
pub const __int_least32_t = __int32_t;
pub const __uint_least32_t = __uint32_t;
pub const __int_least64_t = __int64_t;
pub const __uint_least64_t = __uint64_t;
pub const __quad_t = c_long;
pub const __u_quad_t = c_ulong;
pub const __intmax_t = c_long;
pub const __uintmax_t = c_ulong;
pub const __dev_t = c_ulong;
pub const __uid_t = c_uint;
pub const __gid_t = c_uint;
pub const __ino_t = c_ulong;
pub const __ino64_t = c_ulong;
pub const __mode_t = c_uint;
pub const __nlink_t = c_uint;
pub const __off_t = c_long;
pub const __off64_t = c_long;
pub const __pid_t = c_int;
pub const __fsid_t = extern struct {
    __val: [2]c_int = @import("std").mem.zeroes([2]c_int),
};
pub const __clock_t = c_long;
pub const __rlim_t = c_ulong;
pub const __rlim64_t = c_ulong;
pub const __id_t = c_uint;
pub const __time_t = c_long;
pub const __useconds_t = c_uint;
pub const __suseconds_t = c_long;
pub const __suseconds64_t = c_long;
pub const __daddr_t = c_int;
pub const __key_t = c_int;
pub const __clockid_t = c_int;
pub const __timer_t = ?*anyopaque;
pub const __blksize_t = c_int;
pub const __blkcnt_t = c_long;
pub const __blkcnt64_t = c_long;
pub const __fsblkcnt_t = c_ulong;
pub const __fsblkcnt64_t = c_ulong;
pub const __fsfilcnt_t = c_ulong;
pub const __fsfilcnt64_t = c_ulong;
pub const __fsword_t = c_long;
pub const __ssize_t = c_long;
pub const __syscall_slong_t = c_long;
pub const __syscall_ulong_t = c_ulong;
pub const __loff_t = __off64_t;
pub const __caddr_t = [*c]u8;
pub const __intptr_t = c_long;
pub const __socklen_t = c_uint;
pub const __sig_atomic_t = c_int;
pub const u_char = __u_char;
pub const u_short = __u_short;
pub const u_int = __u_int;
pub const u_long = __u_long;
pub const quad_t = __quad_t;
pub const u_quad_t = __u_quad_t;
pub const fsid_t = __fsid_t;
pub const loff_t = __loff_t;
pub const ino_t = __ino_t;
pub const dev_t = __dev_t;
pub const gid_t = __gid_t;
pub const mode_t = __mode_t;
pub const nlink_t = __nlink_t;
pub const uid_t = __uid_t;
pub const off_t = __off_t;
pub const pid_t = __pid_t;
pub const id_t = __id_t;
pub const daddr_t = __daddr_t;
pub const caddr_t = __caddr_t;
pub const key_t = __key_t;
pub const clock_t = __clock_t;
pub const clockid_t = __clockid_t;
pub const time_t = __time_t;
pub const timer_t = __timer_t;
pub const ulong = c_ulong;
pub const ushort = c_ushort;
pub const uint = c_uint;
pub const u_int8_t = __uint8_t;
pub const u_int16_t = __uint16_t;
pub const u_int32_t = __uint32_t;
pub const u_int64_t = __uint64_t;
pub const register_t = c_long;
pub fn __bswap_16(arg___bsx: __uint16_t) callconv(.c) __uint16_t {
    var __bsx = arg___bsx;
    _ = &__bsx;
    return @as(__uint16_t, @bitCast(@as(c_short, @truncate(((@as(c_int, @bitCast(@as(c_uint, __bsx))) >> @intCast(8)) & @as(c_int, 255)) | ((@as(c_int, @bitCast(@as(c_uint, __bsx))) & @as(c_int, 255)) << @intCast(8))))));
}
pub fn __bswap_32(arg___bsx: __uint32_t) callconv(.c) __uint32_t {
    var __bsx = arg___bsx;
    _ = &__bsx;
    return ((((__bsx & @as(c_uint, 4278190080)) >> @intCast(24)) | ((__bsx & @as(c_uint, 16711680)) >> @intCast(8))) | ((__bsx & @as(c_uint, 65280)) << @intCast(8))) | ((__bsx & @as(c_uint, 255)) << @intCast(24));
}
pub fn __bswap_64(arg___bsx: __uint64_t) callconv(.c) __uint64_t {
    var __bsx = arg___bsx;
    _ = &__bsx;
    return @as(__uint64_t, @bitCast(@as(c_ulong, @truncate(((((((((@as(c_ulonglong, @bitCast(@as(c_ulonglong, __bsx))) & @as(c_ulonglong, 18374686479671623680)) >> @intCast(56)) | ((@as(c_ulonglong, @bitCast(@as(c_ulonglong, __bsx))) & @as(c_ulonglong, 71776119061217280)) >> @intCast(40))) | ((@as(c_ulonglong, @bitCast(@as(c_ulonglong, __bsx))) & @as(c_ulonglong, 280375465082880)) >> @intCast(24))) | ((@as(c_ulonglong, @bitCast(@as(c_ulonglong, __bsx))) & @as(c_ulonglong, 1095216660480)) >> @intCast(8))) | ((@as(c_ulonglong, @bitCast(@as(c_ulonglong, __bsx))) & @as(c_ulonglong, 4278190080)) << @intCast(8))) | ((@as(c_ulonglong, @bitCast(@as(c_ulonglong, __bsx))) & @as(c_ulonglong, 16711680)) << @intCast(24))) | ((@as(c_ulonglong, @bitCast(@as(c_ulonglong, __bsx))) & @as(c_ulonglong, 65280)) << @intCast(40))) | ((@as(c_ulonglong, @bitCast(@as(c_ulonglong, __bsx))) & @as(c_ulonglong, 255)) << @intCast(56))))));
}
pub fn __uint16_identity(arg___x: __uint16_t) callconv(.c) __uint16_t {
    var __x = arg___x;
    _ = &__x;
    return __x;
}
pub fn __uint32_identity(arg___x: __uint32_t) callconv(.c) __uint32_t {
    var __x = arg___x;
    _ = &__x;
    return __x;
}
pub fn __uint64_identity(arg___x: __uint64_t) callconv(.c) __uint64_t {
    var __x = arg___x;
    _ = &__x;
    return __x;
}
pub const __sigset_t = extern struct {
    __val: [16]c_ulong = @import("std").mem.zeroes([16]c_ulong),
};
pub const sigset_t = __sigset_t;
pub const struct_timeval = extern struct {
    tv_sec: __time_t = @import("std").mem.zeroes(__time_t),
    tv_usec: __suseconds_t = @import("std").mem.zeroes(__suseconds_t),
};
pub const struct_timespec = extern struct {
    tv_sec: __time_t = @import("std").mem.zeroes(__time_t),
    tv_nsec: __syscall_slong_t = @import("std").mem.zeroes(__syscall_slong_t),
};
pub const suseconds_t = __suseconds_t;
pub const __fd_mask = c_long;
pub const fd_set = extern struct {
    __fds_bits: [16]__fd_mask = @import("std").mem.zeroes([16]__fd_mask),
};
pub const fd_mask = __fd_mask;
pub extern fn select(__nfds: c_int, noalias __readfds: [*c]fd_set, noalias __writefds: [*c]fd_set, noalias __exceptfds: [*c]fd_set, noalias __timeout: [*c]struct_timeval) c_int;
pub extern fn pselect(__nfds: c_int, noalias __readfds: [*c]fd_set, noalias __writefds: [*c]fd_set, noalias __exceptfds: [*c]fd_set, noalias __timeout: [*c]const struct_timespec, noalias __sigmask: [*c]const __sigset_t) c_int;
pub const blksize_t = __blksize_t;
pub const blkcnt_t = __blkcnt_t;
pub const fsblkcnt_t = __fsblkcnt_t;
pub const fsfilcnt_t = __fsfilcnt_t;
const struct_unnamed_1 = extern struct {
    __low: c_uint = @import("std").mem.zeroes(c_uint),
    __high: c_uint = @import("std").mem.zeroes(c_uint),
};
pub const __atomic_wide_counter = extern union {
    __value64: c_ulonglong,
    __value32: struct_unnamed_1,
};
pub const struct___pthread_internal_list = extern struct {
    __prev: [*c]struct___pthread_internal_list = @import("std").mem.zeroes([*c]struct___pthread_internal_list),
    __next: [*c]struct___pthread_internal_list = @import("std").mem.zeroes([*c]struct___pthread_internal_list),
};
pub const __pthread_list_t = struct___pthread_internal_list;
pub const struct___pthread_internal_slist = extern struct {
    __next: [*c]struct___pthread_internal_slist = @import("std").mem.zeroes([*c]struct___pthread_internal_slist),
};
pub const __pthread_slist_t = struct___pthread_internal_slist;
pub const struct___pthread_mutex_s = extern struct {
    __lock: c_int = @import("std").mem.zeroes(c_int),
    __count: c_uint = @import("std").mem.zeroes(c_uint),
    __owner: c_int = @import("std").mem.zeroes(c_int),
    __nusers: c_uint = @import("std").mem.zeroes(c_uint),
    __kind: c_int = @import("std").mem.zeroes(c_int),
    __spins: c_int = @import("std").mem.zeroes(c_int),
    __list: __pthread_list_t = @import("std").mem.zeroes(__pthread_list_t),
};
pub const struct___pthread_rwlock_arch_t = extern struct {
    __readers: c_uint = @import("std").mem.zeroes(c_uint),
    __writers: c_uint = @import("std").mem.zeroes(c_uint),
    __wrphase_futex: c_uint = @import("std").mem.zeroes(c_uint),
    __writers_futex: c_uint = @import("std").mem.zeroes(c_uint),
    __pad3: c_uint = @import("std").mem.zeroes(c_uint),
    __pad4: c_uint = @import("std").mem.zeroes(c_uint),
    __cur_writer: c_int = @import("std").mem.zeroes(c_int),
    __shared: c_int = @import("std").mem.zeroes(c_int),
    __pad1: c_ulong = @import("std").mem.zeroes(c_ulong),
    __pad2: c_ulong = @import("std").mem.zeroes(c_ulong),
    __flags: c_uint = @import("std").mem.zeroes(c_uint),
};
pub const struct___pthread_cond_s = extern struct {
    __wseq: __atomic_wide_counter = @import("std").mem.zeroes(__atomic_wide_counter),
    __g1_start: __atomic_wide_counter = @import("std").mem.zeroes(__atomic_wide_counter),
    __g_size: [2]c_uint = @import("std").mem.zeroes([2]c_uint),
    __g1_orig_size: c_uint = @import("std").mem.zeroes(c_uint),
    __wrefs: c_uint = @import("std").mem.zeroes(c_uint),
    __g_signals: [2]c_uint = @import("std").mem.zeroes([2]c_uint),
    __unused_initialized_1: c_uint = @import("std").mem.zeroes(c_uint),
    __unused_initialized_2: c_uint = @import("std").mem.zeroes(c_uint),
};
pub const __tss_t = c_uint;
pub const __thrd_t = c_ulong;
pub const __once_flag = extern struct {
    __data: c_int = @import("std").mem.zeroes(c_int),
};
pub const pthread_t = c_ulong;
pub const pthread_mutexattr_t = extern union {
    __size: [8]u8,
    __align: c_int,
};
pub const pthread_condattr_t = extern union {
    __size: [8]u8,
    __align: c_int,
};
pub const pthread_key_t = c_uint;
pub const pthread_once_t = c_int;
pub const union_pthread_attr_t = extern union {
    __size: [64]u8,
    __align: c_long,
};
pub const pthread_attr_t = union_pthread_attr_t;
pub const pthread_mutex_t = extern union {
    __data: struct___pthread_mutex_s,
    __size: [48]u8,
    __align: c_long,
};
pub const pthread_cond_t = extern union {
    __data: struct___pthread_cond_s,
    __size: [48]u8,
    __align: c_longlong,
};
pub const pthread_rwlock_t = extern union {
    __data: struct___pthread_rwlock_arch_t,
    __size: [56]u8,
    __align: c_long,
};
pub const pthread_rwlockattr_t = extern union {
    __size: [8]u8,
    __align: c_long,
};
pub const pthread_spinlock_t = c_int;
pub const pthread_barrier_t = extern union {
    __size: [32]u8,
    __align: c_long,
};
pub const pthread_barrierattr_t = extern union {
    __size: [8]u8,
    __align: c_int,
};
pub const socklen_t = __socklen_t;
pub const SOCK_STREAM: c_int = 1;
pub const SOCK_DGRAM: c_int = 2;
pub const SOCK_RAW: c_int = 3;
pub const SOCK_RDM: c_int = 4;
pub const SOCK_SEQPACKET: c_int = 5;
pub const SOCK_DCCP: c_int = 6;
pub const SOCK_PACKET: c_int = 10;
pub const SOCK_CLOEXEC: c_int = 524288;
pub const SOCK_NONBLOCK: c_int = 2048;
pub const enum___socket_type = c_uint;
pub const sa_family_t = c_ushort;
pub const struct_sockaddr = extern struct {
    sa_family: sa_family_t = @import("std").mem.zeroes(sa_family_t),
    sa_data: [14]u8 = @import("std").mem.zeroes([14]u8),
};
pub const struct_sockaddr_storage = extern struct {
    ss_family: sa_family_t = @import("std").mem.zeroes(sa_family_t),
    __ss_padding: [118]u8 = @import("std").mem.zeroes([118]u8),
    __ss_align: c_ulong = @import("std").mem.zeroes(c_ulong),
};
pub const MSG_OOB: c_int = 1;
pub const MSG_PEEK: c_int = 2;
pub const MSG_DONTROUTE: c_int = 4;
pub const MSG_CTRUNC: c_int = 8;
pub const MSG_PROXY: c_int = 16;
pub const MSG_TRUNC: c_int = 32;
pub const MSG_DONTWAIT: c_int = 64;
pub const MSG_EOR: c_int = 128;
pub const MSG_WAITALL: c_int = 256;
pub const MSG_FIN: c_int = 512;
pub const MSG_SYN: c_int = 1024;
pub const MSG_CONFIRM: c_int = 2048;
pub const MSG_RST: c_int = 4096;
pub const MSG_ERRQUEUE: c_int = 8192;
pub const MSG_NOSIGNAL: c_int = 16384;
pub const MSG_MORE: c_int = 32768;
pub const MSG_WAITFORONE: c_int = 65536;
pub const MSG_BATCH: c_int = 262144;
pub const MSG_SOCK_DEVMEM: c_int = 33554432;
pub const MSG_ZEROCOPY: c_int = 67108864;
pub const MSG_FASTOPEN: c_int = 536870912;
pub const MSG_CMSG_CLOEXEC: c_int = 1073741824;
const enum_unnamed_2 = c_uint;
pub const struct_msghdr = extern struct {
    msg_name: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    msg_namelen: socklen_t = @import("std").mem.zeroes(socklen_t),
    msg_iov: [*c]struct_iovec = @import("std").mem.zeroes([*c]struct_iovec),
    msg_iovlen: usize = @import("std").mem.zeroes(usize),
    msg_control: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    msg_controllen: usize = @import("std").mem.zeroes(usize),
    msg_flags: c_int = @import("std").mem.zeroes(c_int),
};
pub const struct_cmsghdr = extern struct {
    cmsg_len: usize align(8) = @import("std").mem.zeroes(usize),
    cmsg_level: c_int = @import("std").mem.zeroes(c_int),
    cmsg_type: c_int = @import("std").mem.zeroes(c_int),
    pub fn __cmsg_data(self: anytype) @import("std").zig.c_translation.FlexibleArrayType(@TypeOf(self), u8) {
        const Intermediate = @import("std").zig.c_translation.FlexibleArrayType(@TypeOf(self), u8);
        const ReturnType = @import("std").zig.c_translation.FlexibleArrayType(@TypeOf(self), u8);
        return @as(ReturnType, @ptrCast(@alignCast(@as(Intermediate, @ptrCast(self)) + 16)));
    }
};
pub extern fn __cmsg_nxthdr(__mhdr: [*c]struct_msghdr, __cmsg: [*c]struct_cmsghdr) [*c]struct_cmsghdr;
pub const SCM_RIGHTS: c_int = 1;
const enum_unnamed_3 = c_uint;
pub const __kernel_fd_set = extern struct {
    fds_bits: [16]c_ulong = @import("std").mem.zeroes([16]c_ulong),
};
pub const __kernel_sighandler_t = ?*const fn (c_int) callconv(.c) void;
pub const __kernel_key_t = c_int;
pub const __kernel_mqd_t = c_int;
pub const __kernel_old_uid_t = c_ushort;
pub const __kernel_old_gid_t = c_ushort;
pub const __kernel_long_t = c_long;
pub const __kernel_ulong_t = c_ulong;
pub const __kernel_ino_t = __kernel_ulong_t;
pub const __kernel_mode_t = c_uint;
pub const __kernel_pid_t = c_int;
pub const __kernel_ipc_pid_t = c_int;
pub const __kernel_uid_t = c_uint;
pub const __kernel_gid_t = c_uint;
pub const __kernel_suseconds_t = __kernel_long_t;
pub const __kernel_daddr_t = c_int;
pub const __kernel_uid32_t = c_uint;
pub const __kernel_gid32_t = c_uint;
pub const __kernel_old_dev_t = c_uint;
pub const __kernel_size_t = __kernel_ulong_t;
pub const __kernel_ssize_t = __kernel_long_t;
pub const __kernel_ptrdiff_t = __kernel_long_t;
pub const __kernel_fsid_t = extern struct {
    val: [2]c_int = @import("std").mem.zeroes([2]c_int),
};
pub const __kernel_off_t = __kernel_long_t;
pub const __kernel_loff_t = c_longlong;
pub const __kernel_old_time_t = __kernel_long_t;
pub const __kernel_time_t = __kernel_long_t;
pub const __kernel_time64_t = c_longlong;
pub const __kernel_clock_t = __kernel_long_t;
pub const __kernel_timer_t = c_int;
pub const __kernel_clockid_t = c_int;
pub const __kernel_caddr_t = [*c]u8;
pub const __kernel_uid16_t = c_ushort;
pub const __kernel_gid16_t = c_ushort;
pub const struct_linger = extern struct {
    l_onoff: c_int = @import("std").mem.zeroes(c_int),
    l_linger: c_int = @import("std").mem.zeroes(c_int),
};
pub const struct_osockaddr = extern struct {
    sa_family: c_ushort = @import("std").mem.zeroes(c_ushort),
    sa_data: [14]u8 = @import("std").mem.zeroes([14]u8),
};
pub const SHUT_RD: c_int = 0;
pub const SHUT_WR: c_int = 1;
pub const SHUT_RDWR: c_int = 2;
const enum_unnamed_4 = c_uint;
pub extern fn socket(__domain: c_int, __type: c_int, __protocol: c_int) c_int;
pub extern fn socketpair(__domain: c_int, __type: c_int, __protocol: c_int, __fds: [*c]c_int) c_int;
pub extern fn bind(__fd: c_int, __addr: [*c]const struct_sockaddr, __len: socklen_t) c_int;
pub extern fn getsockname(__fd: c_int, noalias __addr: [*c]struct_sockaddr, noalias __len: [*c]socklen_t) c_int;
pub extern fn connect(__fd: c_int, __addr: [*c]const struct_sockaddr, __len: socklen_t) c_int;
pub extern fn getpeername(__fd: c_int, noalias __addr: [*c]struct_sockaddr, noalias __len: [*c]socklen_t) c_int;
pub extern fn send(__fd: c_int, __buf: ?*const anyopaque, __n: usize, __flags: c_int) isize;
pub extern fn recv(__fd: c_int, __buf: ?*anyopaque, __n: usize, __flags: c_int) isize;
pub extern fn sendto(__fd: c_int, __buf: ?*const anyopaque, __n: usize, __flags: c_int, __addr: [*c]const struct_sockaddr, __addr_len: socklen_t) isize;
pub extern fn recvfrom(__fd: c_int, noalias __buf: ?*anyopaque, __n: usize, __flags: c_int, noalias __addr: [*c]struct_sockaddr, noalias __addr_len: [*c]socklen_t) isize;
pub extern fn sendmsg(__fd: c_int, __message: [*c]const struct_msghdr, __flags: c_int) isize;
pub extern fn recvmsg(__fd: c_int, __message: [*c]struct_msghdr, __flags: c_int) isize;
pub extern fn getsockopt(__fd: c_int, __level: c_int, __optname: c_int, noalias __optval: ?*anyopaque, noalias __optlen: [*c]socklen_t) c_int;
pub extern fn setsockopt(__fd: c_int, __level: c_int, __optname: c_int, __optval: ?*const anyopaque, __optlen: socklen_t) c_int;
pub extern fn listen(__fd: c_int, __n: c_int) c_int;
pub extern fn accept(__fd: c_int, noalias __addr: [*c]struct_sockaddr, noalias __addr_len: [*c]socklen_t) c_int;
pub extern fn shutdown(__fd: c_int, __how: c_int) c_int;
pub extern fn sockatmark(__fd: c_int) c_int;
pub extern fn isfdtype(__fd: c_int, __fdtype: c_int) c_int;
pub const int_least8_t = __int_least8_t;
pub const int_least16_t = __int_least16_t;
pub const int_least32_t = __int_least32_t;
pub const int_least64_t = __int_least64_t;
pub const uint_least8_t = __uint_least8_t;
pub const uint_least16_t = __uint_least16_t;
pub const uint_least32_t = __uint_least32_t;
pub const uint_least64_t = __uint_least64_t;
pub const int_fast8_t = i8;
pub const int_fast16_t = c_long;
pub const int_fast32_t = c_long;
pub const int_fast64_t = c_long;
pub const uint_fast8_t = u8;
pub const uint_fast16_t = c_ulong;
pub const uint_fast32_t = c_ulong;
pub const uint_fast64_t = c_ulong;
pub const intmax_t = __intmax_t;
pub const uintmax_t = __uintmax_t;
pub const struct_winsize = extern struct {
    ws_row: c_ushort = @import("std").mem.zeroes(c_ushort),
    ws_col: c_ushort = @import("std").mem.zeroes(c_ushort),
    ws_xpixel: c_ushort = @import("std").mem.zeroes(c_ushort),
    ws_ypixel: c_ushort = @import("std").mem.zeroes(c_ushort),
};
pub const struct_termio = extern struct {
    c_iflag: c_ushort = @import("std").mem.zeroes(c_ushort),
    c_oflag: c_ushort = @import("std").mem.zeroes(c_ushort),
    c_cflag: c_ushort = @import("std").mem.zeroes(c_ushort),
    c_lflag: c_ushort = @import("std").mem.zeroes(c_ushort),
    c_line: u8 = @import("std").mem.zeroes(u8),
    c_cc: [8]u8 = @import("std").mem.zeroes([8]u8),
};
pub extern fn ioctl(__fd: c_int, __request: c_ulong, ...) c_int;
pub const EPOLL_CLOEXEC: c_int = 524288;
const enum_unnamed_5 = c_uint;
pub const EPOLLIN: c_int = 1;
pub const EPOLLPRI: c_int = 2;
pub const EPOLLOUT: c_int = 4;
pub const EPOLLRDNORM: c_int = 64;
pub const EPOLLRDBAND: c_int = 128;
pub const EPOLLWRNORM: c_int = 256;
pub const EPOLLWRBAND: c_int = 512;
pub const EPOLLMSG: c_int = 1024;
pub const EPOLLERR: c_int = 8;
pub const EPOLLHUP: c_int = 16;
pub const EPOLLRDHUP: c_int = 8192;
pub const EPOLLEXCLUSIVE: c_int = 268435456;
pub const EPOLLWAKEUP: c_int = 536870912;
pub const EPOLLONESHOT: c_int = 1073741824;
pub const EPOLLET: c_uint = 2147483648;
pub const enum_EPOLL_EVENTS = c_uint;
pub const union_epoll_data = extern union {
    ptr: ?*anyopaque,
    fd: c_int,
    u32: u32,
    u64: u64,
};
pub const epoll_data_t = union_epoll_data;
pub const struct_epoll_event = extern struct {
    events: u32 = @import("std").mem.zeroes(u32),
    data: epoll_data_t = @import("std").mem.zeroes(epoll_data_t),
};
pub const struct_epoll_params = extern struct {
    busy_poll_usecs: u32 = @import("std").mem.zeroes(u32),
    busy_poll_budget: u16 = @import("std").mem.zeroes(u16),
    prefer_busy_poll: u8 = @import("std").mem.zeroes(u8),
    __pad: u8 = @import("std").mem.zeroes(u8),
};
pub extern fn epoll_create(__size: c_int) c_int;
pub extern fn epoll_create1(__flags: c_int) c_int;
pub extern fn epoll_ctl(__epfd: c_int, __op: c_int, __fd: c_int, __event: [*c]struct_epoll_event) c_int;
pub extern fn epoll_wait(__epfd: c_int, __events: [*c]struct_epoll_event, __maxevents: c_int, __timeout: c_int) c_int;
pub extern fn epoll_pwait(__epfd: c_int, __events: [*c]struct_epoll_event, __maxevents: c_int, __timeout: c_int, __ss: [*c]const __sigset_t) c_int;
pub extern fn epoll_pwait2(__epfd: c_int, __events: [*c]struct_epoll_event, __maxevents: c_int, __timeout: [*c]const struct_timespec, __ss: [*c]const __sigset_t) c_int;
pub const struct_tm = extern struct {
    tm_sec: c_int = @import("std").mem.zeroes(c_int),
    tm_min: c_int = @import("std").mem.zeroes(c_int),
    tm_hour: c_int = @import("std").mem.zeroes(c_int),
    tm_mday: c_int = @import("std").mem.zeroes(c_int),
    tm_mon: c_int = @import("std").mem.zeroes(c_int),
    tm_year: c_int = @import("std").mem.zeroes(c_int),
    tm_wday: c_int = @import("std").mem.zeroes(c_int),
    tm_yday: c_int = @import("std").mem.zeroes(c_int),
    tm_isdst: c_int = @import("std").mem.zeroes(c_int),
    tm_gmtoff: c_long = @import("std").mem.zeroes(c_long),
    tm_zone: [*c]const u8 = @import("std").mem.zeroes([*c]const u8),
};
pub const struct_itimerspec = extern struct {
    it_interval: struct_timespec = @import("std").mem.zeroes(struct_timespec),
    it_value: struct_timespec = @import("std").mem.zeroes(struct_timespec),
};
pub const union_sigval = extern union {
    sival_int: c_int,
    sival_ptr: ?*anyopaque,
};
pub const __sigval_t = union_sigval;
const struct_unnamed_7 = extern struct {
    _function: ?*const fn (__sigval_t) callconv(.c) void = @import("std").mem.zeroes(?*const fn (__sigval_t) callconv(.c) void),
    _attribute: [*c]pthread_attr_t = @import("std").mem.zeroes([*c]pthread_attr_t),
};
const union_unnamed_6 = extern union {
    _pad: [12]c_int,
    _tid: __pid_t,
    _sigev_thread: struct_unnamed_7,
};
pub const struct_sigevent = extern struct {
    sigev_value: __sigval_t = @import("std").mem.zeroes(__sigval_t),
    sigev_signo: c_int = @import("std").mem.zeroes(c_int),
    sigev_notify: c_int = @import("std").mem.zeroes(c_int),
    _sigev_un: union_unnamed_6 = @import("std").mem.zeroes(union_unnamed_6),
};
pub const struct___locale_data_8 = opaque {};
pub const struct___locale_struct = extern struct {
    __locales: [13]?*struct___locale_data_8 = @import("std").mem.zeroes([13]?*struct___locale_data_8),
    __ctype_b: [*c]const c_ushort = @import("std").mem.zeroes([*c]const c_ushort),
    __ctype_tolower: [*c]const c_int = @import("std").mem.zeroes([*c]const c_int),
    __ctype_toupper: [*c]const c_int = @import("std").mem.zeroes([*c]const c_int),
    __names: [13][*c]const u8 = @import("std").mem.zeroes([13][*c]const u8),
};
pub const __locale_t = [*c]struct___locale_struct;
pub const locale_t = __locale_t;
pub extern fn clock() clock_t;
pub extern fn time(__timer: [*c]time_t) time_t;
pub extern fn difftime(__time1: time_t, __time0: time_t) f64;
pub extern fn mktime(__tp: [*c]struct_tm) time_t;
pub extern fn strftime(noalias __s: [*c]u8, __maxsize: usize, noalias __format: [*c]const u8, noalias __tp: [*c]const struct_tm) usize;
pub extern fn strftime_l(noalias __s: [*c]u8, __maxsize: usize, noalias __format: [*c]const u8, noalias __tp: [*c]const struct_tm, __loc: locale_t) usize;
pub extern fn gmtime(__timer: [*c]const time_t) [*c]struct_tm;
pub extern fn localtime(__timer: [*c]const time_t) [*c]struct_tm;
pub extern fn gmtime_r(noalias __timer: [*c]const time_t, noalias __tp: [*c]struct_tm) [*c]struct_tm;
pub extern fn localtime_r(noalias __timer: [*c]const time_t, noalias __tp: [*c]struct_tm) [*c]struct_tm;
pub extern fn asctime(__tp: [*c]const struct_tm) [*c]u8;
pub extern fn ctime(__timer: [*c]const time_t) [*c]u8;
pub extern fn asctime_r(noalias __tp: [*c]const struct_tm, noalias __buf: [*c]u8) [*c]u8;
pub extern fn ctime_r(noalias __timer: [*c]const time_t, noalias __buf: [*c]u8) [*c]u8;
pub extern var __tzname: [2][*c]u8;
pub extern var __daylight: c_int;
pub extern var __timezone: c_long;
pub extern var tzname: [2][*c]u8;
pub extern fn tzset() void;
pub extern var daylight: c_int;
pub extern var timezone: c_long;
pub extern fn timegm(__tp: [*c]struct_tm) time_t;
pub extern fn timelocal(__tp: [*c]struct_tm) time_t;
pub extern fn dysize(__year: c_int) c_int;
pub extern fn nanosleep(__requested_time: [*c]const struct_timespec, __remaining: [*c]struct_timespec) c_int;
pub extern fn clock_getres(__clock_id: clockid_t, __res: [*c]struct_timespec) c_int;
pub extern fn clock_gettime(__clock_id: clockid_t, __tp: [*c]struct_timespec) c_int;
pub extern fn clock_settime(__clock_id: clockid_t, __tp: [*c]const struct_timespec) c_int;
pub extern fn clock_nanosleep(__clock_id: clockid_t, __flags: c_int, __req: [*c]const struct_timespec, __rem: [*c]struct_timespec) c_int;
pub extern fn clock_getcpuclockid(__pid: pid_t, __clock_id: [*c]clockid_t) c_int;
pub extern fn timer_create(__clock_id: clockid_t, noalias __evp: [*c]struct_sigevent, noalias __timerid: [*c]timer_t) c_int;
pub extern fn timer_delete(__timerid: timer_t) c_int;
pub extern fn timer_settime(__timerid: timer_t, __flags: c_int, noalias __value: [*c]const struct_itimerspec, noalias __ovalue: [*c]struct_itimerspec) c_int;
pub extern fn timer_gettime(__timerid: timer_t, __value: [*c]struct_itimerspec) c_int;
pub extern fn timer_getoverrun(__timerid: timer_t) c_int;
pub extern fn timespec_get(__ts: [*c]struct_timespec, __base: c_int) c_int;
pub const TFD_CLOEXEC: c_int = 524288;
pub const TFD_NONBLOCK: c_int = 2048;
const enum_unnamed_9 = c_uint;
pub const TFD_TIMER_ABSTIME: c_int = 1;
pub const TFD_TIMER_CANCEL_ON_SET: c_int = 2;
const enum_unnamed_10 = c_uint;
pub extern fn timerfd_create(__clock_id: __clockid_t, __flags: c_int) c_int;
pub extern fn timerfd_settime(__ufd: c_int, __flags: c_int, __utmr: [*c]const struct_itimerspec, __otmr: [*c]struct_itimerspec) c_int;
pub extern fn timerfd_gettime(__ufd: c_int, __otmr: [*c]struct_itimerspec) c_int;
pub const EFD_SEMAPHORE: c_int = 1;
pub const EFD_CLOEXEC: c_int = 524288;
pub const EFD_NONBLOCK: c_int = 2048;
const enum_unnamed_11 = c_uint;
pub const eventfd_t = u64;
pub extern fn eventfd(__count: c_uint, __flags: c_int) c_int;
pub extern fn eventfd_read(__fd: c_int, __value: [*c]eventfd_t) c_int;
pub extern fn eventfd_write(__fd: c_int, __value: eventfd_t) c_int;
pub const in_addr_t = u32;
pub const struct_in_addr = extern struct {
    s_addr: in_addr_t = @import("std").mem.zeroes(in_addr_t),
};
pub const struct_ip_opts = extern struct {
    ip_dst: struct_in_addr = @import("std").mem.zeroes(struct_in_addr),
    ip_opts: [40]u8 = @import("std").mem.zeroes([40]u8),
};
pub const struct_in_pktinfo = extern struct {
    ipi_ifindex: c_int = @import("std").mem.zeroes(c_int),
    ipi_spec_dst: struct_in_addr = @import("std").mem.zeroes(struct_in_addr),
    ipi_addr: struct_in_addr = @import("std").mem.zeroes(struct_in_addr),
};
pub const IPPROTO_IP: c_int = 0;
pub const IPPROTO_ICMP: c_int = 1;
pub const IPPROTO_IGMP: c_int = 2;
pub const IPPROTO_IPIP: c_int = 4;
pub const IPPROTO_TCP: c_int = 6;
pub const IPPROTO_EGP: c_int = 8;
pub const IPPROTO_PUP: c_int = 12;
pub const IPPROTO_UDP: c_int = 17;
pub const IPPROTO_IDP: c_int = 22;
pub const IPPROTO_TP: c_int = 29;
pub const IPPROTO_DCCP: c_int = 33;
pub const IPPROTO_IPV6: c_int = 41;
pub const IPPROTO_RSVP: c_int = 46;
pub const IPPROTO_GRE: c_int = 47;
pub const IPPROTO_ESP: c_int = 50;
pub const IPPROTO_AH: c_int = 51;
pub const IPPROTO_MTP: c_int = 92;
pub const IPPROTO_BEETPH: c_int = 94;
pub const IPPROTO_ENCAP: c_int = 98;
pub const IPPROTO_PIM: c_int = 103;
pub const IPPROTO_COMP: c_int = 108;
pub const IPPROTO_L2TP: c_int = 115;
pub const IPPROTO_SCTP: c_int = 132;
pub const IPPROTO_UDPLITE: c_int = 136;
pub const IPPROTO_MPLS: c_int = 137;
pub const IPPROTO_ETHERNET: c_int = 143;
pub const IPPROTO_RAW: c_int = 255;
pub const IPPROTO_SMC: c_int = 256;
pub const IPPROTO_MPTCP: c_int = 262;
pub const IPPROTO_MAX: c_int = 263;
const enum_unnamed_12 = c_uint;
pub const IPPROTO_HOPOPTS: c_int = 0;
pub const IPPROTO_ROUTING: c_int = 43;
pub const IPPROTO_FRAGMENT: c_int = 44;
pub const IPPROTO_ICMPV6: c_int = 58;
pub const IPPROTO_NONE: c_int = 59;
pub const IPPROTO_DSTOPTS: c_int = 60;
pub const IPPROTO_MH: c_int = 135;
const enum_unnamed_13 = c_uint;
pub const in_port_t = u16;
pub const IPPORT_ECHO: c_int = 7;
pub const IPPORT_DISCARD: c_int = 9;
pub const IPPORT_SYSTAT: c_int = 11;
pub const IPPORT_DAYTIME: c_int = 13;
pub const IPPORT_NETSTAT: c_int = 15;
pub const IPPORT_FTP: c_int = 21;
pub const IPPORT_TELNET: c_int = 23;
pub const IPPORT_SMTP: c_int = 25;
pub const IPPORT_TIMESERVER: c_int = 37;
pub const IPPORT_NAMESERVER: c_int = 42;
pub const IPPORT_WHOIS: c_int = 43;
pub const IPPORT_MTP: c_int = 57;
pub const IPPORT_TFTP: c_int = 69;
pub const IPPORT_RJE: c_int = 77;
pub const IPPORT_FINGER: c_int = 79;
pub const IPPORT_TTYLINK: c_int = 87;
pub const IPPORT_SUPDUP: c_int = 95;
pub const IPPORT_EXECSERVER: c_int = 512;
pub const IPPORT_LOGINSERVER: c_int = 513;
pub const IPPORT_CMDSERVER: c_int = 514;
pub const IPPORT_EFSSERVER: c_int = 520;
pub const IPPORT_BIFFUDP: c_int = 512;
pub const IPPORT_WHOSERVER: c_int = 513;
pub const IPPORT_ROUTESERVER: c_int = 520;
pub const IPPORT_RESERVED: c_int = 1024;
pub const IPPORT_USERRESERVED: c_int = 5000;
const enum_unnamed_14 = c_uint;
const union_unnamed_15 = extern union {
    __u6_addr8: [16]u8,
    __u6_addr16: [8]u16,
    __u6_addr32: [4]u32,
};
pub const struct_in6_addr = extern struct {
    __in6_u: union_unnamed_15 = @import("std").mem.zeroes(union_unnamed_15),
};
pub extern const in6addr_any: struct_in6_addr;
pub extern const in6addr_loopback: struct_in6_addr;
pub const struct_sockaddr_in = extern struct {
    sin_family: sa_family_t = @import("std").mem.zeroes(sa_family_t),
    sin_port: in_port_t = @import("std").mem.zeroes(in_port_t),
    sin_addr: struct_in_addr = @import("std").mem.zeroes(struct_in_addr),
    sin_zero: [8]u8 = @import("std").mem.zeroes([8]u8),
};
pub const struct_sockaddr_in6 = extern struct {
    sin6_family: sa_family_t = @import("std").mem.zeroes(sa_family_t),
    sin6_port: in_port_t = @import("std").mem.zeroes(in_port_t),
    sin6_flowinfo: u32 = @import("std").mem.zeroes(u32),
    sin6_addr: struct_in6_addr = @import("std").mem.zeroes(struct_in6_addr),
    sin6_scope_id: u32 = @import("std").mem.zeroes(u32),
};
pub const struct_ip_mreq = extern struct {
    imr_multiaddr: struct_in_addr = @import("std").mem.zeroes(struct_in_addr),
    imr_interface: struct_in_addr = @import("std").mem.zeroes(struct_in_addr),
};
pub const struct_ip_mreqn = extern struct {
    imr_multiaddr: struct_in_addr = @import("std").mem.zeroes(struct_in_addr),
    imr_address: struct_in_addr = @import("std").mem.zeroes(struct_in_addr),
    imr_ifindex: c_int = @import("std").mem.zeroes(c_int),
};
pub const struct_ip_mreq_source = extern struct {
    imr_multiaddr: struct_in_addr = @import("std").mem.zeroes(struct_in_addr),
    imr_interface: struct_in_addr = @import("std").mem.zeroes(struct_in_addr),
    imr_sourceaddr: struct_in_addr = @import("std").mem.zeroes(struct_in_addr),
};
pub const struct_ipv6_mreq = extern struct {
    ipv6mr_multiaddr: struct_in6_addr = @import("std").mem.zeroes(struct_in6_addr),
    ipv6mr_interface: c_uint = @import("std").mem.zeroes(c_uint),
};
pub const struct_group_req = extern struct {
    gr_interface: u32 = @import("std").mem.zeroes(u32),
    gr_group: struct_sockaddr_storage = @import("std").mem.zeroes(struct_sockaddr_storage),
};
pub const struct_group_source_req = extern struct {
    gsr_interface: u32 = @import("std").mem.zeroes(u32),
    gsr_group: struct_sockaddr_storage = @import("std").mem.zeroes(struct_sockaddr_storage),
    gsr_source: struct_sockaddr_storage = @import("std").mem.zeroes(struct_sockaddr_storage),
};
pub const struct_ip_msfilter = extern struct {
    imsf_multiaddr: struct_in_addr = @import("std").mem.zeroes(struct_in_addr),
    imsf_interface: struct_in_addr = @import("std").mem.zeroes(struct_in_addr),
    imsf_fmode: u32 = @import("std").mem.zeroes(u32),
    imsf_numsrc: u32 = @import("std").mem.zeroes(u32),
    imsf_slist: [1]struct_in_addr = @import("std").mem.zeroes([1]struct_in_addr),
};
pub const struct_group_filter = extern struct {
    gf_interface: u32 = @import("std").mem.zeroes(u32),
    gf_group: struct_sockaddr_storage = @import("std").mem.zeroes(struct_sockaddr_storage),
    gf_fmode: u32 = @import("std").mem.zeroes(u32),
    gf_numsrc: u32 = @import("std").mem.zeroes(u32),
    gf_slist: [1]struct_sockaddr_storage = @import("std").mem.zeroes([1]struct_sockaddr_storage),
};
pub extern fn ntohl(__netlong: u32) u32;
pub extern fn ntohs(__netshort: u16) u16;
pub extern fn htonl(__hostlong: u32) u32;
pub extern fn htons(__hostshort: u16) u16;
pub extern fn bindresvport(__sockfd: c_int, __sock_in: [*c]struct_sockaddr_in) c_int;
pub extern fn bindresvport6(__sockfd: c_int, __sock_in: [*c]struct_sockaddr_in6) c_int;
pub const tcp_seq = u32;
// /usr/include/netinet/tcp.h:109:10: warning: struct demoted to opaque type - has bitfield
const struct_unnamed_17 = opaque {};
// /usr/include/netinet/tcp.h:134:11: warning: struct demoted to opaque type - has bitfield
const struct_unnamed_18 = opaque {};
const union_unnamed_16 = extern union {
    unnamed_0: struct_unnamed_17,
    unnamed_1: struct_unnamed_18,
};
pub const struct_tcphdr = extern struct {
    unnamed_0: union_unnamed_16 = @import("std").mem.zeroes(union_unnamed_16),
};
pub const TCP_ESTABLISHED: c_int = 1;
pub const TCP_SYN_SENT: c_int = 2;
pub const TCP_SYN_RECV: c_int = 3;
pub const TCP_FIN_WAIT1: c_int = 4;
pub const TCP_FIN_WAIT2: c_int = 5;
pub const TCP_TIME_WAIT: c_int = 6;
pub const TCP_CLOSE: c_int = 7;
pub const TCP_CLOSE_WAIT: c_int = 8;
pub const TCP_LAST_ACK: c_int = 9;
pub const TCP_LISTEN: c_int = 10;
pub const TCP_CLOSING: c_int = 11;
const enum_unnamed_19 = c_uint;
pub const TCP_CA_Open: c_int = 0;
pub const TCP_CA_Disorder: c_int = 1;
pub const TCP_CA_CWR: c_int = 2;
pub const TCP_CA_Recovery: c_int = 3;
pub const TCP_CA_Loss: c_int = 4;
pub const enum_tcp_ca_state = c_uint;
// /usr/include/netinet/tcp.h:234:11: warning: struct demoted to opaque type - has bitfield
pub const struct_tcp_info = opaque {};
pub const struct_tcp_md5sig = extern struct {
    tcpm_addr: struct_sockaddr_storage = @import("std").mem.zeroes(struct_sockaddr_storage),
    tcpm_flags: u8 = @import("std").mem.zeroes(u8),
    tcpm_prefixlen: u8 = @import("std").mem.zeroes(u8),
    tcpm_keylen: u16 = @import("std").mem.zeroes(u16),
    tcpm_ifindex: c_int = @import("std").mem.zeroes(c_int),
    tcpm_key: [80]u8 = @import("std").mem.zeroes([80]u8),
};
pub const struct_tcp_repair_opt = extern struct {
    opt_code: u32 = @import("std").mem.zeroes(u32),
    opt_val: u32 = @import("std").mem.zeroes(u32),
};
pub const TCP_NO_QUEUE: c_int = 0;
pub const TCP_RECV_QUEUE: c_int = 1;
pub const TCP_SEND_QUEUE: c_int = 2;
pub const TCP_QUEUES_NR: c_int = 3;
const enum_unnamed_20 = c_uint;
pub const struct_tcp_cookie_transactions = extern struct {
    tcpct_flags: u16 = @import("std").mem.zeroes(u16),
    __tcpct_pad1: u8 = @import("std").mem.zeroes(u8),
    tcpct_cookie_desired: u8 = @import("std").mem.zeroes(u8),
    tcpct_s_data_desired: u16 = @import("std").mem.zeroes(u16),
    tcpct_used: u16 = @import("std").mem.zeroes(u16),
    tcpct_value: [536]u8 = @import("std").mem.zeroes([536]u8),
};
pub const struct_tcp_repair_window = extern struct {
    snd_wl1: u32 = @import("std").mem.zeroes(u32),
    snd_wnd: u32 = @import("std").mem.zeroes(u32),
    max_window: u32 = @import("std").mem.zeroes(u32),
    rcv_wnd: u32 = @import("std").mem.zeroes(u32),
    rcv_wup: u32 = @import("std").mem.zeroes(u32),
};
pub const struct_tcp_zerocopy_receive = extern struct {
    address: u64 = @import("std").mem.zeroes(u64),
    length: u32 = @import("std").mem.zeroes(u32),
    recv_skip_hint: u32 = @import("std").mem.zeroes(u32),
};
pub extern fn inet_addr(__cp: [*c]const u8) in_addr_t;
pub extern fn inet_lnaof(__in: struct_in_addr) in_addr_t;
pub extern fn inet_makeaddr(__net: in_addr_t, __host: in_addr_t) struct_in_addr;
pub extern fn inet_netof(__in: struct_in_addr) in_addr_t;
pub extern fn inet_network(__cp: [*c]const u8) in_addr_t;
pub extern fn inet_ntoa(__in: struct_in_addr) [*c]u8;
pub extern fn inet_pton(__af: c_int, noalias __cp: [*c]const u8, noalias __buf: ?*anyopaque) c_int;
pub extern fn inet_ntop(__af: c_int, noalias __cp: ?*const anyopaque, noalias __buf: [*c]u8, __len: socklen_t) [*c]const u8;
pub extern fn inet_aton(__cp: [*c]const u8, __inp: [*c]struct_in_addr) c_int;
pub extern fn inet_neta(__net: in_addr_t, __buf: [*c]u8, __len: usize) [*c]u8;
pub extern fn inet_net_ntop(__af: c_int, __cp: ?*const anyopaque, __bits: c_int, __buf: [*c]u8, __len: usize) [*c]u8;
pub extern fn inet_net_pton(__af: c_int, __cp: [*c]const u8, __buf: ?*anyopaque, __len: usize) c_int;
pub extern fn inet_nsap_addr(__cp: [*c]const u8, __buf: [*c]u8, __len: c_int) c_uint;
pub extern fn inet_nsap_ntoa(__len: c_int, __cp: [*c]const u8, __buf: [*c]u8) [*c]u8;
pub const struct_rpcent = extern struct {
    r_name: [*c]u8 = @import("std").mem.zeroes([*c]u8),
    r_aliases: [*c][*c]u8 = @import("std").mem.zeroes([*c][*c]u8),
    r_number: c_int = @import("std").mem.zeroes(c_int),
};
pub extern fn setrpcent(__stayopen: c_int) void;
pub extern fn endrpcent() void;
pub extern fn getrpcbyname(__name: [*c]const u8) [*c]struct_rpcent;
pub extern fn getrpcbynumber(__number: c_int) [*c]struct_rpcent;
pub extern fn getrpcent() [*c]struct_rpcent;
pub extern fn getrpcbyname_r(__name: [*c]const u8, __result_buf: [*c]struct_rpcent, __buffer: [*c]u8, __buflen: usize, __result: [*c][*c]struct_rpcent) c_int;
pub extern fn getrpcbynumber_r(__number: c_int, __result_buf: [*c]struct_rpcent, __buffer: [*c]u8, __buflen: usize, __result: [*c][*c]struct_rpcent) c_int;
pub extern fn getrpcent_r(__result_buf: [*c]struct_rpcent, __buffer: [*c]u8, __buflen: usize, __result: [*c][*c]struct_rpcent) c_int;
pub const struct_netent = extern struct {
    n_name: [*c]u8 = @import("std").mem.zeroes([*c]u8),
    n_aliases: [*c][*c]u8 = @import("std").mem.zeroes([*c][*c]u8),
    n_addrtype: c_int = @import("std").mem.zeroes(c_int),
    n_net: u32 = @import("std").mem.zeroes(u32),
};
pub extern fn __h_errno_location() [*c]c_int;
pub extern fn herror(__str: [*c]const u8) void;
pub extern fn hstrerror(__err_num: c_int) [*c]const u8;
pub const struct_hostent = extern struct {
    h_name: [*c]u8 = @import("std").mem.zeroes([*c]u8),
    h_aliases: [*c][*c]u8 = @import("std").mem.zeroes([*c][*c]u8),
    h_addrtype: c_int = @import("std").mem.zeroes(c_int),
    h_length: c_int = @import("std").mem.zeroes(c_int),
    h_addr_list: [*c][*c]u8 = @import("std").mem.zeroes([*c][*c]u8),
};
pub extern fn sethostent(__stay_open: c_int) void;
pub extern fn endhostent() void;
pub extern fn gethostent() [*c]struct_hostent;
pub extern fn gethostbyaddr(__addr: ?*const anyopaque, __len: __socklen_t, __type: c_int) [*c]struct_hostent;
pub extern fn gethostbyname(__name: [*c]const u8) [*c]struct_hostent;
pub extern fn gethostbyname2(__name: [*c]const u8, __af: c_int) [*c]struct_hostent;
pub extern fn gethostent_r(noalias __result_buf: [*c]struct_hostent, noalias __buf: [*c]u8, __buflen: usize, noalias __result: [*c][*c]struct_hostent, noalias __h_errnop: [*c]c_int) c_int;
pub extern fn gethostbyaddr_r(noalias __addr: ?*const anyopaque, __len: __socklen_t, __type: c_int, noalias __result_buf: [*c]struct_hostent, noalias __buf: [*c]u8, __buflen: usize, noalias __result: [*c][*c]struct_hostent, noalias __h_errnop: [*c]c_int) c_int;
pub extern fn gethostbyname_r(noalias __name: [*c]const u8, noalias __result_buf: [*c]struct_hostent, noalias __buf: [*c]u8, __buflen: usize, noalias __result: [*c][*c]struct_hostent, noalias __h_errnop: [*c]c_int) c_int;
pub extern fn gethostbyname2_r(noalias __name: [*c]const u8, __af: c_int, noalias __result_buf: [*c]struct_hostent, noalias __buf: [*c]u8, __buflen: usize, noalias __result: [*c][*c]struct_hostent, noalias __h_errnop: [*c]c_int) c_int;
pub extern fn setnetent(__stay_open: c_int) void;
pub extern fn endnetent() void;
pub extern fn getnetent() [*c]struct_netent;
pub extern fn getnetbyaddr(__net: u32, __type: c_int) [*c]struct_netent;
pub extern fn getnetbyname(__name: [*c]const u8) [*c]struct_netent;
pub extern fn getnetent_r(noalias __result_buf: [*c]struct_netent, noalias __buf: [*c]u8, __buflen: usize, noalias __result: [*c][*c]struct_netent, noalias __h_errnop: [*c]c_int) c_int;
pub extern fn getnetbyaddr_r(__net: u32, __type: c_int, noalias __result_buf: [*c]struct_netent, noalias __buf: [*c]u8, __buflen: usize, noalias __result: [*c][*c]struct_netent, noalias __h_errnop: [*c]c_int) c_int;
pub extern fn getnetbyname_r(noalias __name: [*c]const u8, noalias __result_buf: [*c]struct_netent, noalias __buf: [*c]u8, __buflen: usize, noalias __result: [*c][*c]struct_netent, noalias __h_errnop: [*c]c_int) c_int;
pub const struct_servent = extern struct {
    s_name: [*c]u8 = @import("std").mem.zeroes([*c]u8),
    s_aliases: [*c][*c]u8 = @import("std").mem.zeroes([*c][*c]u8),
    s_port: c_int = @import("std").mem.zeroes(c_int),
    s_proto: [*c]u8 = @import("std").mem.zeroes([*c]u8),
};
pub extern fn setservent(__stay_open: c_int) void;
pub extern fn endservent() void;
pub extern fn getservent() [*c]struct_servent;
pub extern fn getservbyname(__name: [*c]const u8, __proto: [*c]const u8) [*c]struct_servent;
pub extern fn getservbyport(__port: c_int, __proto: [*c]const u8) [*c]struct_servent;
pub extern fn getservent_r(noalias __result_buf: [*c]struct_servent, noalias __buf: [*c]u8, __buflen: usize, noalias __result: [*c][*c]struct_servent) c_int;
pub extern fn getservbyname_r(noalias __name: [*c]const u8, noalias __proto: [*c]const u8, noalias __result_buf: [*c]struct_servent, noalias __buf: [*c]u8, __buflen: usize, noalias __result: [*c][*c]struct_servent) c_int;
pub extern fn getservbyport_r(__port: c_int, noalias __proto: [*c]const u8, noalias __result_buf: [*c]struct_servent, noalias __buf: [*c]u8, __buflen: usize, noalias __result: [*c][*c]struct_servent) c_int;
pub const struct_protoent = extern struct {
    p_name: [*c]u8 = @import("std").mem.zeroes([*c]u8),
    p_aliases: [*c][*c]u8 = @import("std").mem.zeroes([*c][*c]u8),
    p_proto: c_int = @import("std").mem.zeroes(c_int),
};
pub extern fn setprotoent(__stay_open: c_int) void;
pub extern fn endprotoent() void;
pub extern fn getprotoent() [*c]struct_protoent;
pub extern fn getprotobyname(__name: [*c]const u8) [*c]struct_protoent;
pub extern fn getprotobynumber(__proto: c_int) [*c]struct_protoent;
pub extern fn getprotoent_r(noalias __result_buf: [*c]struct_protoent, noalias __buf: [*c]u8, __buflen: usize, noalias __result: [*c][*c]struct_protoent) c_int;
pub extern fn getprotobyname_r(noalias __name: [*c]const u8, noalias __result_buf: [*c]struct_protoent, noalias __buf: [*c]u8, __buflen: usize, noalias __result: [*c][*c]struct_protoent) c_int;
pub extern fn getprotobynumber_r(__proto: c_int, noalias __result_buf: [*c]struct_protoent, noalias __buf: [*c]u8, __buflen: usize, noalias __result: [*c][*c]struct_protoent) c_int;
pub extern fn setnetgrent(__netgroup: [*c]const u8) c_int;
pub extern fn endnetgrent() void;
pub extern fn getnetgrent(noalias __hostp: [*c][*c]u8, noalias __userp: [*c][*c]u8, noalias __domainp: [*c][*c]u8) c_int;
pub extern fn innetgr(__netgroup: [*c]const u8, __host: [*c]const u8, __user: [*c]const u8, __domain: [*c]const u8) c_int;
pub extern fn getnetgrent_r(noalias __hostp: [*c][*c]u8, noalias __userp: [*c][*c]u8, noalias __domainp: [*c][*c]u8, noalias __buffer: [*c]u8, __buflen: usize) c_int;
pub extern fn rcmd(noalias __ahost: [*c][*c]u8, __rport: c_ushort, noalias __locuser: [*c]const u8, noalias __remuser: [*c]const u8, noalias __cmd: [*c]const u8, noalias __fd2p: [*c]c_int) c_int;
pub extern fn rcmd_af(noalias __ahost: [*c][*c]u8, __rport: c_ushort, noalias __locuser: [*c]const u8, noalias __remuser: [*c]const u8, noalias __cmd: [*c]const u8, noalias __fd2p: [*c]c_int, __af: sa_family_t) c_int;
pub extern fn rexec(noalias __ahost: [*c][*c]u8, __rport: c_int, noalias __name: [*c]const u8, noalias __pass: [*c]const u8, noalias __cmd: [*c]const u8, noalias __fd2p: [*c]c_int) c_int;
pub extern fn rexec_af(noalias __ahost: [*c][*c]u8, __rport: c_int, noalias __name: [*c]const u8, noalias __pass: [*c]const u8, noalias __cmd: [*c]const u8, noalias __fd2p: [*c]c_int, __af: sa_family_t) c_int;
pub extern fn ruserok(__rhost: [*c]const u8, __suser: c_int, __remuser: [*c]const u8, __locuser: [*c]const u8) c_int;
pub extern fn ruserok_af(__rhost: [*c]const u8, __suser: c_int, __remuser: [*c]const u8, __locuser: [*c]const u8, __af: sa_family_t) c_int;
pub extern fn iruserok(__raddr: u32, __suser: c_int, __remuser: [*c]const u8, __locuser: [*c]const u8) c_int;
pub extern fn iruserok_af(__raddr: ?*const anyopaque, __suser: c_int, __remuser: [*c]const u8, __locuser: [*c]const u8, __af: sa_family_t) c_int;
pub extern fn rresvport(__alport: [*c]c_int) c_int;
pub extern fn rresvport_af(__alport: [*c]c_int, __af: sa_family_t) c_int;
pub const struct_addrinfo = extern struct {
    ai_flags: c_int = @import("std").mem.zeroes(c_int),
    ai_family: c_int = @import("std").mem.zeroes(c_int),
    ai_socktype: c_int = @import("std").mem.zeroes(c_int),
    ai_protocol: c_int = @import("std").mem.zeroes(c_int),
    ai_addrlen: socklen_t = @import("std").mem.zeroes(socklen_t),
    ai_addr: [*c]struct_sockaddr = @import("std").mem.zeroes([*c]struct_sockaddr),
    ai_canonname: [*c]u8 = @import("std").mem.zeroes([*c]u8),
    ai_next: [*c]struct_addrinfo = @import("std").mem.zeroes([*c]struct_addrinfo),
};
pub extern fn getaddrinfo(noalias __name: [*c]const u8, noalias __service: [*c]const u8, noalias __req: [*c]const struct_addrinfo, noalias __pai: [*c][*c]struct_addrinfo) c_int;
pub extern fn freeaddrinfo(__ai: [*c]struct_addrinfo) void;
pub extern fn gai_strerror(__ecode: c_int) [*c]const u8;
pub extern fn getnameinfo(noalias __sa: [*c]const struct_sockaddr, __salen: socklen_t, noalias __host: [*c]u8, __hostlen: socklen_t, noalias __serv: [*c]u8, __servlen: socklen_t, __flags: c_int) c_int;
pub const useconds_t = __useconds_t;
pub extern fn access(__name: [*c]const u8, __type: c_int) c_int;
pub extern fn faccessat(__fd: c_int, __file: [*c]const u8, __type: c_int, __flag: c_int) c_int;
pub extern fn lseek(__fd: c_int, __offset: __off_t, __whence: c_int) __off_t;
pub extern fn close(__fd: c_int) c_int;
pub extern fn closefrom(__lowfd: c_int) void;
pub extern fn read(__fd: c_int, __buf: ?*anyopaque, __nbytes: usize) isize;
pub extern fn write(__fd: c_int, __buf: ?*const anyopaque, __n: usize) isize;
pub extern fn pread(__fd: c_int, __buf: ?*anyopaque, __nbytes: usize, __offset: __off_t) isize;
pub extern fn pwrite(__fd: c_int, __buf: ?*const anyopaque, __n: usize, __offset: __off_t) isize;
pub extern fn pipe(__pipedes: [*c]c_int) c_int;
pub extern fn alarm(__seconds: c_uint) c_uint;
pub extern fn sleep(__seconds: c_uint) c_uint;
pub extern fn ualarm(__value: __useconds_t, __interval: __useconds_t) __useconds_t;
pub extern fn usleep(__useconds: __useconds_t) c_int;
pub extern fn pause() c_int;
pub extern fn chown(__file: [*c]const u8, __owner: __uid_t, __group: __gid_t) c_int;
pub extern fn fchown(__fd: c_int, __owner: __uid_t, __group: __gid_t) c_int;
pub extern fn lchown(__file: [*c]const u8, __owner: __uid_t, __group: __gid_t) c_int;
pub extern fn fchownat(__fd: c_int, __file: [*c]const u8, __owner: __uid_t, __group: __gid_t, __flag: c_int) c_int;
pub extern fn chdir(__path: [*c]const u8) c_int;
pub extern fn fchdir(__fd: c_int) c_int;
pub extern fn getcwd(__buf: [*c]u8, __size: usize) [*c]u8;
pub extern fn getwd(__buf: [*c]u8) [*c]u8;
pub extern fn dup(__fd: c_int) c_int;
pub extern fn dup2(__fd: c_int, __fd2: c_int) c_int;
pub extern var __environ: [*c][*c]u8;
pub extern fn execve(__path: [*c]const u8, __argv: [*c]const [*c]u8, __envp: [*c]const [*c]u8) c_int;
pub extern fn fexecve(__fd: c_int, __argv: [*c]const [*c]u8, __envp: [*c]const [*c]u8) c_int;
pub extern fn execv(__path: [*c]const u8, __argv: [*c]const [*c]u8) c_int;
pub extern fn execle(__path: [*c]const u8, __arg: [*c]const u8, ...) c_int;
pub extern fn execl(__path: [*c]const u8, __arg: [*c]const u8, ...) c_int;
pub extern fn execvp(__file: [*c]const u8, __argv: [*c]const [*c]u8) c_int;
pub extern fn execlp(__file: [*c]const u8, __arg: [*c]const u8, ...) c_int;
pub extern fn nice(__inc: c_int) c_int;
pub extern fn _exit(__status: c_int) noreturn;
pub const _PC_LINK_MAX: c_int = 0;
pub const _PC_MAX_CANON: c_int = 1;
pub const _PC_MAX_INPUT: c_int = 2;
pub const _PC_NAME_MAX: c_int = 3;
pub const _PC_PATH_MAX: c_int = 4;
pub const _PC_PIPE_BUF: c_int = 5;
pub const _PC_CHOWN_RESTRICTED: c_int = 6;
pub const _PC_NO_TRUNC: c_int = 7;
pub const _PC_VDISABLE: c_int = 8;
pub const _PC_SYNC_IO: c_int = 9;
pub const _PC_ASYNC_IO: c_int = 10;
pub const _PC_PRIO_IO: c_int = 11;
pub const _PC_SOCK_MAXBUF: c_int = 12;
pub const _PC_FILESIZEBITS: c_int = 13;
pub const _PC_REC_INCR_XFER_SIZE: c_int = 14;
pub const _PC_REC_MAX_XFER_SIZE: c_int = 15;
pub const _PC_REC_MIN_XFER_SIZE: c_int = 16;
pub const _PC_REC_XFER_ALIGN: c_int = 17;
pub const _PC_ALLOC_SIZE_MIN: c_int = 18;
pub const _PC_SYMLINK_MAX: c_int = 19;
pub const _PC_2_SYMLINKS: c_int = 20;
const enum_unnamed_21 = c_uint;
pub const _SC_ARG_MAX: c_int = 0;
pub const _SC_CHILD_MAX: c_int = 1;
pub const _SC_CLK_TCK: c_int = 2;
pub const _SC_NGROUPS_MAX: c_int = 3;
pub const _SC_OPEN_MAX: c_int = 4;
pub const _SC_STREAM_MAX: c_int = 5;
pub const _SC_TZNAME_MAX: c_int = 6;
pub const _SC_JOB_CONTROL: c_int = 7;
pub const _SC_SAVED_IDS: c_int = 8;
pub const _SC_REALTIME_SIGNALS: c_int = 9;
pub const _SC_PRIORITY_SCHEDULING: c_int = 10;
pub const _SC_TIMERS: c_int = 11;
pub const _SC_ASYNCHRONOUS_IO: c_int = 12;
pub const _SC_PRIORITIZED_IO: c_int = 13;
pub const _SC_SYNCHRONIZED_IO: c_int = 14;
pub const _SC_FSYNC: c_int = 15;
pub const _SC_MAPPED_FILES: c_int = 16;
pub const _SC_MEMLOCK: c_int = 17;
pub const _SC_MEMLOCK_RANGE: c_int = 18;
pub const _SC_MEMORY_PROTECTION: c_int = 19;
pub const _SC_MESSAGE_PASSING: c_int = 20;
pub const _SC_SEMAPHORES: c_int = 21;
pub const _SC_SHARED_MEMORY_OBJECTS: c_int = 22;
pub const _SC_AIO_LISTIO_MAX: c_int = 23;
pub const _SC_AIO_MAX: c_int = 24;
pub const _SC_AIO_PRIO_DELTA_MAX: c_int = 25;
pub const _SC_DELAYTIMER_MAX: c_int = 26;
pub const _SC_MQ_OPEN_MAX: c_int = 27;
pub const _SC_MQ_PRIO_MAX: c_int = 28;
pub const _SC_VERSION: c_int = 29;
pub const _SC_PAGESIZE: c_int = 30;
pub const _SC_RTSIG_MAX: c_int = 31;
pub const _SC_SEM_NSEMS_MAX: c_int = 32;
pub const _SC_SEM_VALUE_MAX: c_int = 33;
pub const _SC_SIGQUEUE_MAX: c_int = 34;
pub const _SC_TIMER_MAX: c_int = 35;
pub const _SC_BC_BASE_MAX: c_int = 36;
pub const _SC_BC_DIM_MAX: c_int = 37;
pub const _SC_BC_SCALE_MAX: c_int = 38;
pub const _SC_BC_STRING_MAX: c_int = 39;
pub const _SC_COLL_WEIGHTS_MAX: c_int = 40;
pub const _SC_EQUIV_CLASS_MAX: c_int = 41;
pub const _SC_EXPR_NEST_MAX: c_int = 42;
pub const _SC_LINE_MAX: c_int = 43;
pub const _SC_RE_DUP_MAX: c_int = 44;
pub const _SC_CHARCLASS_NAME_MAX: c_int = 45;
pub const _SC_2_VERSION: c_int = 46;
pub const _SC_2_C_BIND: c_int = 47;
pub const _SC_2_C_DEV: c_int = 48;
pub const _SC_2_FORT_DEV: c_int = 49;
pub const _SC_2_FORT_RUN: c_int = 50;
pub const _SC_2_SW_DEV: c_int = 51;
pub const _SC_2_LOCALEDEF: c_int = 52;
pub const _SC_PII: c_int = 53;
pub const _SC_PII_XTI: c_int = 54;
pub const _SC_PII_SOCKET: c_int = 55;
pub const _SC_PII_INTERNET: c_int = 56;
pub const _SC_PII_OSI: c_int = 57;
pub const _SC_POLL: c_int = 58;
pub const _SC_SELECT: c_int = 59;
pub const _SC_UIO_MAXIOV: c_int = 60;
pub const _SC_IOV_MAX: c_int = 60;
pub const _SC_PII_INTERNET_STREAM: c_int = 61;
pub const _SC_PII_INTERNET_DGRAM: c_int = 62;
pub const _SC_PII_OSI_COTS: c_int = 63;
pub const _SC_PII_OSI_CLTS: c_int = 64;
pub const _SC_PII_OSI_M: c_int = 65;
pub const _SC_T_IOV_MAX: c_int = 66;
pub const _SC_THREADS: c_int = 67;
pub const _SC_THREAD_SAFE_FUNCTIONS: c_int = 68;
pub const _SC_GETGR_R_SIZE_MAX: c_int = 69;
pub const _SC_GETPW_R_SIZE_MAX: c_int = 70;
pub const _SC_LOGIN_NAME_MAX: c_int = 71;
pub const _SC_TTY_NAME_MAX: c_int = 72;
pub const _SC_THREAD_DESTRUCTOR_ITERATIONS: c_int = 73;
pub const _SC_THREAD_KEYS_MAX: c_int = 74;
pub const _SC_THREAD_STACK_MIN: c_int = 75;
pub const _SC_THREAD_THREADS_MAX: c_int = 76;
pub const _SC_THREAD_ATTR_STACKADDR: c_int = 77;
pub const _SC_THREAD_ATTR_STACKSIZE: c_int = 78;
pub const _SC_THREAD_PRIORITY_SCHEDULING: c_int = 79;
pub const _SC_THREAD_PRIO_INHERIT: c_int = 80;
pub const _SC_THREAD_PRIO_PROTECT: c_int = 81;
pub const _SC_THREAD_PROCESS_SHARED: c_int = 82;
pub const _SC_NPROCESSORS_CONF: c_int = 83;
pub const _SC_NPROCESSORS_ONLN: c_int = 84;
pub const _SC_PHYS_PAGES: c_int = 85;
pub const _SC_AVPHYS_PAGES: c_int = 86;
pub const _SC_ATEXIT_MAX: c_int = 87;
pub const _SC_PASS_MAX: c_int = 88;
pub const _SC_XOPEN_VERSION: c_int = 89;
pub const _SC_XOPEN_XCU_VERSION: c_int = 90;
pub const _SC_XOPEN_UNIX: c_int = 91;
pub const _SC_XOPEN_CRYPT: c_int = 92;
pub const _SC_XOPEN_ENH_I18N: c_int = 93;
pub const _SC_XOPEN_SHM: c_int = 94;
pub const _SC_2_CHAR_TERM: c_int = 95;
pub const _SC_2_C_VERSION: c_int = 96;
pub const _SC_2_UPE: c_int = 97;
pub const _SC_XOPEN_XPG2: c_int = 98;
pub const _SC_XOPEN_XPG3: c_int = 99;
pub const _SC_XOPEN_XPG4: c_int = 100;
pub const _SC_CHAR_BIT: c_int = 101;
pub const _SC_CHAR_MAX: c_int = 102;
pub const _SC_CHAR_MIN: c_int = 103;
pub const _SC_INT_MAX: c_int = 104;
pub const _SC_INT_MIN: c_int = 105;
pub const _SC_LONG_BIT: c_int = 106;
pub const _SC_WORD_BIT: c_int = 107;
pub const _SC_MB_LEN_MAX: c_int = 108;
pub const _SC_NZERO: c_int = 109;
pub const _SC_SSIZE_MAX: c_int = 110;
pub const _SC_SCHAR_MAX: c_int = 111;
pub const _SC_SCHAR_MIN: c_int = 112;
pub const _SC_SHRT_MAX: c_int = 113;
pub const _SC_SHRT_MIN: c_int = 114;
pub const _SC_UCHAR_MAX: c_int = 115;
pub const _SC_UINT_MAX: c_int = 116;
pub const _SC_ULONG_MAX: c_int = 117;
pub const _SC_USHRT_MAX: c_int = 118;
pub const _SC_NL_ARGMAX: c_int = 119;
pub const _SC_NL_LANGMAX: c_int = 120;
pub const _SC_NL_MSGMAX: c_int = 121;
pub const _SC_NL_NMAX: c_int = 122;
pub const _SC_NL_SETMAX: c_int = 123;
pub const _SC_NL_TEXTMAX: c_int = 124;
pub const _SC_XBS5_ILP32_OFF32: c_int = 125;
pub const _SC_XBS5_ILP32_OFFBIG: c_int = 126;
pub const _SC_XBS5_LP64_OFF64: c_int = 127;
pub const _SC_XBS5_LPBIG_OFFBIG: c_int = 128;
pub const _SC_XOPEN_LEGACY: c_int = 129;
pub const _SC_XOPEN_REALTIME: c_int = 130;
pub const _SC_XOPEN_REALTIME_THREADS: c_int = 131;
pub const _SC_ADVISORY_INFO: c_int = 132;
pub const _SC_BARRIERS: c_int = 133;
pub const _SC_BASE: c_int = 134;
pub const _SC_C_LANG_SUPPORT: c_int = 135;
pub const _SC_C_LANG_SUPPORT_R: c_int = 136;
pub const _SC_CLOCK_SELECTION: c_int = 137;
pub const _SC_CPUTIME: c_int = 138;
pub const _SC_THREAD_CPUTIME: c_int = 139;
pub const _SC_DEVICE_IO: c_int = 140;
pub const _SC_DEVICE_SPECIFIC: c_int = 141;
pub const _SC_DEVICE_SPECIFIC_R: c_int = 142;
pub const _SC_FD_MGMT: c_int = 143;
pub const _SC_FIFO: c_int = 144;
pub const _SC_PIPE: c_int = 145;
pub const _SC_FILE_ATTRIBUTES: c_int = 146;
pub const _SC_FILE_LOCKING: c_int = 147;
pub const _SC_FILE_SYSTEM: c_int = 148;
pub const _SC_MONOTONIC_CLOCK: c_int = 149;
pub const _SC_MULTI_PROCESS: c_int = 150;
pub const _SC_SINGLE_PROCESS: c_int = 151;
pub const _SC_NETWORKING: c_int = 152;
pub const _SC_READER_WRITER_LOCKS: c_int = 153;
pub const _SC_SPIN_LOCKS: c_int = 154;
pub const _SC_REGEXP: c_int = 155;
pub const _SC_REGEX_VERSION: c_int = 156;
pub const _SC_SHELL: c_int = 157;
pub const _SC_SIGNALS: c_int = 158;
pub const _SC_SPAWN: c_int = 159;
pub const _SC_SPORADIC_SERVER: c_int = 160;
pub const _SC_THREAD_SPORADIC_SERVER: c_int = 161;
pub const _SC_SYSTEM_DATABASE: c_int = 162;
pub const _SC_SYSTEM_DATABASE_R: c_int = 163;
pub const _SC_TIMEOUTS: c_int = 164;
pub const _SC_TYPED_MEMORY_OBJECTS: c_int = 165;
pub const _SC_USER_GROUPS: c_int = 166;
pub const _SC_USER_GROUPS_R: c_int = 167;
pub const _SC_2_PBS: c_int = 168;
pub const _SC_2_PBS_ACCOUNTING: c_int = 169;
pub const _SC_2_PBS_LOCATE: c_int = 170;
pub const _SC_2_PBS_MESSAGE: c_int = 171;
pub const _SC_2_PBS_TRACK: c_int = 172;
pub const _SC_SYMLOOP_MAX: c_int = 173;
pub const _SC_STREAMS: c_int = 174;
pub const _SC_2_PBS_CHECKPOINT: c_int = 175;
pub const _SC_V6_ILP32_OFF32: c_int = 176;
pub const _SC_V6_ILP32_OFFBIG: c_int = 177;
pub const _SC_V6_LP64_OFF64: c_int = 178;
pub const _SC_V6_LPBIG_OFFBIG: c_int = 179;
pub const _SC_HOST_NAME_MAX: c_int = 180;
pub const _SC_TRACE: c_int = 181;
pub const _SC_TRACE_EVENT_FILTER: c_int = 182;
pub const _SC_TRACE_INHERIT: c_int = 183;
pub const _SC_TRACE_LOG: c_int = 184;
pub const _SC_LEVEL1_ICACHE_SIZE: c_int = 185;
pub const _SC_LEVEL1_ICACHE_ASSOC: c_int = 186;
pub const _SC_LEVEL1_ICACHE_LINESIZE: c_int = 187;
pub const _SC_LEVEL1_DCACHE_SIZE: c_int = 188;
pub const _SC_LEVEL1_DCACHE_ASSOC: c_int = 189;
pub const _SC_LEVEL1_DCACHE_LINESIZE: c_int = 190;
pub const _SC_LEVEL2_CACHE_SIZE: c_int = 191;
pub const _SC_LEVEL2_CACHE_ASSOC: c_int = 192;
pub const _SC_LEVEL2_CACHE_LINESIZE: c_int = 193;
pub const _SC_LEVEL3_CACHE_SIZE: c_int = 194;
pub const _SC_LEVEL3_CACHE_ASSOC: c_int = 195;
pub const _SC_LEVEL3_CACHE_LINESIZE: c_int = 196;
pub const _SC_LEVEL4_CACHE_SIZE: c_int = 197;
pub const _SC_LEVEL4_CACHE_ASSOC: c_int = 198;
pub const _SC_LEVEL4_CACHE_LINESIZE: c_int = 199;
pub const _SC_IPV6: c_int = 235;
pub const _SC_RAW_SOCKETS: c_int = 236;
pub const _SC_V7_ILP32_OFF32: c_int = 237;
pub const _SC_V7_ILP32_OFFBIG: c_int = 238;
pub const _SC_V7_LP64_OFF64: c_int = 239;
pub const _SC_V7_LPBIG_OFFBIG: c_int = 240;
pub const _SC_SS_REPL_MAX: c_int = 241;
pub const _SC_TRACE_EVENT_NAME_MAX: c_int = 242;
pub const _SC_TRACE_NAME_MAX: c_int = 243;
pub const _SC_TRACE_SYS_MAX: c_int = 244;
pub const _SC_TRACE_USER_EVENT_MAX: c_int = 245;
pub const _SC_XOPEN_STREAMS: c_int = 246;
pub const _SC_THREAD_ROBUST_PRIO_INHERIT: c_int = 247;
pub const _SC_THREAD_ROBUST_PRIO_PROTECT: c_int = 248;
pub const _SC_MINSIGSTKSZ: c_int = 249;
pub const _SC_SIGSTKSZ: c_int = 250;
const enum_unnamed_22 = c_uint;
pub const _CS_PATH: c_int = 0;
pub const _CS_V6_WIDTH_RESTRICTED_ENVS: c_int = 1;
pub const _CS_GNU_LIBC_VERSION: c_int = 2;
pub const _CS_GNU_LIBPTHREAD_VERSION: c_int = 3;
pub const _CS_V5_WIDTH_RESTRICTED_ENVS: c_int = 4;
pub const _CS_V7_WIDTH_RESTRICTED_ENVS: c_int = 5;
pub const _CS_LFS_CFLAGS: c_int = 1000;
pub const _CS_LFS_LDFLAGS: c_int = 1001;
pub const _CS_LFS_LIBS: c_int = 1002;
pub const _CS_LFS_LINTFLAGS: c_int = 1003;
pub const _CS_LFS64_CFLAGS: c_int = 1004;
pub const _CS_LFS64_LDFLAGS: c_int = 1005;
pub const _CS_LFS64_LIBS: c_int = 1006;
pub const _CS_LFS64_LINTFLAGS: c_int = 1007;
pub const _CS_XBS5_ILP32_OFF32_CFLAGS: c_int = 1100;
pub const _CS_XBS5_ILP32_OFF32_LDFLAGS: c_int = 1101;
pub const _CS_XBS5_ILP32_OFF32_LIBS: c_int = 1102;
pub const _CS_XBS5_ILP32_OFF32_LINTFLAGS: c_int = 1103;
pub const _CS_XBS5_ILP32_OFFBIG_CFLAGS: c_int = 1104;
pub const _CS_XBS5_ILP32_OFFBIG_LDFLAGS: c_int = 1105;
pub const _CS_XBS5_ILP32_OFFBIG_LIBS: c_int = 1106;
pub const _CS_XBS5_ILP32_OFFBIG_LINTFLAGS: c_int = 1107;
pub const _CS_XBS5_LP64_OFF64_CFLAGS: c_int = 1108;
pub const _CS_XBS5_LP64_OFF64_LDFLAGS: c_int = 1109;
pub const _CS_XBS5_LP64_OFF64_LIBS: c_int = 1110;
pub const _CS_XBS5_LP64_OFF64_LINTFLAGS: c_int = 1111;
pub const _CS_XBS5_LPBIG_OFFBIG_CFLAGS: c_int = 1112;
pub const _CS_XBS5_LPBIG_OFFBIG_LDFLAGS: c_int = 1113;
pub const _CS_XBS5_LPBIG_OFFBIG_LIBS: c_int = 1114;
pub const _CS_XBS5_LPBIG_OFFBIG_LINTFLAGS: c_int = 1115;
pub const _CS_POSIX_V6_ILP32_OFF32_CFLAGS: c_int = 1116;
pub const _CS_POSIX_V6_ILP32_OFF32_LDFLAGS: c_int = 1117;
pub const _CS_POSIX_V6_ILP32_OFF32_LIBS: c_int = 1118;
pub const _CS_POSIX_V6_ILP32_OFF32_LINTFLAGS: c_int = 1119;
pub const _CS_POSIX_V6_ILP32_OFFBIG_CFLAGS: c_int = 1120;
pub const _CS_POSIX_V6_ILP32_OFFBIG_LDFLAGS: c_int = 1121;
pub const _CS_POSIX_V6_ILP32_OFFBIG_LIBS: c_int = 1122;
pub const _CS_POSIX_V6_ILP32_OFFBIG_LINTFLAGS: c_int = 1123;
pub const _CS_POSIX_V6_LP64_OFF64_CFLAGS: c_int = 1124;
pub const _CS_POSIX_V6_LP64_OFF64_LDFLAGS: c_int = 1125;
pub const _CS_POSIX_V6_LP64_OFF64_LIBS: c_int = 1126;
pub const _CS_POSIX_V6_LP64_OFF64_LINTFLAGS: c_int = 1127;
pub const _CS_POSIX_V6_LPBIG_OFFBIG_CFLAGS: c_int = 1128;
pub const _CS_POSIX_V6_LPBIG_OFFBIG_LDFLAGS: c_int = 1129;
pub const _CS_POSIX_V6_LPBIG_OFFBIG_LIBS: c_int = 1130;
pub const _CS_POSIX_V6_LPBIG_OFFBIG_LINTFLAGS: c_int = 1131;
pub const _CS_POSIX_V7_ILP32_OFF32_CFLAGS: c_int = 1132;
pub const _CS_POSIX_V7_ILP32_OFF32_LDFLAGS: c_int = 1133;
pub const _CS_POSIX_V7_ILP32_OFF32_LIBS: c_int = 1134;
pub const _CS_POSIX_V7_ILP32_OFF32_LINTFLAGS: c_int = 1135;
pub const _CS_POSIX_V7_ILP32_OFFBIG_CFLAGS: c_int = 1136;
pub const _CS_POSIX_V7_ILP32_OFFBIG_LDFLAGS: c_int = 1137;
pub const _CS_POSIX_V7_ILP32_OFFBIG_LIBS: c_int = 1138;
pub const _CS_POSIX_V7_ILP32_OFFBIG_LINTFLAGS: c_int = 1139;
pub const _CS_POSIX_V7_LP64_OFF64_CFLAGS: c_int = 1140;
pub const _CS_POSIX_V7_LP64_OFF64_LDFLAGS: c_int = 1141;
pub const _CS_POSIX_V7_LP64_OFF64_LIBS: c_int = 1142;
pub const _CS_POSIX_V7_LP64_OFF64_LINTFLAGS: c_int = 1143;
pub const _CS_POSIX_V7_LPBIG_OFFBIG_CFLAGS: c_int = 1144;
pub const _CS_POSIX_V7_LPBIG_OFFBIG_LDFLAGS: c_int = 1145;
pub const _CS_POSIX_V7_LPBIG_OFFBIG_LIBS: c_int = 1146;
pub const _CS_POSIX_V7_LPBIG_OFFBIG_LINTFLAGS: c_int = 1147;
pub const _CS_V6_ENV: c_int = 1148;
pub const _CS_V7_ENV: c_int = 1149;
const enum_unnamed_23 = c_uint;
pub extern fn pathconf(__path: [*c]const u8, __name: c_int) c_long;
pub extern fn fpathconf(__fd: c_int, __name: c_int) c_long;
pub extern fn sysconf(__name: c_int) c_long;
pub extern fn confstr(__name: c_int, __buf: [*c]u8, __len: usize) usize;
pub extern fn getpid() __pid_t;
pub extern fn getppid() __pid_t;
pub extern fn getpgrp() __pid_t;
pub extern fn __getpgid(__pid: __pid_t) __pid_t;
pub extern fn getpgid(__pid: __pid_t) __pid_t;
pub extern fn setpgid(__pid: __pid_t, __pgid: __pid_t) c_int;
pub extern fn setpgrp() c_int;
pub extern fn setsid() __pid_t;
pub extern fn getsid(__pid: __pid_t) __pid_t;
pub extern fn getuid() __uid_t;
pub extern fn geteuid() __uid_t;
pub extern fn getgid() __gid_t;
pub extern fn getegid() __gid_t;
pub extern fn getgroups(__size: c_int, __list: [*c]__gid_t) c_int;
pub extern fn setuid(__uid: __uid_t) c_int;
pub extern fn setreuid(__ruid: __uid_t, __euid: __uid_t) c_int;
pub extern fn seteuid(__uid: __uid_t) c_int;
pub extern fn setgid(__gid: __gid_t) c_int;
pub extern fn setregid(__rgid: __gid_t, __egid: __gid_t) c_int;
pub extern fn setegid(__gid: __gid_t) c_int;
pub extern fn fork() __pid_t;
pub extern fn vfork() c_int;
pub extern fn ttyname(__fd: c_int) [*c]u8;
pub extern fn ttyname_r(__fd: c_int, __buf: [*c]u8, __buflen: usize) c_int;
pub extern fn isatty(__fd: c_int) c_int;
pub extern fn ttyslot() c_int;
pub extern fn link(__from: [*c]const u8, __to: [*c]const u8) c_int;
pub extern fn linkat(__fromfd: c_int, __from: [*c]const u8, __tofd: c_int, __to: [*c]const u8, __flags: c_int) c_int;
pub extern fn symlink(__from: [*c]const u8, __to: [*c]const u8) c_int;
pub extern fn readlink(noalias __path: [*c]const u8, noalias __buf: [*c]u8, __len: usize) isize;
pub extern fn symlinkat(__from: [*c]const u8, __tofd: c_int, __to: [*c]const u8) c_int;
pub extern fn readlinkat(__fd: c_int, noalias __path: [*c]const u8, noalias __buf: [*c]u8, __len: usize) isize;
pub extern fn unlink(__name: [*c]const u8) c_int;
pub extern fn unlinkat(__fd: c_int, __name: [*c]const u8, __flag: c_int) c_int;
pub extern fn rmdir(__path: [*c]const u8) c_int;
pub extern fn tcgetpgrp(__fd: c_int) __pid_t;
pub extern fn tcsetpgrp(__fd: c_int, __pgrp_id: __pid_t) c_int;
pub extern fn getlogin() [*c]u8;
pub extern fn getlogin_r(__name: [*c]u8, __name_len: usize) c_int;
pub extern fn setlogin(__name: [*c]const u8) c_int;
pub extern var optarg: [*c]u8;
pub extern var optind: c_int;
pub extern var opterr: c_int;
pub extern var optopt: c_int;
pub extern fn getopt(___argc: c_int, ___argv: [*c]const [*c]u8, __shortopts: [*c]const u8) c_int;
pub extern fn gethostname(__name: [*c]u8, __len: usize) c_int;
pub extern fn sethostname(__name: [*c]const u8, __len: usize) c_int;
pub extern fn sethostid(__id: c_long) c_int;
pub extern fn getdomainname(__name: [*c]u8, __len: usize) c_int;
pub extern fn setdomainname(__name: [*c]const u8, __len: usize) c_int;
pub extern fn vhangup() c_int;
pub extern fn revoke(__file: [*c]const u8) c_int;
pub extern fn profil(__sample_buffer: [*c]c_ushort, __size: usize, __offset: usize, __scale: c_uint) c_int;
pub extern fn acct(__name: [*c]const u8) c_int;
pub extern fn getusershell() [*c]u8;
pub extern fn endusershell() void;
pub extern fn setusershell() void;
pub extern fn daemon(__nochdir: c_int, __noclose: c_int) c_int;
pub extern fn chroot(__path: [*c]const u8) c_int;
pub extern fn getpass(__prompt: [*c]const u8) [*c]u8;
pub extern fn fsync(__fd: c_int) c_int;
pub extern fn gethostid() c_long;
pub extern fn sync() void;
pub extern fn getpagesize() c_int;
pub extern fn getdtablesize() c_int;
pub extern fn truncate(__file: [*c]const u8, __length: __off_t) c_int;
pub extern fn ftruncate(__fd: c_int, __length: __off_t) c_int;
pub extern fn brk(__addr: ?*anyopaque) c_int;
pub extern fn sbrk(__delta: isize) ?*anyopaque;
pub extern fn syscall(__sysno: c_long, ...) c_long;
pub extern fn lockf(__fd: c_int, __cmd: c_int, __len: __off_t) c_int;
pub extern fn fdatasync(__fildes: c_int) c_int;
pub extern fn crypt(__key: [*c]const u8, __salt: [*c]const u8) [*c]u8;
pub extern fn getentropy(__buffer: ?*anyopaque, __length: usize) c_int;
pub const struct_flock = extern struct {
    l_type: c_short = @import("std").mem.zeroes(c_short),
    l_whence: c_short = @import("std").mem.zeroes(c_short),
    l_start: __off_t = @import("std").mem.zeroes(__off_t),
    l_len: __off_t = @import("std").mem.zeroes(__off_t),
    l_pid: __pid_t = @import("std").mem.zeroes(__pid_t),
};
pub const struct_stat = extern struct {
    st_dev: __dev_t = @import("std").mem.zeroes(__dev_t),
    st_ino: __ino_t = @import("std").mem.zeroes(__ino_t),
    st_mode: __mode_t = @import("std").mem.zeroes(__mode_t),
    st_nlink: __nlink_t = @import("std").mem.zeroes(__nlink_t),
    st_uid: __uid_t = @import("std").mem.zeroes(__uid_t),
    st_gid: __gid_t = @import("std").mem.zeroes(__gid_t),
    st_rdev: __dev_t = @import("std").mem.zeroes(__dev_t),
    __pad1: __dev_t = @import("std").mem.zeroes(__dev_t),
    st_size: __off_t = @import("std").mem.zeroes(__off_t),
    st_blksize: __blksize_t = @import("std").mem.zeroes(__blksize_t),
    __pad2: c_int = @import("std").mem.zeroes(c_int),
    st_blocks: __blkcnt_t = @import("std").mem.zeroes(__blkcnt_t),
    st_atim: struct_timespec = @import("std").mem.zeroes(struct_timespec),
    st_mtim: struct_timespec = @import("std").mem.zeroes(struct_timespec),
    st_ctim: struct_timespec = @import("std").mem.zeroes(struct_timespec),
    __glibc_reserved: [2]c_int = @import("std").mem.zeroes([2]c_int),
};
pub extern fn fcntl(__fd: c_int, __cmd: c_int, ...) c_int;
pub extern fn open(__file: [*c]const u8, __oflag: c_int, ...) c_int;
pub extern fn openat(__fd: c_int, __file: [*c]const u8, __oflag: c_int, ...) c_int;
pub extern fn creat(__file: [*c]const u8, __mode: mode_t) c_int;
pub extern fn posix_fadvise(__fd: c_int, __offset: off_t, __len: off_t, __advise: c_int) c_int;
pub extern fn posix_fallocate(__fd: c_int, __offset: off_t, __len: off_t) c_int;
pub extern fn __errno_location() [*c]c_int;
pub const sig_atomic_t = __sig_atomic_t;
const struct_unnamed_25 = extern struct {
    si_pid: __pid_t = @import("std").mem.zeroes(__pid_t),
    si_uid: __uid_t = @import("std").mem.zeroes(__uid_t),
};
const struct_unnamed_26 = extern struct {
    si_tid: c_int = @import("std").mem.zeroes(c_int),
    si_overrun: c_int = @import("std").mem.zeroes(c_int),
    si_sigval: __sigval_t = @import("std").mem.zeroes(__sigval_t),
};
const struct_unnamed_27 = extern struct {
    si_pid: __pid_t = @import("std").mem.zeroes(__pid_t),
    si_uid: __uid_t = @import("std").mem.zeroes(__uid_t),
    si_sigval: __sigval_t = @import("std").mem.zeroes(__sigval_t),
};
const struct_unnamed_28 = extern struct {
    si_pid: __pid_t = @import("std").mem.zeroes(__pid_t),
    si_uid: __uid_t = @import("std").mem.zeroes(__uid_t),
    si_status: c_int = @import("std").mem.zeroes(c_int),
    si_utime: __clock_t = @import("std").mem.zeroes(__clock_t),
    si_stime: __clock_t = @import("std").mem.zeroes(__clock_t),
};
const struct_unnamed_31 = extern struct {
    _lower: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    _upper: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
};
const union_unnamed_30 = extern union {
    _addr_bnd: struct_unnamed_31,
    _pkey: __uint32_t,
};
const struct_unnamed_29 = extern struct {
    si_addr: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    si_addr_lsb: c_short = @import("std").mem.zeroes(c_short),
    _bounds: union_unnamed_30 = @import("std").mem.zeroes(union_unnamed_30),
};
const struct_unnamed_32 = extern struct {
    si_band: c_long = @import("std").mem.zeroes(c_long),
    si_fd: c_int = @import("std").mem.zeroes(c_int),
};
const struct_unnamed_33 = extern struct {
    _call_addr: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    _syscall: c_int = @import("std").mem.zeroes(c_int),
    _arch: c_uint = @import("std").mem.zeroes(c_uint),
};
const union_unnamed_24 = extern union {
    _pad: [28]c_int,
    _kill: struct_unnamed_25,
    _timer: struct_unnamed_26,
    _rt: struct_unnamed_27,
    _sigchld: struct_unnamed_28,
    _sigfault: struct_unnamed_29,
    _sigpoll: struct_unnamed_32,
    _sigsys: struct_unnamed_33,
};
pub const siginfo_t = extern struct {
    si_signo: c_int = @import("std").mem.zeroes(c_int),
    si_errno: c_int = @import("std").mem.zeroes(c_int),
    si_code: c_int = @import("std").mem.zeroes(c_int),
    __pad0: c_int = @import("std").mem.zeroes(c_int),
    _sifields: union_unnamed_24 = @import("std").mem.zeroes(union_unnamed_24),
};
pub const SI_ASYNCNL: c_int = -60;
pub const SI_DETHREAD: c_int = -7;
pub const SI_TKILL: c_int = -6;
pub const SI_SIGIO: c_int = -5;
pub const SI_ASYNCIO: c_int = -4;
pub const SI_MESGQ: c_int = -3;
pub const SI_TIMER: c_int = -2;
pub const SI_QUEUE: c_int = -1;
pub const SI_USER: c_int = 0;
pub const SI_KERNEL: c_int = 128;
const enum_unnamed_34 = c_int;
pub const ILL_ILLOPC: c_int = 1;
pub const ILL_ILLOPN: c_int = 2;
pub const ILL_ILLADR: c_int = 3;
pub const ILL_ILLTRP: c_int = 4;
pub const ILL_PRVOPC: c_int = 5;
pub const ILL_PRVREG: c_int = 6;
pub const ILL_COPROC: c_int = 7;
pub const ILL_BADSTK: c_int = 8;
pub const ILL_BADIADDR: c_int = 9;
const enum_unnamed_35 = c_uint;
pub const FPE_INTDIV: c_int = 1;
pub const FPE_INTOVF: c_int = 2;
pub const FPE_FLTDIV: c_int = 3;
pub const FPE_FLTOVF: c_int = 4;
pub const FPE_FLTUND: c_int = 5;
pub const FPE_FLTRES: c_int = 6;
pub const FPE_FLTINV: c_int = 7;
pub const FPE_FLTSUB: c_int = 8;
pub const FPE_FLTUNK: c_int = 14;
pub const FPE_CONDTRAP: c_int = 15;
const enum_unnamed_36 = c_uint;
pub const SEGV_MAPERR: c_int = 1;
pub const SEGV_ACCERR: c_int = 2;
pub const SEGV_BNDERR: c_int = 3;
pub const SEGV_PKUERR: c_int = 4;
pub const SEGV_ACCADI: c_int = 5;
pub const SEGV_ADIDERR: c_int = 6;
pub const SEGV_ADIPERR: c_int = 7;
pub const SEGV_MTEAERR: c_int = 8;
pub const SEGV_MTESERR: c_int = 9;
pub const SEGV_CPERR: c_int = 10;
const enum_unnamed_37 = c_uint;
pub const BUS_ADRALN: c_int = 1;
pub const BUS_ADRERR: c_int = 2;
pub const BUS_OBJERR: c_int = 3;
pub const BUS_MCEERR_AR: c_int = 4;
pub const BUS_MCEERR_AO: c_int = 5;
const enum_unnamed_38 = c_uint;
pub const CLD_EXITED: c_int = 1;
pub const CLD_KILLED: c_int = 2;
pub const CLD_DUMPED: c_int = 3;
pub const CLD_TRAPPED: c_int = 4;
pub const CLD_STOPPED: c_int = 5;
pub const CLD_CONTINUED: c_int = 6;
const enum_unnamed_39 = c_uint;
pub const POLL_IN: c_int = 1;
pub const POLL_OUT: c_int = 2;
pub const POLL_MSG: c_int = 3;
pub const POLL_ERR: c_int = 4;
pub const POLL_PRI: c_int = 5;
pub const POLL_HUP: c_int = 6;
const enum_unnamed_40 = c_uint;
pub const sigval_t = __sigval_t;
pub const sigevent_t = struct_sigevent;
pub const SIGEV_SIGNAL: c_int = 0;
pub const SIGEV_NONE: c_int = 1;
pub const SIGEV_THREAD: c_int = 2;
pub const SIGEV_THREAD_ID: c_int = 4;
const enum_unnamed_41 = c_uint;
pub const __sighandler_t = ?*const fn (c_int) callconv(.c) void;
pub extern fn __sysv_signal(__sig: c_int, __handler: __sighandler_t) __sighandler_t;
pub extern fn signal(__sig: c_int, __handler: __sighandler_t) __sighandler_t;
pub extern fn kill(__pid: __pid_t, __sig: c_int) c_int;
pub extern fn killpg(__pgrp: __pid_t, __sig: c_int) c_int;
pub extern fn raise(__sig: c_int) c_int;
pub extern fn ssignal(__sig: c_int, __handler: __sighandler_t) __sighandler_t;
pub extern fn gsignal(__sig: c_int) c_int;
pub extern fn psignal(__sig: c_int, __s: [*c]const u8) void;
pub extern fn psiginfo(__pinfo: [*c]const siginfo_t, __s: [*c]const u8) void;
pub extern fn sigblock(__mask: c_int) c_int;
pub extern fn sigsetmask(__mask: c_int) c_int;
pub extern fn siggetmask() c_int;
pub const sig_t = __sighandler_t;
pub extern fn sigemptyset(__set: [*c]sigset_t) c_int;
pub extern fn sigfillset(__set: [*c]sigset_t) c_int;
pub extern fn sigaddset(__set: [*c]sigset_t, __signo: c_int) c_int;
pub extern fn sigdelset(__set: [*c]sigset_t, __signo: c_int) c_int;
pub extern fn sigismember(__set: [*c]const sigset_t, __signo: c_int) c_int;
const union_unnamed_42 = extern union {
    sa_handler: __sighandler_t,
    sa_sigaction: ?*const fn (c_int, [*c]siginfo_t, ?*anyopaque) callconv(.c) void,
};
pub const struct_sigaction = extern struct {
    __sigaction_handler: union_unnamed_42 = @import("std").mem.zeroes(union_unnamed_42),
    sa_mask: __sigset_t = @import("std").mem.zeroes(__sigset_t),
    sa_flags: c_int = @import("std").mem.zeroes(c_int),
    sa_restorer: ?*const fn () callconv(.c) void = @import("std").mem.zeroes(?*const fn () callconv(.c) void),
};
pub extern fn sigprocmask(__how: c_int, noalias __set: [*c]const sigset_t, noalias __oset: [*c]sigset_t) c_int;
pub extern fn sigsuspend(__set: [*c]const sigset_t) c_int;
pub extern fn sigaction(__sig: c_int, noalias __act: [*c]const struct_sigaction, noalias __oact: [*c]struct_sigaction) c_int;
pub extern fn sigpending(__set: [*c]sigset_t) c_int;
pub extern fn sigwait(noalias __set: [*c]const sigset_t, noalias __sig: [*c]c_int) c_int;
pub extern fn sigwaitinfo(noalias __set: [*c]const sigset_t, noalias __info: [*c]siginfo_t) c_int;
pub extern fn sigtimedwait(noalias __set: [*c]const sigset_t, noalias __info: [*c]siginfo_t, noalias __timeout: [*c]const struct_timespec) c_int;
pub extern fn sigqueue(__pid: __pid_t, __sig: c_int, __val: union_sigval) c_int;
pub const __s8 = i8;
pub const __u8 = u8;
pub const __s16 = c_short;
pub const __u16 = c_ushort;
pub const __s32 = c_int;
pub const __u32 = c_uint;
pub const __s64 = c_longlong;
pub const __u64 = c_ulonglong;
pub const __s128 = i128;
pub const __u128 = u128;
pub const __le16 = __u16;
pub const __be16 = __u16;
pub const __le32 = __u32;
pub const __be32 = __u32;
pub const __le64 = __u64;
pub const __be64 = __u64;
pub const __sum16 = __u16;
pub const __wsum = __u32;
pub const __poll_t = c_uint;
pub const struct_sigcontext = extern struct {
    fault_address: __u64 = @import("std").mem.zeroes(__u64),
    regs: [31]__u64 = @import("std").mem.zeroes([31]__u64),
    sp: __u64 = @import("std").mem.zeroes(__u64),
    pc: __u64 = @import("std").mem.zeroes(__u64),
    pstate: __u64 = @import("std").mem.zeroes(__u64),
    __reserved: [4096]__u8 align(16) = @import("std").mem.zeroes([4096]__u8),
};
pub const struct__aarch64_ctx = extern struct {
    magic: __u32 = @import("std").mem.zeroes(__u32),
    size: __u32 = @import("std").mem.zeroes(__u32),
};
pub const __uint128_t = u128;
pub const struct_fpsimd_context = extern struct {
    head: struct__aarch64_ctx = @import("std").mem.zeroes(struct__aarch64_ctx),
    fpsr: __u32 = @import("std").mem.zeroes(__u32),
    fpcr: __u32 = @import("std").mem.zeroes(__u32),
    vregs: [32]__uint128_t = @import("std").mem.zeroes([32]__uint128_t),
};
pub const struct_esr_context = extern struct {
    head: struct__aarch64_ctx = @import("std").mem.zeroes(struct__aarch64_ctx),
    esr: __u64 = @import("std").mem.zeroes(__u64),
};
pub const struct_poe_context = extern struct {
    head: struct__aarch64_ctx = @import("std").mem.zeroes(struct__aarch64_ctx),
    por_el0: __u64 = @import("std").mem.zeroes(__u64),
};
pub const struct_extra_context = extern struct {
    head: struct__aarch64_ctx = @import("std").mem.zeroes(struct__aarch64_ctx),
    datap: __u64 = @import("std").mem.zeroes(__u64),
    size: __u32 = @import("std").mem.zeroes(__u32),
    __reserved: [3]__u32 = @import("std").mem.zeroes([3]__u32),
};
pub const struct_sve_context = extern struct {
    head: struct__aarch64_ctx = @import("std").mem.zeroes(struct__aarch64_ctx),
    vl: __u16 = @import("std").mem.zeroes(__u16),
    flags: __u16 = @import("std").mem.zeroes(__u16),
    __reserved: [2]__u16 = @import("std").mem.zeroes([2]__u16),
};
pub const struct_tpidr2_context = extern struct {
    head: struct__aarch64_ctx = @import("std").mem.zeroes(struct__aarch64_ctx),
    tpidr2: __u64 = @import("std").mem.zeroes(__u64),
};
pub const struct_fpmr_context = extern struct {
    head: struct__aarch64_ctx = @import("std").mem.zeroes(struct__aarch64_ctx),
    fpmr: __u64 = @import("std").mem.zeroes(__u64),
};
pub const struct_za_context = extern struct {
    head: struct__aarch64_ctx = @import("std").mem.zeroes(struct__aarch64_ctx),
    vl: __u16 = @import("std").mem.zeroes(__u16),
    __reserved: [3]__u16 = @import("std").mem.zeroes([3]__u16),
};
pub const struct_zt_context = extern struct {
    head: struct__aarch64_ctx = @import("std").mem.zeroes(struct__aarch64_ctx),
    nregs: __u16 = @import("std").mem.zeroes(__u16),
    __reserved: [3]__u16 = @import("std").mem.zeroes([3]__u16),
};
pub extern fn sigreturn(__scp: [*c]struct_sigcontext) c_int;
pub const stack_t = extern struct {
    ss_sp: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    ss_flags: c_int = @import("std").mem.zeroes(c_int),
    ss_size: usize = @import("std").mem.zeroes(usize),
};
pub const struct_timezone = extern struct {
    tz_minuteswest: c_int = @import("std").mem.zeroes(c_int),
    tz_dsttime: c_int = @import("std").mem.zeroes(c_int),
};
pub extern fn gettimeofday(noalias __tv: [*c]struct_timeval, noalias __tz: ?*anyopaque) c_int;
pub extern fn settimeofday(__tv: [*c]const struct_timeval, __tz: [*c]const struct_timezone) c_int;
pub extern fn adjtime(__delta: [*c]const struct_timeval, __olddelta: [*c]struct_timeval) c_int;
pub const ITIMER_REAL: c_int = 0;
pub const ITIMER_VIRTUAL: c_int = 1;
pub const ITIMER_PROF: c_int = 2;
pub const enum___itimer_which = c_uint;
pub const struct_itimerval = extern struct {
    it_interval: struct_timeval = @import("std").mem.zeroes(struct_timeval),
    it_value: struct_timeval = @import("std").mem.zeroes(struct_timeval),
};
pub const __itimer_which_t = c_int;
pub extern fn getitimer(__which: __itimer_which_t, __value: [*c]struct_itimerval) c_int;
pub extern fn setitimer(__which: __itimer_which_t, noalias __new: [*c]const struct_itimerval, noalias __old: [*c]struct_itimerval) c_int;
pub extern fn utimes(__file: [*c]const u8, __tvp: [*c]const struct_timeval) c_int;
pub extern fn lutimes(__file: [*c]const u8, __tvp: [*c]const struct_timeval) c_int;
pub extern fn futimes(__fd: c_int, __tvp: [*c]const struct_timeval) c_int;
pub const struct_user_regs_struct = extern struct {
    regs: [31]c_ulonglong = @import("std").mem.zeroes([31]c_ulonglong),
    sp: c_ulonglong = @import("std").mem.zeroes(c_ulonglong),
    pc: c_ulonglong = @import("std").mem.zeroes(c_ulonglong),
    pstate: c_ulonglong = @import("std").mem.zeroes(c_ulonglong),
};
pub const struct_user_fpsimd_struct = extern struct {
    vregs: [32]__uint128_t = @import("std").mem.zeroes([32]__uint128_t),
    fpsr: c_uint = @import("std").mem.zeroes(c_uint),
    fpcr: c_uint = @import("std").mem.zeroes(c_uint),
};
pub const elf_greg_t = __uint64_t;
pub const elf_gregset_t = [34]elf_greg_t;
pub const elf_fpregset_t = struct_user_fpsimd_struct;
pub const __pr_uid_t = c_uint;
pub const __pr_gid_t = c_uint;
pub const struct_elf_siginfo = extern struct {
    si_signo: c_int = @import("std").mem.zeroes(c_int),
    si_code: c_int = @import("std").mem.zeroes(c_int),
    si_errno: c_int = @import("std").mem.zeroes(c_int),
};
pub const struct_elf_prstatus = extern struct {
    pr_info: struct_elf_siginfo = @import("std").mem.zeroes(struct_elf_siginfo),
    pr_cursig: c_short = @import("std").mem.zeroes(c_short),
    pr_sigpend: c_ulong = @import("std").mem.zeroes(c_ulong),
    pr_sighold: c_ulong = @import("std").mem.zeroes(c_ulong),
    pr_pid: __pid_t = @import("std").mem.zeroes(__pid_t),
    pr_ppid: __pid_t = @import("std").mem.zeroes(__pid_t),
    pr_pgrp: __pid_t = @import("std").mem.zeroes(__pid_t),
    pr_sid: __pid_t = @import("std").mem.zeroes(__pid_t),
    pr_utime: struct_timeval = @import("std").mem.zeroes(struct_timeval),
    pr_stime: struct_timeval = @import("std").mem.zeroes(struct_timeval),
    pr_cutime: struct_timeval = @import("std").mem.zeroes(struct_timeval),
    pr_cstime: struct_timeval = @import("std").mem.zeroes(struct_timeval),
    pr_reg: elf_gregset_t = @import("std").mem.zeroes(elf_gregset_t),
    pr_fpvalid: c_int = @import("std").mem.zeroes(c_int),
};
pub const struct_elf_prpsinfo = extern struct {
    pr_state: u8 = @import("std").mem.zeroes(u8),
    pr_sname: u8 = @import("std").mem.zeroes(u8),
    pr_zomb: u8 = @import("std").mem.zeroes(u8),
    pr_nice: u8 = @import("std").mem.zeroes(u8),
    pr_flag: c_ulong = @import("std").mem.zeroes(c_ulong),
    pr_uid: __pr_uid_t = @import("std").mem.zeroes(__pr_uid_t),
    pr_gid: __pr_gid_t = @import("std").mem.zeroes(__pr_gid_t),
    pr_pid: c_int = @import("std").mem.zeroes(c_int),
    pr_ppid: c_int = @import("std").mem.zeroes(c_int),
    pr_pgrp: c_int = @import("std").mem.zeroes(c_int),
    pr_sid: c_int = @import("std").mem.zeroes(c_int),
    pr_fname: [16]u8 = @import("std").mem.zeroes([16]u8),
    pr_psargs: [80]u8 = @import("std").mem.zeroes([80]u8),
};
pub const psaddr_t = ?*anyopaque;
pub const __prgregset_t = elf_gregset_t;
pub const __prfpregset_t = elf_fpregset_t;
pub const prgregset_t = __prgregset_t;
pub const prfpregset_t = __prfpregset_t;
pub const lwpid_t = __pid_t;
pub const prstatus_t = struct_elf_prstatus;
pub const prpsinfo_t = struct_elf_prpsinfo;
pub const greg_t = elf_greg_t;
pub const gregset_t = elf_gregset_t;
pub const fpregset_t = elf_fpregset_t;
pub const mcontext_t = extern struct {
    fault_address: c_ulonglong = @import("std").mem.zeroes(c_ulonglong),
    regs: [31]c_ulonglong = @import("std").mem.zeroes([31]c_ulonglong),
    sp: c_ulonglong = @import("std").mem.zeroes(c_ulonglong),
    pc: c_ulonglong = @import("std").mem.zeroes(c_ulonglong),
    pstate: c_ulonglong = @import("std").mem.zeroes(c_ulonglong),
    __reserved: [4096]u8 align(16) = @import("std").mem.zeroes([4096]u8),
};
pub const struct_ucontext_t = extern struct {
    uc_flags: c_ulong = @import("std").mem.zeroes(c_ulong),
    uc_link: [*c]struct_ucontext_t = @import("std").mem.zeroes([*c]struct_ucontext_t),
    uc_stack: stack_t = @import("std").mem.zeroes(stack_t),
    uc_sigmask: sigset_t = @import("std").mem.zeroes(sigset_t),
    uc_mcontext: mcontext_t = @import("std").mem.zeroes(mcontext_t),
};
pub const ucontext_t = struct_ucontext_t;
pub extern fn siginterrupt(__sig: c_int, __interrupt: c_int) c_int;
pub const SS_ONSTACK: c_int = 1;
pub const SS_DISABLE: c_int = 2;
const enum_unnamed_43 = c_uint;
pub extern fn sigaltstack(noalias __ss: [*c]const stack_t, noalias __oss: [*c]stack_t) c_int;
pub const struct_sigstack = extern struct {
    ss_sp: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    ss_onstack: c_int = @import("std").mem.zeroes(c_int),
};
pub extern fn sigstack(__ss: [*c]struct_sigstack, __oss: [*c]struct_sigstack) c_int;
pub extern fn pthread_sigmask(__how: c_int, noalias __newmask: [*c]const __sigset_t, noalias __oldmask: [*c]__sigset_t) c_int;
pub extern fn pthread_kill(__threadid: pthread_t, __signo: c_int) c_int;
pub extern fn __libc_current_sigrtmin() c_int;
pub extern fn __libc_current_sigrtmax() c_int;
pub const wchar_t = c_uint;
pub const _Float128 = c_longdouble;
pub const _Float32 = f32;
pub const _Float64 = f64;
pub const _Float32x = f64;
pub const _Float64x = c_longdouble;
pub const div_t = extern struct {
    quot: c_int = @import("std").mem.zeroes(c_int),
    rem: c_int = @import("std").mem.zeroes(c_int),
};
pub const ldiv_t = extern struct {
    quot: c_long = @import("std").mem.zeroes(c_long),
    rem: c_long = @import("std").mem.zeroes(c_long),
};
pub const lldiv_t = extern struct {
    quot: c_longlong = @import("std").mem.zeroes(c_longlong),
    rem: c_longlong = @import("std").mem.zeroes(c_longlong),
};
pub extern fn __ctype_get_mb_cur_max() usize;
pub extern fn atof(__nptr: [*c]const u8) f64;
pub extern fn atoi(__nptr: [*c]const u8) c_int;
pub extern fn atol(__nptr: [*c]const u8) c_long;
pub extern fn atoll(__nptr: [*c]const u8) c_longlong;
pub extern fn strtod(__nptr: [*c]const u8, __endptr: [*c][*c]u8) f64;
pub extern fn strtof(__nptr: [*c]const u8, __endptr: [*c][*c]u8) f32;
pub extern fn strtold(__nptr: [*c]const u8, __endptr: [*c][*c]u8) c_longdouble;
pub extern fn strtol(__nptr: [*c]const u8, __endptr: [*c][*c]u8, __base: c_int) c_long;
pub extern fn strtoul(__nptr: [*c]const u8, __endptr: [*c][*c]u8, __base: c_int) c_ulong;
pub extern fn strtoq(noalias __nptr: [*c]const u8, noalias __endptr: [*c][*c]u8, __base: c_int) c_longlong;
pub extern fn strtouq(noalias __nptr: [*c]const u8, noalias __endptr: [*c][*c]u8, __base: c_int) c_ulonglong;
pub extern fn strtoll(__nptr: [*c]const u8, __endptr: [*c][*c]u8, __base: c_int) c_longlong;
pub extern fn strtoull(__nptr: [*c]const u8, __endptr: [*c][*c]u8, __base: c_int) c_ulonglong;
pub extern fn l64a(__n: c_long) [*c]u8;
pub extern fn a64l(__s: [*c]const u8) c_long;
pub extern fn random() c_long;
pub extern fn srandom(__seed: c_uint) void;
pub extern fn initstate(__seed: c_uint, __statebuf: [*c]u8, __statelen: usize) [*c]u8;
pub extern fn setstate(__statebuf: [*c]u8) [*c]u8;
pub const struct_random_data = extern struct {
    fptr: [*c]i32 = @import("std").mem.zeroes([*c]i32),
    rptr: [*c]i32 = @import("std").mem.zeroes([*c]i32),
    state: [*c]i32 = @import("std").mem.zeroes([*c]i32),
    rand_type: c_int = @import("std").mem.zeroes(c_int),
    rand_deg: c_int = @import("std").mem.zeroes(c_int),
    rand_sep: c_int = @import("std").mem.zeroes(c_int),
    end_ptr: [*c]i32 = @import("std").mem.zeroes([*c]i32),
};
pub extern fn random_r(noalias __buf: [*c]struct_random_data, noalias __result: [*c]i32) c_int;
pub extern fn srandom_r(__seed: c_uint, __buf: [*c]struct_random_data) c_int;
pub extern fn initstate_r(__seed: c_uint, noalias __statebuf: [*c]u8, __statelen: usize, noalias __buf: [*c]struct_random_data) c_int;
pub extern fn setstate_r(noalias __statebuf: [*c]u8, noalias __buf: [*c]struct_random_data) c_int;
pub extern fn rand() c_int;
pub extern fn srand(__seed: c_uint) void;
pub extern fn rand_r(__seed: [*c]c_uint) c_int;
pub extern fn drand48() f64;
pub extern fn erand48(__xsubi: [*c]c_ushort) f64;
pub extern fn lrand48() c_long;
pub extern fn nrand48(__xsubi: [*c]c_ushort) c_long;
pub extern fn mrand48() c_long;
pub extern fn jrand48(__xsubi: [*c]c_ushort) c_long;
pub extern fn srand48(__seedval: c_long) void;
pub extern fn seed48(__seed16v: [*c]c_ushort) [*c]c_ushort;
pub extern fn lcong48(__param: [*c]c_ushort) void;
pub const struct_drand48_data = extern struct {
    __x: [3]c_ushort = @import("std").mem.zeroes([3]c_ushort),
    __old_x: [3]c_ushort = @import("std").mem.zeroes([3]c_ushort),
    __c: c_ushort = @import("std").mem.zeroes(c_ushort),
    __init: c_ushort = @import("std").mem.zeroes(c_ushort),
    __a: c_ulonglong = @import("std").mem.zeroes(c_ulonglong),
};
pub extern fn drand48_r(noalias __buffer: [*c]struct_drand48_data, noalias __result: [*c]f64) c_int;
pub extern fn erand48_r(__xsubi: [*c]c_ushort, noalias __buffer: [*c]struct_drand48_data, noalias __result: [*c]f64) c_int;
pub extern fn lrand48_r(noalias __buffer: [*c]struct_drand48_data, noalias __result: [*c]c_long) c_int;
pub extern fn nrand48_r(__xsubi: [*c]c_ushort, noalias __buffer: [*c]struct_drand48_data, noalias __result: [*c]c_long) c_int;
pub extern fn mrand48_r(noalias __buffer: [*c]struct_drand48_data, noalias __result: [*c]c_long) c_int;
pub extern fn jrand48_r(__xsubi: [*c]c_ushort, noalias __buffer: [*c]struct_drand48_data, noalias __result: [*c]c_long) c_int;
pub extern fn srand48_r(__seedval: c_long, __buffer: [*c]struct_drand48_data) c_int;
pub extern fn seed48_r(__seed16v: [*c]c_ushort, __buffer: [*c]struct_drand48_data) c_int;
pub extern fn lcong48_r(__param: [*c]c_ushort, __buffer: [*c]struct_drand48_data) c_int;
pub extern fn arc4random() __uint32_t;
pub extern fn arc4random_buf(__buf: ?*anyopaque, __size: usize) void;
pub extern fn arc4random_uniform(__upper_bound: __uint32_t) __uint32_t;
pub extern fn malloc(__size: c_ulong) ?*anyopaque;
pub extern fn calloc(__nmemb: c_ulong, __size: c_ulong) ?*anyopaque;
pub extern fn realloc(__ptr: ?*anyopaque, __size: c_ulong) ?*anyopaque;
pub extern fn free(__ptr: ?*anyopaque) void;
pub extern fn reallocarray(__ptr: ?*anyopaque, __nmemb: usize, __size: usize) ?*anyopaque;
pub extern fn alloca(__size: c_ulong) ?*anyopaque;
pub extern fn valloc(__size: usize) ?*anyopaque;
pub extern fn posix_memalign(__memptr: [*c]?*anyopaque, __alignment: usize, __size: usize) c_int;
pub extern fn aligned_alloc(__alignment: c_ulong, __size: c_ulong) ?*anyopaque;
pub extern fn abort() noreturn;
pub extern fn atexit(__func: ?*const fn () callconv(.c) void) c_int;
pub extern fn at_quick_exit(__func: ?*const fn () callconv(.c) void) c_int;
pub extern fn on_exit(__func: ?*const fn (c_int, ?*anyopaque) callconv(.c) void, __arg: ?*anyopaque) c_int;
pub extern fn exit(__status: c_int) noreturn;
pub extern fn quick_exit(__status: c_int) noreturn;
pub extern fn _Exit(__status: c_int) noreturn;
pub extern fn getenv(__name: [*c]const u8) [*c]u8;
pub extern fn putenv(__string: [*c]u8) c_int;
pub extern fn setenv(__name: [*c]const u8, __value: [*c]const u8, __replace: c_int) c_int;
pub extern fn unsetenv(__name: [*c]const u8) c_int;
pub extern fn clearenv() c_int;
pub extern fn mktemp(__template: [*c]u8) [*c]u8;
pub extern fn mkstemp(__template: [*c]u8) c_int;
pub extern fn mkstemps(__template: [*c]u8, __suffixlen: c_int) c_int;
pub extern fn mkdtemp(__template: [*c]u8) [*c]u8;
pub extern fn system(__command: [*c]const u8) c_int;
pub extern fn realpath(noalias __name: [*c]const u8, noalias __resolved: [*c]u8) [*c]u8;
pub const __compar_fn_t = ?*const fn (?*const anyopaque, ?*const anyopaque) callconv(.c) c_int;
pub extern fn bsearch(__key: ?*const anyopaque, __base: ?*const anyopaque, __nmemb: usize, __size: usize, __compar: __compar_fn_t) ?*anyopaque;
pub extern fn qsort(__base: ?*anyopaque, __nmemb: usize, __size: usize, __compar: __compar_fn_t) void;
pub extern fn abs(__x: c_int) c_int;
pub extern fn labs(__x: c_long) c_long;
pub extern fn llabs(__x: c_longlong) c_longlong;
pub extern fn div(__numer: c_int, __denom: c_int) div_t;
pub extern fn ldiv(__numer: c_long, __denom: c_long) ldiv_t;
pub extern fn lldiv(__numer: c_longlong, __denom: c_longlong) lldiv_t;
pub extern fn ecvt(__value: f64, __ndigit: c_int, noalias __decpt: [*c]c_int, noalias __sign: [*c]c_int) [*c]u8;
pub extern fn fcvt(__value: f64, __ndigit: c_int, noalias __decpt: [*c]c_int, noalias __sign: [*c]c_int) [*c]u8;
pub extern fn gcvt(__value: f64, __ndigit: c_int, __buf: [*c]u8) [*c]u8;
pub extern fn qecvt(__value: c_longdouble, __ndigit: c_int, noalias __decpt: [*c]c_int, noalias __sign: [*c]c_int) [*c]u8;
pub extern fn qfcvt(__value: c_longdouble, __ndigit: c_int, noalias __decpt: [*c]c_int, noalias __sign: [*c]c_int) [*c]u8;
pub extern fn qgcvt(__value: c_longdouble, __ndigit: c_int, __buf: [*c]u8) [*c]u8;
pub extern fn ecvt_r(__value: f64, __ndigit: c_int, noalias __decpt: [*c]c_int, noalias __sign: [*c]c_int, noalias __buf: [*c]u8, __len: usize) c_int;
pub extern fn fcvt_r(__value: f64, __ndigit: c_int, noalias __decpt: [*c]c_int, noalias __sign: [*c]c_int, noalias __buf: [*c]u8, __len: usize) c_int;
pub extern fn qecvt_r(__value: c_longdouble, __ndigit: c_int, noalias __decpt: [*c]c_int, noalias __sign: [*c]c_int, noalias __buf: [*c]u8, __len: usize) c_int;
pub extern fn qfcvt_r(__value: c_longdouble, __ndigit: c_int, noalias __decpt: [*c]c_int, noalias __sign: [*c]c_int, noalias __buf: [*c]u8, __len: usize) c_int;
pub extern fn mblen(__s: [*c]const u8, __n: usize) c_int;
pub extern fn mbtowc(noalias __pwc: [*c]wchar_t, noalias __s: [*c]const u8, __n: usize) c_int;
pub extern fn wctomb(__s: [*c]u8, __wchar: wchar_t) c_int;
pub extern fn mbstowcs(noalias __pwcs: [*c]wchar_t, noalias __s: [*c]const u8, __n: usize) usize;
pub extern fn wcstombs(noalias __s: [*c]u8, noalias __pwcs: [*c]const wchar_t, __n: usize) usize;
pub extern fn rpmatch(__response: [*c]const u8) c_int;
pub extern fn getsubopt(noalias __optionp: [*c][*c]u8, noalias __tokens: [*c]const [*c]u8, noalias __valuep: [*c][*c]u8) c_int;
pub extern fn getloadavg(__loadavg: [*c]f64, __nelem: c_int) c_int;
pub const __gwchar_t = c_uint;
pub const imaxdiv_t = extern struct {
    quot: c_long = @import("std").mem.zeroes(c_long),
    rem: c_long = @import("std").mem.zeroes(c_long),
};
pub extern fn imaxabs(__n: intmax_t) intmax_t;
pub extern fn imaxdiv(__numer: intmax_t, __denom: intmax_t) imaxdiv_t;
pub extern fn strtoimax(noalias __nptr: [*c]const u8, noalias __endptr: [*c][*c]u8, __base: c_int) intmax_t;
pub extern fn strtoumax(noalias __nptr: [*c]const u8, noalias __endptr: [*c][*c]u8, __base: c_int) uintmax_t;
pub extern fn wcstoimax(noalias __nptr: [*c]const __gwchar_t, noalias __endptr: [*c][*c]__gwchar_t, __base: c_int) intmax_t;
pub extern fn wcstoumax(noalias __nptr: [*c]const __gwchar_t, noalias __endptr: [*c][*c]__gwchar_t, __base: c_int) uintmax_t;
pub const struct___va_list_44 = extern struct {
    __stack: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    __gr_top: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    __vr_top: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    __gr_offs: c_int = @import("std").mem.zeroes(c_int),
    __vr_offs: c_int = @import("std").mem.zeroes(c_int),
};
pub const __builtin_va_list = struct___va_list_44;
pub const __gnuc_va_list = __builtin_va_list;
pub const va_list = __builtin_va_list;
pub const ptrdiff_t = c_long;
pub const max_align_t = extern struct {
    __clang_max_align_nonce1: c_longlong align(8) = @import("std").mem.zeroes(c_longlong),
    __clang_max_align_nonce2: c_longdouble align(16) = @import("std").mem.zeroes(c_longdouble),
};
pub const ngtcp2_ssize = ptrdiff_t;
pub const ngtcp2_malloc = ?*const fn (usize, ?*anyopaque) callconv(.c) ?*anyopaque;
pub const ngtcp2_free = ?*const fn (?*anyopaque, ?*anyopaque) callconv(.c) void;
pub const ngtcp2_calloc = ?*const fn (usize, usize, ?*anyopaque) callconv(.c) ?*anyopaque;
pub const ngtcp2_realloc = ?*const fn (?*anyopaque, usize, ?*anyopaque) callconv(.c) ?*anyopaque;
pub const struct_ngtcp2_mem = extern struct {
    user_data: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    malloc: ngtcp2_malloc = @import("std").mem.zeroes(ngtcp2_malloc),
    free: ngtcp2_free = @import("std").mem.zeroes(ngtcp2_free),
    calloc: ngtcp2_calloc = @import("std").mem.zeroes(ngtcp2_calloc),
    realloc: ngtcp2_realloc = @import("std").mem.zeroes(ngtcp2_realloc),
};
pub const ngtcp2_mem = struct_ngtcp2_mem;
pub const struct_ngtcp2_pkt_info = extern struct {
    ecn: u8 = @import("std").mem.zeroes(u8),
};
pub const ngtcp2_pkt_info = struct_ngtcp2_pkt_info;
pub const NGTCP2_PKT_VERSION_NEGOTIATION: c_int = 128;
pub const NGTCP2_PKT_STATELESS_RESET: c_int = 129;
pub const NGTCP2_PKT_INITIAL: c_int = 16;
pub const NGTCP2_PKT_0RTT: c_int = 17;
pub const NGTCP2_PKT_HANDSHAKE: c_int = 18;
pub const NGTCP2_PKT_RETRY: c_int = 19;
pub const NGTCP2_PKT_1RTT: c_int = 64;
pub const enum_ngtcp2_pkt_type = c_uint;
pub const ngtcp2_pkt_type = enum_ngtcp2_pkt_type;
pub const NGTCP2_PATH_VALIDATION_RESULT_SUCCESS: c_int = 0;
pub const NGTCP2_PATH_VALIDATION_RESULT_FAILURE: c_int = 1;
pub const NGTCP2_PATH_VALIDATION_RESULT_ABORTED: c_int = 2;
pub const enum_ngtcp2_path_validation_result = c_uint;
pub const ngtcp2_path_validation_result = enum_ngtcp2_path_validation_result;
pub const ngtcp2_tstamp = u64;
pub const ngtcp2_duration = u64;
pub const struct_ngtcp2_cid = extern struct {
    datalen: usize = @import("std").mem.zeroes(usize),
    data: [20]u8 = @import("std").mem.zeroes([20]u8),
};
pub const ngtcp2_cid = struct_ngtcp2_cid;
pub const struct_ngtcp2_vec = extern struct {
    base: [*c]u8 = @import("std").mem.zeroes([*c]u8),
    len: usize = @import("std").mem.zeroes(usize),
};
pub const ngtcp2_vec = struct_ngtcp2_vec;
pub extern fn ngtcp2_cid_init(cid: [*c]ngtcp2_cid, data: [*c]const u8, datalen: usize) void;
pub extern fn ngtcp2_cid_eq(a: [*c]const ngtcp2_cid, b: [*c]const ngtcp2_cid) c_int;
pub const struct_ngtcp2_pkt_hd = extern struct {
    dcid: ngtcp2_cid = @import("std").mem.zeroes(ngtcp2_cid),
    scid: ngtcp2_cid = @import("std").mem.zeroes(ngtcp2_cid),
    pkt_num: i64 = @import("std").mem.zeroes(i64),
    token: [*c]const u8 = @import("std").mem.zeroes([*c]const u8),
    tokenlen: usize = @import("std").mem.zeroes(usize),
    pkt_numlen: usize = @import("std").mem.zeroes(usize),
    len: usize = @import("std").mem.zeroes(usize),
    version: u32 = @import("std").mem.zeroes(u32),
    type: u8 = @import("std").mem.zeroes(u8),
    flags: u8 = @import("std").mem.zeroes(u8),
};
pub const ngtcp2_pkt_hd = struct_ngtcp2_pkt_hd;
pub const struct_ngtcp2_pkt_stateless_reset = extern struct {
    stateless_reset_token: [16]u8 = @import("std").mem.zeroes([16]u8),
    rand: [*c]const u8 = @import("std").mem.zeroes([*c]const u8),
    randlen: usize = @import("std").mem.zeroes(usize),
};
pub const ngtcp2_pkt_stateless_reset = struct_ngtcp2_pkt_stateless_reset;
pub const ngtcp2_sockaddr = struct_sockaddr;
pub const ngtcp2_sockaddr_in = struct_sockaddr_in;
pub const ngtcp2_sockaddr_in6 = struct_sockaddr_in6;
pub const ngtcp2_socklen = socklen_t;
pub const union_ngtcp2_sockaddr_union = extern union {
    sa: ngtcp2_sockaddr,
    in: ngtcp2_sockaddr_in,
    in6: ngtcp2_sockaddr_in6,
};
pub const ngtcp2_sockaddr_union = union_ngtcp2_sockaddr_union;
pub const struct_ngtcp2_preferred_addr = extern struct {
    cid: ngtcp2_cid = @import("std").mem.zeroes(ngtcp2_cid),
    ipv4: ngtcp2_sockaddr_in = @import("std").mem.zeroes(ngtcp2_sockaddr_in),
    ipv6: ngtcp2_sockaddr_in6 = @import("std").mem.zeroes(ngtcp2_sockaddr_in6),
    ipv4_present: u8 = @import("std").mem.zeroes(u8),
    ipv6_present: u8 = @import("std").mem.zeroes(u8),
    stateless_reset_token: [16]u8 = @import("std").mem.zeroes([16]u8),
};
pub const ngtcp2_preferred_addr = struct_ngtcp2_preferred_addr;
pub const struct_ngtcp2_version_info = extern struct {
    chosen_version: u32 = @import("std").mem.zeroes(u32),
    available_versions: [*c]const u8 = @import("std").mem.zeroes([*c]const u8),
    available_versionslen: usize = @import("std").mem.zeroes(usize),
};
pub const ngtcp2_version_info = struct_ngtcp2_version_info;
pub const struct_ngtcp2_transport_params = extern struct {
    preferred_addr: ngtcp2_preferred_addr = @import("std").mem.zeroes(ngtcp2_preferred_addr),
    original_dcid: ngtcp2_cid = @import("std").mem.zeroes(ngtcp2_cid),
    initial_scid: ngtcp2_cid = @import("std").mem.zeroes(ngtcp2_cid),
    retry_scid: ngtcp2_cid = @import("std").mem.zeroes(ngtcp2_cid),
    initial_max_stream_data_bidi_local: u64 = @import("std").mem.zeroes(u64),
    initial_max_stream_data_bidi_remote: u64 = @import("std").mem.zeroes(u64),
    initial_max_stream_data_uni: u64 = @import("std").mem.zeroes(u64),
    initial_max_data: u64 = @import("std").mem.zeroes(u64),
    initial_max_streams_bidi: u64 = @import("std").mem.zeroes(u64),
    initial_max_streams_uni: u64 = @import("std").mem.zeroes(u64),
    max_idle_timeout: ngtcp2_duration = @import("std").mem.zeroes(ngtcp2_duration),
    max_udp_payload_size: u64 = @import("std").mem.zeroes(u64),
    active_connection_id_limit: u64 = @import("std").mem.zeroes(u64),
    ack_delay_exponent: u64 = @import("std").mem.zeroes(u64),
    max_ack_delay: ngtcp2_duration = @import("std").mem.zeroes(ngtcp2_duration),
    max_datagram_frame_size: u64 = @import("std").mem.zeroes(u64),
    stateless_reset_token_present: u8 = @import("std").mem.zeroes(u8),
    disable_active_migration: u8 = @import("std").mem.zeroes(u8),
    original_dcid_present: u8 = @import("std").mem.zeroes(u8),
    initial_scid_present: u8 = @import("std").mem.zeroes(u8),
    retry_scid_present: u8 = @import("std").mem.zeroes(u8),
    preferred_addr_present: u8 = @import("std").mem.zeroes(u8),
    stateless_reset_token: [16]u8 = @import("std").mem.zeroes([16]u8),
    grease_quic_bit: u8 = @import("std").mem.zeroes(u8),
    version_info: ngtcp2_version_info = @import("std").mem.zeroes(ngtcp2_version_info),
    version_info_present: u8 = @import("std").mem.zeroes(u8),
};
pub const ngtcp2_transport_params = struct_ngtcp2_transport_params;
pub const struct_ngtcp2_conn_info = extern struct {
    latest_rtt: ngtcp2_duration = @import("std").mem.zeroes(ngtcp2_duration),
    min_rtt: ngtcp2_duration = @import("std").mem.zeroes(ngtcp2_duration),
    smoothed_rtt: ngtcp2_duration = @import("std").mem.zeroes(ngtcp2_duration),
    rttvar: ngtcp2_duration = @import("std").mem.zeroes(ngtcp2_duration),
    cwnd: u64 = @import("std").mem.zeroes(u64),
    ssthresh: u64 = @import("std").mem.zeroes(u64),
    bytes_in_flight: u64 = @import("std").mem.zeroes(u64),
    pkt_sent: u64 = @import("std").mem.zeroes(u64),
    bytes_sent: u64 = @import("std").mem.zeroes(u64),
    pkt_recv: u64 = @import("std").mem.zeroes(u64),
    bytes_recv: u64 = @import("std").mem.zeroes(u64),
    pkt_lost: u64 = @import("std").mem.zeroes(u64),
    bytes_lost: u64 = @import("std").mem.zeroes(u64),
    ping_recv: u64 = @import("std").mem.zeroes(u64),
    pkt_discarded: u64 = @import("std").mem.zeroes(u64),
};
pub const ngtcp2_conn_info = struct_ngtcp2_conn_info;
pub const NGTCP2_CC_ALGO_RENO: c_int = 0;
pub const NGTCP2_CC_ALGO_CUBIC: c_int = 1;
pub const NGTCP2_CC_ALGO_BBR: c_int = 2;
pub const enum_ngtcp2_cc_algo = c_uint;
pub const ngtcp2_cc_algo = enum_ngtcp2_cc_algo;
pub const ngtcp2_printf = ?*const fn (?*anyopaque, [*c]const u8, ...) callconv(.c) void;
pub const struct_ngtcp2_rand_ctx = extern struct {
    native_handle: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
};
pub const ngtcp2_rand_ctx = struct_ngtcp2_rand_ctx;
pub const ngtcp2_qlog_write = ?*const fn (?*anyopaque, u32, ?*const anyopaque, usize) callconv(.c) void;
pub const NGTCP2_TOKEN_TYPE_UNKNOWN: c_int = 0;
pub const NGTCP2_TOKEN_TYPE_RETRY: c_int = 1;
pub const NGTCP2_TOKEN_TYPE_NEW_TOKEN: c_int = 2;
pub const enum_ngtcp2_token_type = c_uint;
pub const ngtcp2_token_type = enum_ngtcp2_token_type;
pub const struct_ngtcp2_settings = extern struct {
    qlog_write: ngtcp2_qlog_write = @import("std").mem.zeroes(ngtcp2_qlog_write),
    cc_algo: ngtcp2_cc_algo = @import("std").mem.zeroes(ngtcp2_cc_algo),
    initial_ts: ngtcp2_tstamp = @import("std").mem.zeroes(ngtcp2_tstamp),
    initial_rtt: ngtcp2_duration = @import("std").mem.zeroes(ngtcp2_duration),
    log_printf: ngtcp2_printf = @import("std").mem.zeroes(ngtcp2_printf),
    max_tx_udp_payload_size: usize = @import("std").mem.zeroes(usize),
    token: [*c]const u8 = @import("std").mem.zeroes([*c]const u8),
    tokenlen: usize = @import("std").mem.zeroes(usize),
    token_type: ngtcp2_token_type = @import("std").mem.zeroes(ngtcp2_token_type),
    rand_ctx: ngtcp2_rand_ctx = @import("std").mem.zeroes(ngtcp2_rand_ctx),
    max_window: u64 = @import("std").mem.zeroes(u64),
    max_stream_window: u64 = @import("std").mem.zeroes(u64),
    ack_thresh: usize = @import("std").mem.zeroes(usize),
    no_tx_udp_payload_size_shaping: u8 = @import("std").mem.zeroes(u8),
    handshake_timeout: ngtcp2_duration = @import("std").mem.zeroes(ngtcp2_duration),
    preferred_versions: [*c]const u32 = @import("std").mem.zeroes([*c]const u32),
    preferred_versionslen: usize = @import("std").mem.zeroes(usize),
    available_versions: [*c]const u32 = @import("std").mem.zeroes([*c]const u32),
    available_versionslen: usize = @import("std").mem.zeroes(usize),
    original_version: u32 = @import("std").mem.zeroes(u32),
    no_pmtud: u8 = @import("std").mem.zeroes(u8),
    initial_pkt_num: u32 = @import("std").mem.zeroes(u32),
    pmtud_probes: [*c]const u16 = @import("std").mem.zeroes([*c]const u16),
    pmtud_probeslen: usize = @import("std").mem.zeroes(usize),
    glitch_ratelim_burst: u64 = @import("std").mem.zeroes(u64),
    glitch_ratelim_rate: u64 = @import("std").mem.zeroes(u64),
};
pub const ngtcp2_settings = struct_ngtcp2_settings;
pub const struct_ngtcp2_addr = extern struct {
    addr: [*c]ngtcp2_sockaddr = @import("std").mem.zeroes([*c]ngtcp2_sockaddr),
    addrlen: ngtcp2_socklen = @import("std").mem.zeroes(ngtcp2_socklen),
};
pub const ngtcp2_addr = struct_ngtcp2_addr;
pub const struct_ngtcp2_path = extern struct {
    local: ngtcp2_addr = @import("std").mem.zeroes(ngtcp2_addr),
    remote: ngtcp2_addr = @import("std").mem.zeroes(ngtcp2_addr),
    user_data: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
};
pub const ngtcp2_path = struct_ngtcp2_path;
pub const struct_ngtcp2_path_storage = extern struct {
    path: ngtcp2_path = @import("std").mem.zeroes(ngtcp2_path),
    local_addrbuf: ngtcp2_sockaddr_union = @import("std").mem.zeroes(ngtcp2_sockaddr_union),
    remote_addrbuf: ngtcp2_sockaddr_union = @import("std").mem.zeroes(ngtcp2_sockaddr_union),
};
pub const ngtcp2_path_storage = struct_ngtcp2_path_storage;
pub const struct_ngtcp2_crypto_md = extern struct {
    native_handle: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
};
pub const ngtcp2_crypto_md = struct_ngtcp2_crypto_md;
pub const struct_ngtcp2_crypto_aead = extern struct {
    native_handle: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    max_overhead: usize = @import("std").mem.zeroes(usize),
};
pub const ngtcp2_crypto_aead = struct_ngtcp2_crypto_aead;
pub const struct_ngtcp2_crypto_cipher = extern struct {
    native_handle: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
};
pub const ngtcp2_crypto_cipher = struct_ngtcp2_crypto_cipher;
pub const struct_ngtcp2_crypto_aead_ctx = extern struct {
    native_handle: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
};
pub const ngtcp2_crypto_aead_ctx = struct_ngtcp2_crypto_aead_ctx;
pub const struct_ngtcp2_crypto_cipher_ctx = extern struct {
    native_handle: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
};
pub const ngtcp2_crypto_cipher_ctx = struct_ngtcp2_crypto_cipher_ctx;
pub const struct_ngtcp2_crypto_ctx = extern struct {
    aead: ngtcp2_crypto_aead = @import("std").mem.zeroes(ngtcp2_crypto_aead),
    md: ngtcp2_crypto_md = @import("std").mem.zeroes(ngtcp2_crypto_md),
    hp: ngtcp2_crypto_cipher = @import("std").mem.zeroes(ngtcp2_crypto_cipher),
    max_encryption: u64 = @import("std").mem.zeroes(u64),
    max_decryption_failure: u64 = @import("std").mem.zeroes(u64),
};
pub const ngtcp2_crypto_ctx = struct_ngtcp2_crypto_ctx;
pub extern fn ngtcp2_transport_params_encode_versioned(dest: [*c]u8, destlen: usize, transport_params_version: c_int, params: [*c]const ngtcp2_transport_params) ngtcp2_ssize;
pub extern fn ngtcp2_transport_params_decode_versioned(transport_params_version: c_int, params: [*c]ngtcp2_transport_params, data: [*c]const u8, datalen: usize) c_int;
pub extern fn ngtcp2_transport_params_decode_new(pparams: [*c][*c]ngtcp2_transport_params, data: [*c]const u8, datalen: usize, mem: [*c]const ngtcp2_mem) c_int;
pub extern fn ngtcp2_transport_params_del(params: [*c]ngtcp2_transport_params, mem: [*c]const ngtcp2_mem) void;
pub const struct_ngtcp2_version_cid = extern struct {
    version: u32 = @import("std").mem.zeroes(u32),
    dcid: [*c]const u8 = @import("std").mem.zeroes([*c]const u8),
    dcidlen: usize = @import("std").mem.zeroes(usize),
    scid: [*c]const u8 = @import("std").mem.zeroes([*c]const u8),
    scidlen: usize = @import("std").mem.zeroes(usize),
};
pub const ngtcp2_version_cid = struct_ngtcp2_version_cid;
pub extern fn ngtcp2_pkt_decode_version_cid(dest: [*c]ngtcp2_version_cid, data: [*c]const u8, datalen: usize, short_dcidlen: usize) c_int;
pub extern fn ngtcp2_pkt_decode_hd_long(dest: [*c]ngtcp2_pkt_hd, pkt: [*c]const u8, pktlen: usize) ngtcp2_ssize;
pub extern fn ngtcp2_pkt_decode_hd_short(dest: [*c]ngtcp2_pkt_hd, pkt: [*c]const u8, pktlen: usize, dcidlen: usize) ngtcp2_ssize;
pub extern fn ngtcp2_pkt_write_stateless_reset(dest: [*c]u8, destlen: usize, stateless_reset_token: [*c]const u8, rand: [*c]const u8, randlen: usize) ngtcp2_ssize;
pub extern fn ngtcp2_pkt_write_version_negotiation(dest: [*c]u8, destlen: usize, unused_random: u8, dcid: [*c]const u8, dcidlen: usize, scid: [*c]const u8, scidlen: usize, sv: [*c]const u32, nsv: usize) ngtcp2_ssize;
pub const struct_ngtcp2_conn = opaque {};
pub const ngtcp2_conn = struct_ngtcp2_conn;
pub const ngtcp2_client_initial = ?*const fn (?*ngtcp2_conn, ?*anyopaque) callconv(.c) c_int;
pub const ngtcp2_recv_client_initial = ?*const fn (?*ngtcp2_conn, [*c]const ngtcp2_cid, ?*anyopaque) callconv(.c) c_int;
pub const NGTCP2_ENCRYPTION_LEVEL_INITIAL: c_int = 0;
pub const NGTCP2_ENCRYPTION_LEVEL_HANDSHAKE: c_int = 1;
pub const NGTCP2_ENCRYPTION_LEVEL_1RTT: c_int = 2;
pub const NGTCP2_ENCRYPTION_LEVEL_0RTT: c_int = 3;
pub const enum_ngtcp2_encryption_level = c_uint;
pub const ngtcp2_encryption_level = enum_ngtcp2_encryption_level;
pub const ngtcp2_recv_crypto_data = ?*const fn (?*ngtcp2_conn, ngtcp2_encryption_level, u64, [*c]const u8, usize, ?*anyopaque) callconv(.c) c_int;
pub const ngtcp2_handshake_completed = ?*const fn (?*ngtcp2_conn, ?*anyopaque) callconv(.c) c_int;
pub const ngtcp2_handshake_confirmed = ?*const fn (?*ngtcp2_conn, ?*anyopaque) callconv(.c) c_int;
pub const ngtcp2_recv_version_negotiation = ?*const fn (?*ngtcp2_conn, [*c]const ngtcp2_pkt_hd, [*c]const u32, usize, ?*anyopaque) callconv(.c) c_int;
pub const ngtcp2_recv_retry = ?*const fn (?*ngtcp2_conn, [*c]const ngtcp2_pkt_hd, ?*anyopaque) callconv(.c) c_int;
pub const ngtcp2_encrypt = ?*const fn ([*c]u8, [*c]const ngtcp2_crypto_aead, [*c]const ngtcp2_crypto_aead_ctx, [*c]const u8, usize, [*c]const u8, usize, [*c]const u8, usize) callconv(.c) c_int;
pub const ngtcp2_decrypt = ?*const fn ([*c]u8, [*c]const ngtcp2_crypto_aead, [*c]const ngtcp2_crypto_aead_ctx, [*c]const u8, usize, [*c]const u8, usize, [*c]const u8, usize) callconv(.c) c_int;
pub const ngtcp2_hp_mask = ?*const fn ([*c]u8, [*c]const ngtcp2_crypto_cipher, [*c]const ngtcp2_crypto_cipher_ctx, [*c]const u8) callconv(.c) c_int;
pub const ngtcp2_recv_stream_data = ?*const fn (?*ngtcp2_conn, u32, i64, u64, [*c]const u8, usize, ?*anyopaque, ?*anyopaque) callconv(.c) c_int;
pub const ngtcp2_stream_open = ?*const fn (?*ngtcp2_conn, i64, ?*anyopaque) callconv(.c) c_int;
pub const ngtcp2_stream_close = ?*const fn (?*ngtcp2_conn, u32, i64, u64, ?*anyopaque, ?*anyopaque) callconv(.c) c_int;
pub const ngtcp2_stream_reset = ?*const fn (?*ngtcp2_conn, i64, u64, u64, ?*anyopaque, ?*anyopaque) callconv(.c) c_int;
pub const ngtcp2_acked_stream_data_offset = ?*const fn (?*ngtcp2_conn, i64, u64, u64, ?*anyopaque, ?*anyopaque) callconv(.c) c_int;
pub const ngtcp2_recv_stateless_reset = ?*const fn (?*ngtcp2_conn, [*c]const ngtcp2_pkt_stateless_reset, ?*anyopaque) callconv(.c) c_int;
pub const ngtcp2_extend_max_streams = ?*const fn (?*ngtcp2_conn, u64, ?*anyopaque) callconv(.c) c_int;
pub const ngtcp2_extend_max_stream_data = ?*const fn (?*ngtcp2_conn, i64, u64, ?*anyopaque, ?*anyopaque) callconv(.c) c_int;
pub const ngtcp2_rand = ?*const fn ([*c]u8, usize, [*c]const ngtcp2_rand_ctx) callconv(.c) void;
pub const ngtcp2_get_new_connection_id = ?*const fn (?*ngtcp2_conn, [*c]ngtcp2_cid, [*c]u8, usize, ?*anyopaque) callconv(.c) c_int;
pub const ngtcp2_remove_connection_id = ?*const fn (?*ngtcp2_conn, [*c]const ngtcp2_cid, ?*anyopaque) callconv(.c) c_int;
pub const ngtcp2_update_key = ?*const fn (?*ngtcp2_conn, [*c]u8, [*c]u8, [*c]ngtcp2_crypto_aead_ctx, [*c]u8, [*c]ngtcp2_crypto_aead_ctx, [*c]u8, [*c]const u8, [*c]const u8, usize, ?*anyopaque) callconv(.c) c_int;
pub const ngtcp2_begin_path_validation = ?*const fn (?*ngtcp2_conn, u32, [*c]const ngtcp2_path, [*c]const ngtcp2_path, ?*anyopaque) callconv(.c) c_int;
pub const ngtcp2_path_validation = ?*const fn (?*ngtcp2_conn, u32, [*c]const ngtcp2_path, [*c]const ngtcp2_path, ngtcp2_path_validation_result, ?*anyopaque) callconv(.c) c_int;
pub const ngtcp2_select_preferred_addr = ?*const fn (?*ngtcp2_conn, [*c]ngtcp2_path, [*c]const ngtcp2_preferred_addr, ?*anyopaque) callconv(.c) c_int;
pub const NGTCP2_CONNECTION_ID_STATUS_TYPE_ACTIVATE: c_int = 0;
pub const NGTCP2_CONNECTION_ID_STATUS_TYPE_DEACTIVATE: c_int = 1;
pub const enum_ngtcp2_connection_id_status_type = c_uint;
pub const ngtcp2_connection_id_status_type = enum_ngtcp2_connection_id_status_type;
pub const ngtcp2_connection_id_status = ?*const fn (?*ngtcp2_conn, ngtcp2_connection_id_status_type, u64, [*c]const ngtcp2_cid, [*c]const u8, ?*anyopaque) callconv(.c) c_int;
pub const ngtcp2_recv_new_token = ?*const fn (?*ngtcp2_conn, [*c]const u8, usize, ?*anyopaque) callconv(.c) c_int;
pub const ngtcp2_delete_crypto_aead_ctx = ?*const fn (?*ngtcp2_conn, [*c]ngtcp2_crypto_aead_ctx, ?*anyopaque) callconv(.c) void;
pub const ngtcp2_delete_crypto_cipher_ctx = ?*const fn (?*ngtcp2_conn, [*c]ngtcp2_crypto_cipher_ctx, ?*anyopaque) callconv(.c) void;
pub const ngtcp2_recv_datagram = ?*const fn (?*ngtcp2_conn, u32, [*c]const u8, usize, ?*anyopaque) callconv(.c) c_int;
pub const ngtcp2_ack_datagram = ?*const fn (?*ngtcp2_conn, u64, ?*anyopaque) callconv(.c) c_int;
pub const ngtcp2_lost_datagram = ?*const fn (?*ngtcp2_conn, u64, ?*anyopaque) callconv(.c) c_int;
pub const ngtcp2_get_path_challenge_data = ?*const fn (?*ngtcp2_conn, [*c]u8, ?*anyopaque) callconv(.c) c_int;
pub const ngtcp2_stream_stop_sending = ?*const fn (?*ngtcp2_conn, i64, u64, ?*anyopaque, ?*anyopaque) callconv(.c) c_int;
pub const ngtcp2_version_negotiation = ?*const fn (?*ngtcp2_conn, u32, [*c]const ngtcp2_cid, ?*anyopaque) callconv(.c) c_int;
pub const ngtcp2_recv_key = ?*const fn (?*ngtcp2_conn, ngtcp2_encryption_level, ?*anyopaque) callconv(.c) c_int;
pub const ngtcp2_tls_early_data_rejected = ?*const fn (?*ngtcp2_conn, ?*anyopaque) callconv(.c) c_int;
pub const struct_ngtcp2_callbacks = extern struct {
    client_initial: ngtcp2_client_initial = @import("std").mem.zeroes(ngtcp2_client_initial),
    recv_client_initial: ngtcp2_recv_client_initial = @import("std").mem.zeroes(ngtcp2_recv_client_initial),
    recv_crypto_data: ngtcp2_recv_crypto_data = @import("std").mem.zeroes(ngtcp2_recv_crypto_data),
    handshake_completed: ngtcp2_handshake_completed = @import("std").mem.zeroes(ngtcp2_handshake_completed),
    recv_version_negotiation: ngtcp2_recv_version_negotiation = @import("std").mem.zeroes(ngtcp2_recv_version_negotiation),
    encrypt: ngtcp2_encrypt = @import("std").mem.zeroes(ngtcp2_encrypt),
    decrypt: ngtcp2_decrypt = @import("std").mem.zeroes(ngtcp2_decrypt),
    hp_mask: ngtcp2_hp_mask = @import("std").mem.zeroes(ngtcp2_hp_mask),
    recv_stream_data: ngtcp2_recv_stream_data = @import("std").mem.zeroes(ngtcp2_recv_stream_data),
    acked_stream_data_offset: ngtcp2_acked_stream_data_offset = @import("std").mem.zeroes(ngtcp2_acked_stream_data_offset),
    stream_open: ngtcp2_stream_open = @import("std").mem.zeroes(ngtcp2_stream_open),
    stream_close: ngtcp2_stream_close = @import("std").mem.zeroes(ngtcp2_stream_close),
    recv_stateless_reset: ngtcp2_recv_stateless_reset = @import("std").mem.zeroes(ngtcp2_recv_stateless_reset),
    recv_retry: ngtcp2_recv_retry = @import("std").mem.zeroes(ngtcp2_recv_retry),
    extend_max_local_streams_bidi: ngtcp2_extend_max_streams = @import("std").mem.zeroes(ngtcp2_extend_max_streams),
    extend_max_local_streams_uni: ngtcp2_extend_max_streams = @import("std").mem.zeroes(ngtcp2_extend_max_streams),
    rand: ngtcp2_rand = @import("std").mem.zeroes(ngtcp2_rand),
    get_new_connection_id: ngtcp2_get_new_connection_id = @import("std").mem.zeroes(ngtcp2_get_new_connection_id),
    remove_connection_id: ngtcp2_remove_connection_id = @import("std").mem.zeroes(ngtcp2_remove_connection_id),
    update_key: ngtcp2_update_key = @import("std").mem.zeroes(ngtcp2_update_key),
    path_validation: ngtcp2_path_validation = @import("std").mem.zeroes(ngtcp2_path_validation),
    select_preferred_addr: ngtcp2_select_preferred_addr = @import("std").mem.zeroes(ngtcp2_select_preferred_addr),
    stream_reset: ngtcp2_stream_reset = @import("std").mem.zeroes(ngtcp2_stream_reset),
    extend_max_remote_streams_bidi: ngtcp2_extend_max_streams = @import("std").mem.zeroes(ngtcp2_extend_max_streams),
    extend_max_remote_streams_uni: ngtcp2_extend_max_streams = @import("std").mem.zeroes(ngtcp2_extend_max_streams),
    extend_max_stream_data: ngtcp2_extend_max_stream_data = @import("std").mem.zeroes(ngtcp2_extend_max_stream_data),
    dcid_status: ngtcp2_connection_id_status = @import("std").mem.zeroes(ngtcp2_connection_id_status),
    handshake_confirmed: ngtcp2_handshake_confirmed = @import("std").mem.zeroes(ngtcp2_handshake_confirmed),
    recv_new_token: ngtcp2_recv_new_token = @import("std").mem.zeroes(ngtcp2_recv_new_token),
    delete_crypto_aead_ctx: ngtcp2_delete_crypto_aead_ctx = @import("std").mem.zeroes(ngtcp2_delete_crypto_aead_ctx),
    delete_crypto_cipher_ctx: ngtcp2_delete_crypto_cipher_ctx = @import("std").mem.zeroes(ngtcp2_delete_crypto_cipher_ctx),
    recv_datagram: ngtcp2_recv_datagram = @import("std").mem.zeroes(ngtcp2_recv_datagram),
    ack_datagram: ngtcp2_ack_datagram = @import("std").mem.zeroes(ngtcp2_ack_datagram),
    lost_datagram: ngtcp2_lost_datagram = @import("std").mem.zeroes(ngtcp2_lost_datagram),
    get_path_challenge_data: ngtcp2_get_path_challenge_data = @import("std").mem.zeroes(ngtcp2_get_path_challenge_data),
    stream_stop_sending: ngtcp2_stream_stop_sending = @import("std").mem.zeroes(ngtcp2_stream_stop_sending),
    version_negotiation: ngtcp2_version_negotiation = @import("std").mem.zeroes(ngtcp2_version_negotiation),
    recv_rx_key: ngtcp2_recv_key = @import("std").mem.zeroes(ngtcp2_recv_key),
    recv_tx_key: ngtcp2_recv_key = @import("std").mem.zeroes(ngtcp2_recv_key),
    tls_early_data_rejected: ngtcp2_tls_early_data_rejected = @import("std").mem.zeroes(ngtcp2_tls_early_data_rejected),
    begin_path_validation: ngtcp2_begin_path_validation = @import("std").mem.zeroes(ngtcp2_begin_path_validation),
};
pub const ngtcp2_callbacks = struct_ngtcp2_callbacks;
pub extern fn ngtcp2_pkt_write_connection_close(dest: [*c]u8, destlen: usize, version: u32, dcid: [*c]const ngtcp2_cid, scid: [*c]const ngtcp2_cid, error_code: u64, reason: [*c]const u8, reasonlen: usize, encrypt: ngtcp2_encrypt, aead: [*c]const ngtcp2_crypto_aead, aead_ctx: [*c]const ngtcp2_crypto_aead_ctx, iv: [*c]const u8, hp_mask: ngtcp2_hp_mask, hp: [*c]const ngtcp2_crypto_cipher, hp_ctx: [*c]const ngtcp2_crypto_cipher_ctx) ngtcp2_ssize;
pub extern fn ngtcp2_pkt_write_retry(dest: [*c]u8, destlen: usize, version: u32, dcid: [*c]const ngtcp2_cid, scid: [*c]const ngtcp2_cid, odcid: [*c]const ngtcp2_cid, token: [*c]const u8, tokenlen: usize, encrypt: ngtcp2_encrypt, aead: [*c]const ngtcp2_crypto_aead, aead_ctx: [*c]const ngtcp2_crypto_aead_ctx) ngtcp2_ssize;
pub extern fn ngtcp2_accept(dest: [*c]ngtcp2_pkt_hd, pkt: [*c]const u8, pktlen: usize) c_int;
pub extern fn ngtcp2_conn_client_new_versioned(pconn: [*c]?*ngtcp2_conn, dcid: [*c]const ngtcp2_cid, scid: [*c]const ngtcp2_cid, path: [*c]const ngtcp2_path, client_chosen_version: u32, callbacks_version: c_int, callbacks: [*c]const ngtcp2_callbacks, settings_version: c_int, settings: [*c]const ngtcp2_settings, transport_params_version: c_int, params: [*c]const ngtcp2_transport_params, mem: [*c]const ngtcp2_mem, user_data: ?*anyopaque) c_int;
pub extern fn ngtcp2_conn_server_new_versioned(pconn: [*c]?*ngtcp2_conn, dcid: [*c]const ngtcp2_cid, scid: [*c]const ngtcp2_cid, path: [*c]const ngtcp2_path, client_chosen_version: u32, callbacks_version: c_int, callbacks: [*c]const ngtcp2_callbacks, settings_version: c_int, settings: [*c]const ngtcp2_settings, transport_params_version: c_int, params: [*c]const ngtcp2_transport_params, mem: [*c]const ngtcp2_mem, user_data: ?*anyopaque) c_int;
pub extern fn ngtcp2_conn_del(conn: ?*ngtcp2_conn) void;
pub extern fn ngtcp2_conn_read_pkt_versioned(conn: ?*ngtcp2_conn, path: [*c]const ngtcp2_path, pkt_info_version: c_int, pi: [*c]const ngtcp2_pkt_info, pkt: [*c]const u8, pktlen: usize, ts: ngtcp2_tstamp) c_int;
pub extern fn ngtcp2_conn_write_pkt_versioned(conn: ?*ngtcp2_conn, path: [*c]ngtcp2_path, pkt_info_version: c_int, pi: [*c]ngtcp2_pkt_info, dest: [*c]u8, destlen: usize, ts: ngtcp2_tstamp) ngtcp2_ssize;
pub extern fn ngtcp2_conn_tls_handshake_completed(conn: ?*ngtcp2_conn) void;
pub extern fn ngtcp2_conn_get_handshake_completed(conn: ?*ngtcp2_conn) c_int;
pub extern fn ngtcp2_conn_install_initial_key(conn: ?*ngtcp2_conn, rx_aead_ctx: [*c]const ngtcp2_crypto_aead_ctx, rx_iv: [*c]const u8, rx_hp_ctx: [*c]const ngtcp2_crypto_cipher_ctx, tx_aead_ctx: [*c]const ngtcp2_crypto_aead_ctx, tx_iv: [*c]const u8, tx_hp_ctx: [*c]const ngtcp2_crypto_cipher_ctx, ivlen: usize) c_int;
pub extern fn ngtcp2_conn_install_vneg_initial_key(conn: ?*ngtcp2_conn, version: u32, rx_aead_ctx: [*c]const ngtcp2_crypto_aead_ctx, rx_iv: [*c]const u8, rx_hp_ctx: [*c]const ngtcp2_crypto_cipher_ctx, tx_aead_ctx: [*c]const ngtcp2_crypto_aead_ctx, tx_iv: [*c]const u8, tx_hp_ctx: [*c]const ngtcp2_crypto_cipher_ctx, ivlen: usize) c_int;
pub extern fn ngtcp2_conn_install_rx_handshake_key(conn: ?*ngtcp2_conn, aead_ctx: [*c]const ngtcp2_crypto_aead_ctx, iv: [*c]const u8, ivlen: usize, hp_ctx: [*c]const ngtcp2_crypto_cipher_ctx) c_int;
pub extern fn ngtcp2_conn_install_tx_handshake_key(conn: ?*ngtcp2_conn, aead_ctx: [*c]const ngtcp2_crypto_aead_ctx, iv: [*c]const u8, ivlen: usize, hp_ctx: [*c]const ngtcp2_crypto_cipher_ctx) c_int;
pub extern fn ngtcp2_conn_install_0rtt_key(conn: ?*ngtcp2_conn, aead_ctx: [*c]const ngtcp2_crypto_aead_ctx, iv: [*c]const u8, ivlen: usize, hp_ctx: [*c]const ngtcp2_crypto_cipher_ctx) c_int;
pub extern fn ngtcp2_conn_install_rx_key(conn: ?*ngtcp2_conn, secret: [*c]const u8, secretlen: usize, aead_ctx: [*c]const ngtcp2_crypto_aead_ctx, iv: [*c]const u8, ivlen: usize, hp_ctx: [*c]const ngtcp2_crypto_cipher_ctx) c_int;
pub extern fn ngtcp2_conn_install_tx_key(conn: ?*ngtcp2_conn, secret: [*c]const u8, secretlen: usize, aead_ctx: [*c]const ngtcp2_crypto_aead_ctx, iv: [*c]const u8, ivlen: usize, hp_ctx: [*c]const ngtcp2_crypto_cipher_ctx) c_int;
pub extern fn ngtcp2_conn_initiate_key_update(conn: ?*ngtcp2_conn, ts: ngtcp2_tstamp) c_int;
pub extern fn ngtcp2_conn_set_tls_error(conn: ?*ngtcp2_conn, liberr: c_int) void;
pub extern fn ngtcp2_conn_get_tls_error(conn: ?*ngtcp2_conn) c_int;
pub extern fn ngtcp2_conn_set_tls_alert(conn: ?*ngtcp2_conn, alert: u8) void;
pub extern fn ngtcp2_conn_get_tls_alert(conn: ?*ngtcp2_conn) u8;
pub extern fn ngtcp2_conn_set_keep_alive_timeout(conn: ?*ngtcp2_conn, timeout: ngtcp2_duration) void;
pub extern fn ngtcp2_conn_get_expiry(conn: ?*ngtcp2_conn) ngtcp2_tstamp;
pub extern fn ngtcp2_conn_handle_expiry(conn: ?*ngtcp2_conn, ts: ngtcp2_tstamp) c_int;
pub extern fn ngtcp2_conn_get_pto(conn: ?*ngtcp2_conn) ngtcp2_duration;
pub extern fn ngtcp2_conn_decode_and_set_remote_transport_params(conn: ?*ngtcp2_conn, data: [*c]const u8, datalen: usize) c_int;
pub extern fn ngtcp2_conn_get_remote_transport_params(conn: ?*ngtcp2_conn) [*c]const ngtcp2_transport_params;
pub extern fn ngtcp2_conn_encode_0rtt_transport_params(conn: ?*ngtcp2_conn, dest: [*c]u8, destlen: usize) ngtcp2_ssize;
pub extern fn ngtcp2_conn_decode_and_set_0rtt_transport_params(conn: ?*ngtcp2_conn, data: [*c]const u8, datalen: usize) c_int;
pub extern fn ngtcp2_conn_set_local_transport_params_versioned(conn: ?*ngtcp2_conn, transport_params_version: c_int, params: [*c]const ngtcp2_transport_params) c_int;
pub extern fn ngtcp2_conn_get_local_transport_params(conn: ?*ngtcp2_conn) [*c]const ngtcp2_transport_params;
pub extern fn ngtcp2_conn_encode_local_transport_params(conn: ?*ngtcp2_conn, dest: [*c]u8, destlen: usize) ngtcp2_ssize;
pub extern fn ngtcp2_conn_open_bidi_stream(conn: ?*ngtcp2_conn, pstream_id: [*c]i64, stream_user_data: ?*anyopaque) c_int;
pub extern fn ngtcp2_conn_open_uni_stream(conn: ?*ngtcp2_conn, pstream_id: [*c]i64, stream_user_data: ?*anyopaque) c_int;
pub extern fn ngtcp2_conn_shutdown_stream(conn: ?*ngtcp2_conn, flags: u32, stream_id: i64, app_error_code: u64) c_int;
pub extern fn ngtcp2_conn_shutdown_stream_write(conn: ?*ngtcp2_conn, flags: u32, stream_id: i64, app_error_code: u64) c_int;
pub extern fn ngtcp2_conn_shutdown_stream_read(conn: ?*ngtcp2_conn, flags: u32, stream_id: i64, app_error_code: u64) c_int;
pub extern fn ngtcp2_conn_write_stream_versioned(conn: ?*ngtcp2_conn, path: [*c]ngtcp2_path, pkt_info_version: c_int, pi: [*c]ngtcp2_pkt_info, dest: [*c]u8, destlen: usize, pdatalen: [*c]ngtcp2_ssize, flags: u32, stream_id: i64, data: [*c]const u8, datalen: usize, ts: ngtcp2_tstamp) ngtcp2_ssize;
pub extern fn ngtcp2_conn_writev_stream_versioned(conn: ?*ngtcp2_conn, path: [*c]ngtcp2_path, pkt_info_version: c_int, pi: [*c]ngtcp2_pkt_info, dest: [*c]u8, destlen: usize, pdatalen: [*c]ngtcp2_ssize, flags: u32, stream_id: i64, datav: [*c]const ngtcp2_vec, datavcnt: usize, ts: ngtcp2_tstamp) ngtcp2_ssize;
pub extern fn ngtcp2_conn_write_datagram_versioned(conn: ?*ngtcp2_conn, path: [*c]ngtcp2_path, pkt_info_version: c_int, pi: [*c]ngtcp2_pkt_info, dest: [*c]u8, destlen: usize, paccepted: [*c]c_int, flags: u32, dgram_id: u64, data: [*c]const u8, datalen: usize, ts: ngtcp2_tstamp) ngtcp2_ssize;
pub extern fn ngtcp2_conn_writev_datagram_versioned(conn: ?*ngtcp2_conn, path: [*c]ngtcp2_path, pkt_info_version: c_int, pi: [*c]ngtcp2_pkt_info, dest: [*c]u8, destlen: usize, paccepted: [*c]c_int, flags: u32, dgram_id: u64, datav: [*c]const ngtcp2_vec, datavcnt: usize, ts: ngtcp2_tstamp) ngtcp2_ssize;
pub extern fn ngtcp2_conn_in_closing_period(conn: ?*ngtcp2_conn) c_int;
pub extern fn ngtcp2_conn_in_draining_period(conn: ?*ngtcp2_conn) c_int;
pub extern fn ngtcp2_conn_extend_max_stream_offset(conn: ?*ngtcp2_conn, stream_id: i64, datalen: u64) c_int;
pub extern fn ngtcp2_conn_extend_max_offset(conn: ?*ngtcp2_conn, datalen: u64) void;
pub extern fn ngtcp2_conn_extend_max_streams_bidi(conn: ?*ngtcp2_conn, n: usize) void;
pub extern fn ngtcp2_conn_extend_max_streams_uni(conn: ?*ngtcp2_conn, n: usize) void;
pub extern fn ngtcp2_conn_get_dcid(conn: ?*ngtcp2_conn) [*c]const ngtcp2_cid;
pub extern fn ngtcp2_conn_get_client_initial_dcid(conn: ?*ngtcp2_conn) [*c]const ngtcp2_cid;
pub extern fn ngtcp2_conn_get_scid(conn: ?*ngtcp2_conn, dest: [*c]ngtcp2_cid) usize;
pub const struct_ngtcp2_cid_token = extern struct {
    seq: u64 = @import("std").mem.zeroes(u64),
    cid: ngtcp2_cid = @import("std").mem.zeroes(ngtcp2_cid),
    ps: ngtcp2_path_storage = @import("std").mem.zeroes(ngtcp2_path_storage),
    token: [16]u8 = @import("std").mem.zeroes([16]u8),
    token_present: u8 = @import("std").mem.zeroes(u8),
};
pub const ngtcp2_cid_token = struct_ngtcp2_cid_token;
pub extern fn ngtcp2_conn_get_active_dcid(conn: ?*ngtcp2_conn, dest: [*c]ngtcp2_cid_token) usize;
pub extern fn ngtcp2_conn_get_client_chosen_version(conn: ?*ngtcp2_conn) u32;
pub extern fn ngtcp2_conn_get_negotiated_version(conn: ?*ngtcp2_conn) u32;
pub extern fn ngtcp2_conn_tls_early_data_rejected(conn: ?*ngtcp2_conn) c_int;
pub extern fn ngtcp2_conn_get_tls_early_data_rejected(conn: ?*ngtcp2_conn) c_int;
pub extern fn ngtcp2_conn_get_conn_info_versioned(conn: ?*ngtcp2_conn, conn_info_version: c_int, cinfo: [*c]ngtcp2_conn_info) void;
pub extern fn ngtcp2_conn_submit_crypto_data(conn: ?*ngtcp2_conn, encryption_level: ngtcp2_encryption_level, data: [*c]const u8, datalen: usize) c_int;
pub extern fn ngtcp2_conn_submit_new_token(conn: ?*ngtcp2_conn, token: [*c]const u8, tokenlen: usize) c_int;
pub extern fn ngtcp2_conn_set_local_addr(conn: ?*ngtcp2_conn, addr: [*c]const ngtcp2_addr) void;
pub extern fn ngtcp2_conn_set_path_user_data(conn: ?*ngtcp2_conn, path_user_data: ?*anyopaque) void;
pub extern fn ngtcp2_conn_get_path(conn: ?*ngtcp2_conn) [*c]const ngtcp2_path;
pub extern fn ngtcp2_conn_get_max_tx_udp_payload_size(conn: ?*ngtcp2_conn) usize;
pub extern fn ngtcp2_conn_get_path_max_tx_udp_payload_size(conn: ?*ngtcp2_conn) usize;
pub extern fn ngtcp2_conn_initiate_immediate_migration(conn: ?*ngtcp2_conn, path: [*c]const ngtcp2_path, ts: ngtcp2_tstamp) c_int;
pub extern fn ngtcp2_conn_initiate_migration(conn: ?*ngtcp2_conn, path: [*c]const ngtcp2_path, ts: ngtcp2_tstamp) c_int;
pub extern fn ngtcp2_conn_get_max_data_left(conn: ?*ngtcp2_conn) u64;
pub extern fn ngtcp2_conn_get_max_stream_data_left(conn: ?*ngtcp2_conn, stream_id: i64) u64;
pub extern fn ngtcp2_conn_get_streams_bidi_left(conn: ?*ngtcp2_conn) u64;
pub extern fn ngtcp2_conn_get_streams_uni_left(conn: ?*ngtcp2_conn) u64;
pub extern fn ngtcp2_conn_get_cwnd_left(conn: ?*ngtcp2_conn) u64;
pub extern fn ngtcp2_conn_set_initial_crypto_ctx(conn: ?*ngtcp2_conn, ctx: [*c]const ngtcp2_crypto_ctx) void;
pub extern fn ngtcp2_conn_get_initial_crypto_ctx(conn: ?*ngtcp2_conn) [*c]const ngtcp2_crypto_ctx;
pub extern fn ngtcp2_conn_set_crypto_ctx(conn: ?*ngtcp2_conn, ctx: [*c]const ngtcp2_crypto_ctx) void;
pub extern fn ngtcp2_conn_get_crypto_ctx(conn: ?*ngtcp2_conn) [*c]const ngtcp2_crypto_ctx;
pub extern fn ngtcp2_conn_set_0rtt_crypto_ctx(conn: ?*ngtcp2_conn, ctx: [*c]const ngtcp2_crypto_ctx) void;
pub extern fn ngtcp2_conn_get_0rtt_crypto_ctx(conn: ?*ngtcp2_conn) [*c]const ngtcp2_crypto_ctx;
pub extern fn ngtcp2_conn_get_tls_native_handle(conn: ?*ngtcp2_conn) ?*anyopaque;
pub extern fn ngtcp2_conn_set_tls_native_handle(conn: ?*ngtcp2_conn, tls_native_handle: ?*anyopaque) void;
pub extern fn ngtcp2_conn_set_retry_aead(conn: ?*ngtcp2_conn, aead: [*c]const ngtcp2_crypto_aead, aead_ctx: [*c]const ngtcp2_crypto_aead_ctx) void;
pub const NGTCP2_CCERR_TYPE_TRANSPORT: c_int = 0;
pub const NGTCP2_CCERR_TYPE_APPLICATION: c_int = 1;
pub const NGTCP2_CCERR_TYPE_VERSION_NEGOTIATION: c_int = 2;
pub const NGTCP2_CCERR_TYPE_IDLE_CLOSE: c_int = 3;
pub const NGTCP2_CCERR_TYPE_DROP_CONN: c_int = 4;
pub const NGTCP2_CCERR_TYPE_RETRY: c_int = 5;
pub const enum_ngtcp2_ccerr_type = c_uint;
pub const ngtcp2_ccerr_type = enum_ngtcp2_ccerr_type;
pub const struct_ngtcp2_ccerr = extern struct {
    type: ngtcp2_ccerr_type = @import("std").mem.zeroes(ngtcp2_ccerr_type),
    error_code: u64 = @import("std").mem.zeroes(u64),
    frame_type: u64 = @import("std").mem.zeroes(u64),
    reason: [*c]const u8 = @import("std").mem.zeroes([*c]const u8),
    reasonlen: usize = @import("std").mem.zeroes(usize),
};
pub const ngtcp2_ccerr = struct_ngtcp2_ccerr;
pub extern fn ngtcp2_ccerr_default(ccerr: [*c]ngtcp2_ccerr) void;
pub extern fn ngtcp2_ccerr_set_transport_error(ccerr: [*c]ngtcp2_ccerr, error_code: u64, reason: [*c]const u8, reasonlen: usize) void;
pub extern fn ngtcp2_ccerr_set_liberr(ccerr: [*c]ngtcp2_ccerr, liberr: c_int, reason: [*c]const u8, reasonlen: usize) void;
pub extern fn ngtcp2_ccerr_set_tls_alert(ccerr: [*c]ngtcp2_ccerr, tls_alert: u8, reason: [*c]const u8, reasonlen: usize) void;
pub extern fn ngtcp2_ccerr_set_application_error(ccerr: [*c]ngtcp2_ccerr, error_code: u64, reason: [*c]const u8, reasonlen: usize) void;
pub extern fn ngtcp2_conn_write_connection_close_versioned(conn: ?*ngtcp2_conn, path: [*c]ngtcp2_path, pkt_info_version: c_int, pi: [*c]ngtcp2_pkt_info, dest: [*c]u8, destlen: usize, ccerr: [*c]const ngtcp2_ccerr, ts: ngtcp2_tstamp) ngtcp2_ssize;
pub extern fn ngtcp2_conn_get_ccerr(conn: ?*ngtcp2_conn) [*c]const ngtcp2_ccerr;
pub extern fn ngtcp2_conn_is_local_stream(conn: ?*ngtcp2_conn, stream_id: i64) c_int;
pub extern fn ngtcp2_conn_is_server(conn: ?*ngtcp2_conn) c_int;
pub extern fn ngtcp2_conn_after_retry(conn: ?*ngtcp2_conn) c_int;
pub extern fn ngtcp2_conn_set_stream_user_data(conn: ?*ngtcp2_conn, stream_id: i64, stream_user_data: ?*anyopaque) c_int;
pub extern fn ngtcp2_conn_get_stream_user_data(conn: ?*ngtcp2_conn, stream_id: i64) ?*anyopaque;
pub extern fn ngtcp2_conn_update_pkt_tx_time(conn: ?*ngtcp2_conn, ts: ngtcp2_tstamp) void;
pub extern fn ngtcp2_conn_get_send_quantum(conn: ?*ngtcp2_conn) usize;
pub extern fn ngtcp2_conn_get_stream_loss_count(conn: ?*ngtcp2_conn, stream_id: i64) usize;
pub const ngtcp2_write_pkt = ?*const fn (?*ngtcp2_conn, [*c]ngtcp2_path, [*c]ngtcp2_pkt_info, [*c]u8, usize, ngtcp2_tstamp, ?*anyopaque) callconv(.c) ngtcp2_ssize;
pub extern fn ngtcp2_conn_write_aggregate_pkt_versioned(conn: ?*ngtcp2_conn, path: [*c]ngtcp2_path, pkt_info_version: c_int, pi: [*c]ngtcp2_pkt_info, buf: [*c]u8, buflen: usize, pgsolen: [*c]usize, write_pkt: ngtcp2_write_pkt, ts: ngtcp2_tstamp) ngtcp2_ssize;
pub extern fn ngtcp2_conn_write_aggregate_pkt2_versioned(conn: ?*ngtcp2_conn, path: [*c]ngtcp2_path, pkt_info_version: c_int, pi: [*c]ngtcp2_pkt_info, buf: [*c]u8, buflen: usize, pgsolen: [*c]usize, write_pkt: ngtcp2_write_pkt, num_pkts: usize, ts: ngtcp2_tstamp) ngtcp2_ssize;
pub extern fn ngtcp2_conn_get_timestamp(conn: ?*const ngtcp2_conn) ngtcp2_tstamp;
pub extern fn ngtcp2_strerror(liberr: c_int) [*c]const u8;
pub extern fn ngtcp2_err_is_fatal(liberr: c_int) c_int;
pub extern fn ngtcp2_err_infer_quic_transport_error_code(liberr: c_int) u64;
pub extern fn ngtcp2_addr_init(dest: [*c]ngtcp2_addr, addr: [*c]const ngtcp2_sockaddr, addrlen: ngtcp2_socklen) [*c]ngtcp2_addr;
pub extern fn ngtcp2_addr_copy_byte(dest: [*c]ngtcp2_addr, addr: [*c]const ngtcp2_sockaddr, addrlen: ngtcp2_socklen) void;
pub extern fn ngtcp2_path_storage_init(ps: [*c]ngtcp2_path_storage, local_addr: [*c]const ngtcp2_sockaddr, local_addrlen: ngtcp2_socklen, remote_addr: [*c]const ngtcp2_sockaddr, remote_addrlen: ngtcp2_socklen, user_data: ?*anyopaque) void;
pub extern fn ngtcp2_path_storage_zero(ps: [*c]ngtcp2_path_storage) void;
pub extern fn ngtcp2_settings_default_versioned(settings_version: c_int, settings: [*c]ngtcp2_settings) void;
pub extern fn ngtcp2_transport_params_default_versioned(transport_params_version: c_int, params: [*c]ngtcp2_transport_params) void;
pub extern fn ngtcp2_mem_default() [*c]const ngtcp2_mem;
pub const struct_ngtcp2_info = extern struct {
    age: c_int = @import("std").mem.zeroes(c_int),
    version_num: c_int = @import("std").mem.zeroes(c_int),
    version_str: [*c]const u8 = @import("std").mem.zeroes([*c]const u8),
};
pub const ngtcp2_info = struct_ngtcp2_info;
pub extern fn ngtcp2_version(least_version: c_int) [*c]const ngtcp2_info;
pub extern fn ngtcp2_is_bidi_stream(stream_id: i64) c_int;
pub extern fn ngtcp2_path_copy(dest: [*c]ngtcp2_path, src: [*c]const ngtcp2_path) void;
pub extern fn ngtcp2_path_eq(a: [*c]const ngtcp2_path, b: [*c]const ngtcp2_path) c_int;
pub extern fn ngtcp2_is_supported_version(version: u32) c_int;
pub extern fn ngtcp2_is_reserved_version(version: u32) c_int;
pub extern fn ngtcp2_select_version(preferred_versions: [*c]const u32, preferred_versionslen: usize, offered_versions: [*c]const u32, offered_versionslen: usize) u32;
pub extern fn ngtcp2_crypto_ctx_tls(ctx: [*c]ngtcp2_crypto_ctx, tls_native_handle: ?*anyopaque) [*c]ngtcp2_crypto_ctx;
pub extern fn ngtcp2_crypto_ctx_tls_early(ctx: [*c]ngtcp2_crypto_ctx, tls_native_handle: ?*anyopaque) [*c]ngtcp2_crypto_ctx;
pub extern fn ngtcp2_crypto_md_init(md: [*c]ngtcp2_crypto_md, md_native_handle: ?*anyopaque) [*c]ngtcp2_crypto_md;
pub extern fn ngtcp2_crypto_md_hashlen(md: [*c]const ngtcp2_crypto_md) usize;
pub extern fn ngtcp2_crypto_aead_keylen(aead: [*c]const ngtcp2_crypto_aead) usize;
pub extern fn ngtcp2_crypto_aead_noncelen(aead: [*c]const ngtcp2_crypto_aead) usize;
pub extern fn ngtcp2_crypto_hkdf_extract(dest: [*c]u8, md: [*c]const ngtcp2_crypto_md, secret: [*c]const u8, secretlen: usize, salt: [*c]const u8, saltlen: usize) c_int;
pub extern fn ngtcp2_crypto_hkdf_expand(dest: [*c]u8, destlen: usize, md: [*c]const ngtcp2_crypto_md, secret: [*c]const u8, secretlen: usize, info: [*c]const u8, infolen: usize) c_int;
pub extern fn ngtcp2_crypto_hkdf(dest: [*c]u8, destlen: usize, md: [*c]const ngtcp2_crypto_md, secret: [*c]const u8, secretlen: usize, salt: [*c]const u8, saltlen: usize, info: [*c]const u8, infolen: usize) c_int;
pub extern fn ngtcp2_crypto_packet_protection_ivlen(aead: [*c]const ngtcp2_crypto_aead) usize;
pub extern fn ngtcp2_crypto_encrypt(dest: [*c]u8, aead: [*c]const ngtcp2_crypto_aead, aead_ctx: [*c]const ngtcp2_crypto_aead_ctx, plaintext: [*c]const u8, plaintextlen: usize, nonce: [*c]const u8, noncelen: usize, aad: [*c]const u8, aadlen: usize) c_int;
pub extern fn ngtcp2_crypto_encrypt_cb(dest: [*c]u8, aead: [*c]const ngtcp2_crypto_aead, aead_ctx: [*c]const ngtcp2_crypto_aead_ctx, plaintext: [*c]const u8, plaintextlen: usize, nonce: [*c]const u8, noncelen: usize, aad: [*c]const u8, aadlen: usize) c_int;
pub extern fn ngtcp2_crypto_decrypt(dest: [*c]u8, aead: [*c]const ngtcp2_crypto_aead, aead_ctx: [*c]const ngtcp2_crypto_aead_ctx, ciphertext: [*c]const u8, ciphertextlen: usize, nonce: [*c]const u8, noncelen: usize, aad: [*c]const u8, aadlen: usize) c_int;
pub extern fn ngtcp2_crypto_decrypt_cb(dest: [*c]u8, aead: [*c]const ngtcp2_crypto_aead, aead_ctx: [*c]const ngtcp2_crypto_aead_ctx, ciphertext: [*c]const u8, ciphertextlen: usize, nonce: [*c]const u8, noncelen: usize, aad: [*c]const u8, aadlen: usize) c_int;
pub extern fn ngtcp2_crypto_hp_mask(dest: [*c]u8, hp: [*c]const ngtcp2_crypto_cipher, hp_ctx: [*c]const ngtcp2_crypto_cipher_ctx, sample: [*c]const u8) c_int;
pub extern fn ngtcp2_crypto_hp_mask_cb(dest: [*c]u8, hp: [*c]const ngtcp2_crypto_cipher, hp_ctx: [*c]const ngtcp2_crypto_cipher_ctx, sample: [*c]const u8) c_int;
pub extern fn ngtcp2_crypto_derive_and_install_rx_key(conn: ?*ngtcp2_conn, key: [*c]u8, iv: [*c]u8, hp: [*c]u8, level: ngtcp2_encryption_level, secret: [*c]const u8, secretlen: usize) c_int;
pub extern fn ngtcp2_crypto_derive_and_install_tx_key(conn: ?*ngtcp2_conn, key: [*c]u8, iv: [*c]u8, hp: [*c]u8, level: ngtcp2_encryption_level, secret: [*c]const u8, secretlen: usize) c_int;
pub extern fn ngtcp2_crypto_update_key(conn: ?*ngtcp2_conn, rx_secret: [*c]u8, tx_secret: [*c]u8, rx_aead_ctx: [*c]ngtcp2_crypto_aead_ctx, rx_key: [*c]u8, rx_iv: [*c]u8, tx_aead_ctx: [*c]ngtcp2_crypto_aead_ctx, tx_key: [*c]u8, tx_iv: [*c]u8, current_rx_secret: [*c]const u8, current_tx_secret: [*c]const u8, secretlen: usize) c_int;
pub extern fn ngtcp2_crypto_update_key_cb(conn: ?*ngtcp2_conn, rx_secret: [*c]u8, tx_secret: [*c]u8, rx_aead_ctx: [*c]ngtcp2_crypto_aead_ctx, rx_iv: [*c]u8, tx_aead_ctx: [*c]ngtcp2_crypto_aead_ctx, tx_iv: [*c]u8, current_rx_secret: [*c]const u8, current_tx_secret: [*c]const u8, secretlen: usize, user_data: ?*anyopaque) c_int;
pub extern fn ngtcp2_crypto_client_initial_cb(conn: ?*ngtcp2_conn, user_data: ?*anyopaque) c_int;
pub extern fn ngtcp2_crypto_recv_retry_cb(conn: ?*ngtcp2_conn, hd: [*c]const ngtcp2_pkt_hd, user_data: ?*anyopaque) c_int;
pub extern fn ngtcp2_crypto_recv_client_initial_cb(conn: ?*ngtcp2_conn, dcid: [*c]const ngtcp2_cid, user_data: ?*anyopaque) c_int;
pub extern fn ngtcp2_crypto_read_write_crypto_data(conn: ?*ngtcp2_conn, encryption_level: ngtcp2_encryption_level, data: [*c]const u8, datalen: usize) c_int;
pub extern fn ngtcp2_crypto_recv_crypto_data_cb(conn: ?*ngtcp2_conn, encryption_level: ngtcp2_encryption_level, offset: u64, data: [*c]const u8, datalen: usize, user_data: ?*anyopaque) c_int;
pub extern fn ngtcp2_crypto_generate_stateless_reset_token(token: [*c]u8, secret: [*c]const u8, secretlen: usize, cid: [*c]const ngtcp2_cid) c_int;
pub extern fn ngtcp2_crypto_generate_retry_token(token: [*c]u8, secret: [*c]const u8, secretlen: usize, version: u32, remote_addr: [*c]const ngtcp2_sockaddr, remote_addrlen: ngtcp2_socklen, retry_scid: [*c]const ngtcp2_cid, odcid: [*c]const ngtcp2_cid, ts: ngtcp2_tstamp) ngtcp2_ssize;
pub extern fn ngtcp2_crypto_verify_retry_token(odcid: [*c]ngtcp2_cid, token: [*c]const u8, tokenlen: usize, secret: [*c]const u8, secretlen: usize, version: u32, remote_addr: [*c]const ngtcp2_sockaddr, remote_addrlen: ngtcp2_socklen, dcid: [*c]const ngtcp2_cid, timeout: ngtcp2_duration, ts: ngtcp2_tstamp) c_int;
pub extern fn ngtcp2_crypto_generate_retry_token2(token: [*c]u8, secret: [*c]const u8, secretlen: usize, version: u32, remote_addr: [*c]const ngtcp2_sockaddr, remote_addrlen: ngtcp2_socklen, retry_scid: [*c]const ngtcp2_cid, odcid: [*c]const ngtcp2_cid, ts: ngtcp2_tstamp) ngtcp2_ssize;
pub extern fn ngtcp2_crypto_verify_retry_token2(odcid: [*c]ngtcp2_cid, token: [*c]const u8, tokenlen: usize, secret: [*c]const u8, secretlen: usize, version: u32, remote_addr: [*c]const ngtcp2_sockaddr, remote_addrlen: ngtcp2_socklen, dcid: [*c]const ngtcp2_cid, timeout: ngtcp2_duration, ts: ngtcp2_tstamp) c_int;
pub extern fn ngtcp2_crypto_generate_regular_token(token: [*c]u8, secret: [*c]const u8, secretlen: usize, remote_addr: [*c]const ngtcp2_sockaddr, remote_addrlen: ngtcp2_socklen, ts: ngtcp2_tstamp) ngtcp2_ssize;
pub extern fn ngtcp2_crypto_verify_regular_token(token: [*c]const u8, tokenlen: usize, secret: [*c]const u8, secretlen: usize, remote_addr: [*c]const ngtcp2_sockaddr, remote_addrlen: ngtcp2_socklen, timeout: ngtcp2_duration, ts: ngtcp2_tstamp) c_int;
pub extern fn ngtcp2_crypto_write_connection_close(dest: [*c]u8, destlen: usize, version: u32, dcid: [*c]const ngtcp2_cid, scid: [*c]const ngtcp2_cid, error_code: u64, reason: [*c]const u8, reasonlen: usize) ngtcp2_ssize;
pub extern fn ngtcp2_crypto_write_retry(dest: [*c]u8, destlen: usize, version: u32, dcid: [*c]const ngtcp2_cid, scid: [*c]const ngtcp2_cid, odcid: [*c]const ngtcp2_cid, token: [*c]const u8, tokenlen: usize) ngtcp2_ssize;
pub extern fn ngtcp2_crypto_aead_ctx_encrypt_init(aead_ctx: [*c]ngtcp2_crypto_aead_ctx, aead: [*c]const ngtcp2_crypto_aead, key: [*c]const u8, noncelen: usize) c_int;
pub extern fn ngtcp2_crypto_aead_ctx_decrypt_init(aead_ctx: [*c]ngtcp2_crypto_aead_ctx, aead: [*c]const ngtcp2_crypto_aead, key: [*c]const u8, noncelen: usize) c_int;
pub extern fn ngtcp2_crypto_aead_ctx_free(aead_ctx: [*c]ngtcp2_crypto_aead_ctx) void;
pub extern fn ngtcp2_crypto_delete_crypto_aead_ctx_cb(conn: ?*ngtcp2_conn, aead_ctx: [*c]ngtcp2_crypto_aead_ctx, user_data: ?*anyopaque) void;
pub extern fn ngtcp2_crypto_delete_crypto_cipher_ctx_cb(conn: ?*ngtcp2_conn, cipher_ctx: [*c]ngtcp2_crypto_cipher_ctx, user_data: ?*anyopaque) void;
pub extern fn ngtcp2_crypto_get_path_challenge_data_cb(conn: ?*ngtcp2_conn, data: [*c]u8, user_data: ?*anyopaque) c_int;
pub extern fn ngtcp2_crypto_version_negotiation_cb(conn: ?*ngtcp2_conn, version: u32, client_dcid: [*c]const ngtcp2_cid, user_data: ?*anyopaque) c_int;
pub const ngtcp2_crypto_conn_ref = struct_ngtcp2_crypto_conn_ref;
pub const ngtcp2_crypto_get_conn = ?*const fn ([*c]ngtcp2_crypto_conn_ref) callconv(.c) ?*ngtcp2_conn;
pub const struct_ngtcp2_crypto_conn_ref = extern struct {
    get_conn: ngtcp2_crypto_get_conn = @import("std").mem.zeroes(ngtcp2_crypto_get_conn),
    user_data: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
};
pub const __llvm__ = @as(c_int, 1);
pub const __clang__ = @as(c_int, 1);
pub const __clang_major__ = @as(c_int, 19);
pub const __clang_minor__ = @as(c_int, 1);
pub const __clang_patchlevel__ = @as(c_int, 7);
pub const __clang_version__ = "19.1.7 (https://github.com/ziglang/zig-bootstrap de1b01a8c1dddf75a560123ac1c2ab182b4830da)";
pub const __GNUC__ = @as(c_int, 4);
pub const __GNUC_MINOR__ = @as(c_int, 2);
pub const __GNUC_PATCHLEVEL__ = @as(c_int, 1);
pub const __GXX_ABI_VERSION = @as(c_int, 1002);
pub const __ATOMIC_RELAXED = @as(c_int, 0);
pub const __ATOMIC_CONSUME = @as(c_int, 1);
pub const __ATOMIC_ACQUIRE = @as(c_int, 2);
pub const __ATOMIC_RELEASE = @as(c_int, 3);
pub const __ATOMIC_ACQ_REL = @as(c_int, 4);
pub const __ATOMIC_SEQ_CST = @as(c_int, 5);
pub const __MEMORY_SCOPE_SYSTEM = @as(c_int, 0);
pub const __MEMORY_SCOPE_DEVICE = @as(c_int, 1);
pub const __MEMORY_SCOPE_WRKGRP = @as(c_int, 2);
pub const __MEMORY_SCOPE_WVFRNT = @as(c_int, 3);
pub const __MEMORY_SCOPE_SINGLE = @as(c_int, 4);
pub const __OPENCL_MEMORY_SCOPE_WORK_ITEM = @as(c_int, 0);
pub const __OPENCL_MEMORY_SCOPE_WORK_GROUP = @as(c_int, 1);
pub const __OPENCL_MEMORY_SCOPE_DEVICE = @as(c_int, 2);
pub const __OPENCL_MEMORY_SCOPE_ALL_SVM_DEVICES = @as(c_int, 3);
pub const __OPENCL_MEMORY_SCOPE_SUB_GROUP = @as(c_int, 4);
pub const __FPCLASS_SNAN = @as(c_int, 0x0001);
pub const __FPCLASS_QNAN = @as(c_int, 0x0002);
pub const __FPCLASS_NEGINF = @as(c_int, 0x0004);
pub const __FPCLASS_NEGNORMAL = @as(c_int, 0x0008);
pub const __FPCLASS_NEGSUBNORMAL = @as(c_int, 0x0010);
pub const __FPCLASS_NEGZERO = @as(c_int, 0x0020);
pub const __FPCLASS_POSZERO = @as(c_int, 0x0040);
pub const __FPCLASS_POSSUBNORMAL = @as(c_int, 0x0080);
pub const __FPCLASS_POSNORMAL = @as(c_int, 0x0100);
pub const __FPCLASS_POSINF = @as(c_int, 0x0200);
pub const __PRAGMA_REDEFINE_EXTNAME = @as(c_int, 1);
pub const __VERSION__ = "Clang 19.1.7 (https://github.com/ziglang/zig-bootstrap de1b01a8c1dddf75a560123ac1c2ab182b4830da)";
pub const __OBJC_BOOL_IS_BOOL = @as(c_int, 0);
pub const __CONSTANT_CFSTRINGS__ = @as(c_int, 1);
pub const __clang_literal_encoding__ = "UTF-8";
pub const __clang_wide_literal_encoding__ = "UTF-32";
pub const __ORDER_LITTLE_ENDIAN__ = @as(c_int, 1234);
pub const __ORDER_BIG_ENDIAN__ = @as(c_int, 4321);
pub const __ORDER_PDP_ENDIAN__ = @as(c_int, 3412);
pub const __BYTE_ORDER__ = __ORDER_LITTLE_ENDIAN__;
pub const __LITTLE_ENDIAN__ = @as(c_int, 1);
pub const _LP64 = @as(c_int, 1);
pub const __LP64__ = @as(c_int, 1);
pub const __CHAR_BIT__ = @as(c_int, 8);
pub const __BOOL_WIDTH__ = @as(c_int, 8);
pub const __SHRT_WIDTH__ = @as(c_int, 16);
pub const __INT_WIDTH__ = @as(c_int, 32);
pub const __LONG_WIDTH__ = @as(c_int, 64);
pub const __LLONG_WIDTH__ = @as(c_int, 64);
pub const __BITINT_MAXWIDTH__ = @as(c_int, 128);
pub const __SCHAR_MAX__ = @as(c_int, 127);
pub const __SHRT_MAX__ = @as(c_int, 32767);
pub const __INT_MAX__ = @import("std").zig.c_translation.promoteIntLiteral(c_int, 2147483647, .decimal);
pub const __LONG_MAX__ = @import("std").zig.c_translation.promoteIntLiteral(c_long, 9223372036854775807, .decimal);
pub const __LONG_LONG_MAX__ = @as(c_longlong, 9223372036854775807);
pub const __WCHAR_MAX__ = @import("std").zig.c_translation.promoteIntLiteral(c_uint, 4294967295, .decimal);
pub const __WCHAR_WIDTH__ = @as(c_int, 32);
pub const __WINT_MAX__ = @import("std").zig.c_translation.promoteIntLiteral(c_uint, 4294967295, .decimal);
pub const __WINT_WIDTH__ = @as(c_int, 32);
pub const __INTMAX_MAX__ = @import("std").zig.c_translation.promoteIntLiteral(c_long, 9223372036854775807, .decimal);
pub const __INTMAX_WIDTH__ = @as(c_int, 64);
pub const __SIZE_MAX__ = @import("std").zig.c_translation.promoteIntLiteral(c_ulong, 18446744073709551615, .decimal);
pub const __SIZE_WIDTH__ = @as(c_int, 64);
pub const __UINTMAX_MAX__ = @import("std").zig.c_translation.promoteIntLiteral(c_ulong, 18446744073709551615, .decimal);
pub const __UINTMAX_WIDTH__ = @as(c_int, 64);
pub const __PTRDIFF_MAX__ = @import("std").zig.c_translation.promoteIntLiteral(c_long, 9223372036854775807, .decimal);
pub const __PTRDIFF_WIDTH__ = @as(c_int, 64);
pub const __INTPTR_MAX__ = @import("std").zig.c_translation.promoteIntLiteral(c_long, 9223372036854775807, .decimal);
pub const __INTPTR_WIDTH__ = @as(c_int, 64);
pub const __UINTPTR_MAX__ = @import("std").zig.c_translation.promoteIntLiteral(c_ulong, 18446744073709551615, .decimal);
pub const __UINTPTR_WIDTH__ = @as(c_int, 64);
pub const __SIZEOF_DOUBLE__ = @as(c_int, 8);
pub const __SIZEOF_FLOAT__ = @as(c_int, 4);
pub const __SIZEOF_INT__ = @as(c_int, 4);
pub const __SIZEOF_LONG__ = @as(c_int, 8);
pub const __SIZEOF_LONG_DOUBLE__ = @as(c_int, 16);
pub const __SIZEOF_LONG_LONG__ = @as(c_int, 8);
pub const __SIZEOF_POINTER__ = @as(c_int, 8);
pub const __SIZEOF_SHORT__ = @as(c_int, 2);
pub const __SIZEOF_PTRDIFF_T__ = @as(c_int, 8);
pub const __SIZEOF_SIZE_T__ = @as(c_int, 8);
pub const __SIZEOF_WCHAR_T__ = @as(c_int, 4);
pub const __SIZEOF_WINT_T__ = @as(c_int, 4);
pub const __SIZEOF_INT128__ = @as(c_int, 16);
pub const __INTMAX_TYPE__ = c_long;
pub const __INTMAX_FMTd__ = "ld";
pub const __INTMAX_FMTi__ = "li";
pub const __INTMAX_C_SUFFIX__ = @compileError("unable to translate macro: undefined identifier `L`");
// (no file):95:9
pub const __UINTMAX_TYPE__ = c_ulong;
pub const __UINTMAX_FMTo__ = "lo";
pub const __UINTMAX_FMTu__ = "lu";
pub const __UINTMAX_FMTx__ = "lx";
pub const __UINTMAX_FMTX__ = "lX";
pub const __UINTMAX_C_SUFFIX__ = @compileError("unable to translate macro: undefined identifier `UL`");
// (no file):101:9
pub const __PTRDIFF_TYPE__ = c_long;
pub const __PTRDIFF_FMTd__ = "ld";
pub const __PTRDIFF_FMTi__ = "li";
pub const __INTPTR_TYPE__ = c_long;
pub const __INTPTR_FMTd__ = "ld";
pub const __INTPTR_FMTi__ = "li";
pub const __SIZE_TYPE__ = c_ulong;
pub const __SIZE_FMTo__ = "lo";
pub const __SIZE_FMTu__ = "lu";
pub const __SIZE_FMTx__ = "lx";
pub const __SIZE_FMTX__ = "lX";
pub const __WCHAR_TYPE__ = c_uint;
pub const __WINT_TYPE__ = c_uint;
pub const __SIG_ATOMIC_MAX__ = @import("std").zig.c_translation.promoteIntLiteral(c_int, 2147483647, .decimal);
pub const __SIG_ATOMIC_WIDTH__ = @as(c_int, 32);
pub const __CHAR16_TYPE__ = c_ushort;
pub const __CHAR32_TYPE__ = c_uint;
pub const __UINTPTR_TYPE__ = c_ulong;
pub const __UINTPTR_FMTo__ = "lo";
pub const __UINTPTR_FMTu__ = "lu";
pub const __UINTPTR_FMTx__ = "lx";
pub const __UINTPTR_FMTX__ = "lX";
pub const __FLT16_DENORM_MIN__ = @as(f16, 5.9604644775390625e-8);
pub const __FLT16_NORM_MAX__ = @as(f16, 6.5504e+4);
pub const __FLT16_HAS_DENORM__ = @as(c_int, 1);
pub const __FLT16_DIG__ = @as(c_int, 3);
pub const __FLT16_DECIMAL_DIG__ = @as(c_int, 5);
pub const __FLT16_EPSILON__ = @as(f16, 9.765625e-4);
pub const __FLT16_HAS_INFINITY__ = @as(c_int, 1);
pub const __FLT16_HAS_QUIET_NAN__ = @as(c_int, 1);
pub const __FLT16_MANT_DIG__ = @as(c_int, 11);
pub const __FLT16_MAX_10_EXP__ = @as(c_int, 4);
pub const __FLT16_MAX_EXP__ = @as(c_int, 16);
pub const __FLT16_MAX__ = @as(f16, 6.5504e+4);
pub const __FLT16_MIN_10_EXP__ = -@as(c_int, 4);
pub const __FLT16_MIN_EXP__ = -@as(c_int, 13);
pub const __FLT16_MIN__ = @as(f16, 6.103515625e-5);
pub const __FLT_DENORM_MIN__ = @as(f32, 1.40129846e-45);
pub const __FLT_NORM_MAX__ = @as(f32, 3.40282347e+38);
pub const __FLT_HAS_DENORM__ = @as(c_int, 1);
pub const __FLT_DIG__ = @as(c_int, 6);
pub const __FLT_DECIMAL_DIG__ = @as(c_int, 9);
pub const __FLT_EPSILON__ = @as(f32, 1.19209290e-7);
pub const __FLT_HAS_INFINITY__ = @as(c_int, 1);
pub const __FLT_HAS_QUIET_NAN__ = @as(c_int, 1);
pub const __FLT_MANT_DIG__ = @as(c_int, 24);
pub const __FLT_MAX_10_EXP__ = @as(c_int, 38);
pub const __FLT_MAX_EXP__ = @as(c_int, 128);
pub const __FLT_MAX__ = @as(f32, 3.40282347e+38);
pub const __FLT_MIN_10_EXP__ = -@as(c_int, 37);
pub const __FLT_MIN_EXP__ = -@as(c_int, 125);
pub const __FLT_MIN__ = @as(f32, 1.17549435e-38);
pub const __DBL_DENORM_MIN__ = @as(f64, 4.9406564584124654e-324);
pub const __DBL_NORM_MAX__ = @as(f64, 1.7976931348623157e+308);
pub const __DBL_HAS_DENORM__ = @as(c_int, 1);
pub const __DBL_DIG__ = @as(c_int, 15);
pub const __DBL_DECIMAL_DIG__ = @as(c_int, 17);
pub const __DBL_EPSILON__ = @as(f64, 2.2204460492503131e-16);
pub const __DBL_HAS_INFINITY__ = @as(c_int, 1);
pub const __DBL_HAS_QUIET_NAN__ = @as(c_int, 1);
pub const __DBL_MANT_DIG__ = @as(c_int, 53);
pub const __DBL_MAX_10_EXP__ = @as(c_int, 308);
pub const __DBL_MAX_EXP__ = @as(c_int, 1024);
pub const __DBL_MAX__ = @as(f64, 1.7976931348623157e+308);
pub const __DBL_MIN_10_EXP__ = -@as(c_int, 307);
pub const __DBL_MIN_EXP__ = -@as(c_int, 1021);
pub const __DBL_MIN__ = @as(f64, 2.2250738585072014e-308);
pub const __LDBL_DENORM_MIN__ = @as(c_longdouble, 6.47517511943802511092443895822764655e-4966);
pub const __LDBL_NORM_MAX__ = @as(c_longdouble, 1.18973149535723176508575932662800702e+4932);
pub const __LDBL_HAS_DENORM__ = @as(c_int, 1);
pub const __LDBL_DIG__ = @as(c_int, 33);
pub const __LDBL_DECIMAL_DIG__ = @as(c_int, 36);
pub const __LDBL_EPSILON__ = @as(c_longdouble, 1.92592994438723585305597794258492732e-34);
pub const __LDBL_HAS_INFINITY__ = @as(c_int, 1);
pub const __LDBL_HAS_QUIET_NAN__ = @as(c_int, 1);
pub const __LDBL_MANT_DIG__ = @as(c_int, 113);
pub const __LDBL_MAX_10_EXP__ = @as(c_int, 4932);
pub const __LDBL_MAX_EXP__ = @as(c_int, 16384);
pub const __LDBL_MAX__ = @as(c_longdouble, 1.18973149535723176508575932662800702e+4932);
pub const __LDBL_MIN_10_EXP__ = -@as(c_int, 4931);
pub const __LDBL_MIN_EXP__ = -@as(c_int, 16381);
pub const __LDBL_MIN__ = @as(c_longdouble, 3.36210314311209350626267781732175260e-4932);
pub const __POINTER_WIDTH__ = @as(c_int, 64);
pub const __BIGGEST_ALIGNMENT__ = @as(c_int, 16);
pub const __CHAR_UNSIGNED__ = @as(c_int, 1);
pub const __WCHAR_UNSIGNED__ = @as(c_int, 1);
pub const __WINT_UNSIGNED__ = @as(c_int, 1);
pub const __INT8_TYPE__ = i8;
pub const __INT8_FMTd__ = "hhd";
pub const __INT8_FMTi__ = "hhi";
pub const __INT8_C_SUFFIX__ = "";
pub const __INT16_TYPE__ = c_short;
pub const __INT16_FMTd__ = "hd";
pub const __INT16_FMTi__ = "hi";
pub const __INT16_C_SUFFIX__ = "";
pub const __INT32_TYPE__ = c_int;
pub const __INT32_FMTd__ = "d";
pub const __INT32_FMTi__ = "i";
pub const __INT32_C_SUFFIX__ = "";
pub const __INT64_TYPE__ = c_long;
pub const __INT64_FMTd__ = "ld";
pub const __INT64_FMTi__ = "li";
pub const __INT64_C_SUFFIX__ = @compileError("unable to translate macro: undefined identifier `L`");
// (no file):204:9
pub const __UINT8_TYPE__ = u8;
pub const __UINT8_FMTo__ = "hho";
pub const __UINT8_FMTu__ = "hhu";
pub const __UINT8_FMTx__ = "hhx";
pub const __UINT8_FMTX__ = "hhX";
pub const __UINT8_C_SUFFIX__ = "";
pub const __UINT8_MAX__ = @as(c_int, 255);
pub const __INT8_MAX__ = @as(c_int, 127);
pub const __UINT16_TYPE__ = c_ushort;
pub const __UINT16_FMTo__ = "ho";
pub const __UINT16_FMTu__ = "hu";
pub const __UINT16_FMTx__ = "hx";
pub const __UINT16_FMTX__ = "hX";
pub const __UINT16_C_SUFFIX__ = "";
pub const __UINT16_MAX__ = @import("std").zig.c_translation.promoteIntLiteral(c_int, 65535, .decimal);
pub const __INT16_MAX__ = @as(c_int, 32767);
pub const __UINT32_TYPE__ = c_uint;
pub const __UINT32_FMTo__ = "o";
pub const __UINT32_FMTu__ = "u";
pub const __UINT32_FMTx__ = "x";
pub const __UINT32_FMTX__ = "X";
pub const __UINT32_C_SUFFIX__ = @compileError("unable to translate macro: undefined identifier `U`");
// (no file):226:9
pub const __UINT32_MAX__ = @import("std").zig.c_translation.promoteIntLiteral(c_uint, 4294967295, .decimal);
pub const __INT32_MAX__ = @import("std").zig.c_translation.promoteIntLiteral(c_int, 2147483647, .decimal);
pub const __UINT64_TYPE__ = c_ulong;
pub const __UINT64_FMTo__ = "lo";
pub const __UINT64_FMTu__ = "lu";
pub const __UINT64_FMTx__ = "lx";
pub const __UINT64_FMTX__ = "lX";
pub const __UINT64_C_SUFFIX__ = @compileError("unable to translate macro: undefined identifier `UL`");
// (no file):234:9
pub const __UINT64_MAX__ = @import("std").zig.c_translation.promoteIntLiteral(c_ulong, 18446744073709551615, .decimal);
pub const __INT64_MAX__ = @import("std").zig.c_translation.promoteIntLiteral(c_long, 9223372036854775807, .decimal);
pub const __INT_LEAST8_TYPE__ = i8;
pub const __INT_LEAST8_MAX__ = @as(c_int, 127);
pub const __INT_LEAST8_WIDTH__ = @as(c_int, 8);
pub const __INT_LEAST8_FMTd__ = "hhd";
pub const __INT_LEAST8_FMTi__ = "hhi";
pub const __UINT_LEAST8_TYPE__ = u8;
pub const __UINT_LEAST8_MAX__ = @as(c_int, 255);
pub const __UINT_LEAST8_FMTo__ = "hho";
pub const __UINT_LEAST8_FMTu__ = "hhu";
pub const __UINT_LEAST8_FMTx__ = "hhx";
pub const __UINT_LEAST8_FMTX__ = "hhX";
pub const __INT_LEAST16_TYPE__ = c_short;
pub const __INT_LEAST16_MAX__ = @as(c_int, 32767);
pub const __INT_LEAST16_WIDTH__ = @as(c_int, 16);
pub const __INT_LEAST16_FMTd__ = "hd";
pub const __INT_LEAST16_FMTi__ = "hi";
pub const __UINT_LEAST16_TYPE__ = c_ushort;
pub const __UINT_LEAST16_MAX__ = @import("std").zig.c_translation.promoteIntLiteral(c_int, 65535, .decimal);
pub const __UINT_LEAST16_FMTo__ = "ho";
pub const __UINT_LEAST16_FMTu__ = "hu";
pub const __UINT_LEAST16_FMTx__ = "hx";
pub const __UINT_LEAST16_FMTX__ = "hX";
pub const __INT_LEAST32_TYPE__ = c_int;
pub const __INT_LEAST32_MAX__ = @import("std").zig.c_translation.promoteIntLiteral(c_int, 2147483647, .decimal);
pub const __INT_LEAST32_WIDTH__ = @as(c_int, 32);
pub const __INT_LEAST32_FMTd__ = "d";
pub const __INT_LEAST32_FMTi__ = "i";
pub const __UINT_LEAST32_TYPE__ = c_uint;
pub const __UINT_LEAST32_MAX__ = @import("std").zig.c_translation.promoteIntLiteral(c_uint, 4294967295, .decimal);
pub const __UINT_LEAST32_FMTo__ = "o";
pub const __UINT_LEAST32_FMTu__ = "u";
pub const __UINT_LEAST32_FMTx__ = "x";
pub const __UINT_LEAST32_FMTX__ = "X";
pub const __INT_LEAST64_TYPE__ = c_long;
pub const __INT_LEAST64_MAX__ = @import("std").zig.c_translation.promoteIntLiteral(c_long, 9223372036854775807, .decimal);
pub const __INT_LEAST64_WIDTH__ = @as(c_int, 64);
pub const __INT_LEAST64_FMTd__ = "ld";
pub const __INT_LEAST64_FMTi__ = "li";
pub const __UINT_LEAST64_TYPE__ = c_ulong;
pub const __UINT_LEAST64_MAX__ = @import("std").zig.c_translation.promoteIntLiteral(c_ulong, 18446744073709551615, .decimal);
pub const __UINT_LEAST64_FMTo__ = "lo";
pub const __UINT_LEAST64_FMTu__ = "lu";
pub const __UINT_LEAST64_FMTx__ = "lx";
pub const __UINT_LEAST64_FMTX__ = "lX";
pub const __INT_FAST8_TYPE__ = i8;
pub const __INT_FAST8_MAX__ = @as(c_int, 127);
pub const __INT_FAST8_WIDTH__ = @as(c_int, 8);
pub const __INT_FAST8_FMTd__ = "hhd";
pub const __INT_FAST8_FMTi__ = "hhi";
pub const __UINT_FAST8_TYPE__ = u8;
pub const __UINT_FAST8_MAX__ = @as(c_int, 255);
pub const __UINT_FAST8_FMTo__ = "hho";
pub const __UINT_FAST8_FMTu__ = "hhu";
pub const __UINT_FAST8_FMTx__ = "hhx";
pub const __UINT_FAST8_FMTX__ = "hhX";
pub const __INT_FAST16_TYPE__ = c_short;
pub const __INT_FAST16_MAX__ = @as(c_int, 32767);
pub const __INT_FAST16_WIDTH__ = @as(c_int, 16);
pub const __INT_FAST16_FMTd__ = "hd";
pub const __INT_FAST16_FMTi__ = "hi";
pub const __UINT_FAST16_TYPE__ = c_ushort;
pub const __UINT_FAST16_MAX__ = @import("std").zig.c_translation.promoteIntLiteral(c_int, 65535, .decimal);
pub const __UINT_FAST16_FMTo__ = "ho";
pub const __UINT_FAST16_FMTu__ = "hu";
pub const __UINT_FAST16_FMTx__ = "hx";
pub const __UINT_FAST16_FMTX__ = "hX";
pub const __INT_FAST32_TYPE__ = c_int;
pub const __INT_FAST32_MAX__ = @import("std").zig.c_translation.promoteIntLiteral(c_int, 2147483647, .decimal);
pub const __INT_FAST32_WIDTH__ = @as(c_int, 32);
pub const __INT_FAST32_FMTd__ = "d";
pub const __INT_FAST32_FMTi__ = "i";
pub const __UINT_FAST32_TYPE__ = c_uint;
pub const __UINT_FAST32_MAX__ = @import("std").zig.c_translation.promoteIntLiteral(c_uint, 4294967295, .decimal);
pub const __UINT_FAST32_FMTo__ = "o";
pub const __UINT_FAST32_FMTu__ = "u";
pub const __UINT_FAST32_FMTx__ = "x";
pub const __UINT_FAST32_FMTX__ = "X";
pub const __INT_FAST64_TYPE__ = c_long;
pub const __INT_FAST64_MAX__ = @import("std").zig.c_translation.promoteIntLiteral(c_long, 9223372036854775807, .decimal);
pub const __INT_FAST64_WIDTH__ = @as(c_int, 64);
pub const __INT_FAST64_FMTd__ = "ld";
pub const __INT_FAST64_FMTi__ = "li";
pub const __UINT_FAST64_TYPE__ = c_ulong;
pub const __UINT_FAST64_MAX__ = @import("std").zig.c_translation.promoteIntLiteral(c_ulong, 18446744073709551615, .decimal);
pub const __UINT_FAST64_FMTo__ = "lo";
pub const __UINT_FAST64_FMTu__ = "lu";
pub const __UINT_FAST64_FMTx__ = "lx";
pub const __UINT_FAST64_FMTX__ = "lX";
pub const __USER_LABEL_PREFIX__ = "";
pub const __FINITE_MATH_ONLY__ = @as(c_int, 0);
pub const __GNUC_STDC_INLINE__ = @as(c_int, 1);
pub const __GCC_ATOMIC_TEST_AND_SET_TRUEVAL = @as(c_int, 1);
pub const __GCC_DESTRUCTIVE_SIZE = @as(c_int, 64);
pub const __GCC_CONSTRUCTIVE_SIZE = @as(c_int, 64);
pub const __CLANG_ATOMIC_BOOL_LOCK_FREE = @as(c_int, 2);
pub const __CLANG_ATOMIC_CHAR_LOCK_FREE = @as(c_int, 2);
pub const __CLANG_ATOMIC_CHAR16_T_LOCK_FREE = @as(c_int, 2);
pub const __CLANG_ATOMIC_CHAR32_T_LOCK_FREE = @as(c_int, 2);
pub const __CLANG_ATOMIC_WCHAR_T_LOCK_FREE = @as(c_int, 2);
pub const __CLANG_ATOMIC_SHORT_LOCK_FREE = @as(c_int, 2);
pub const __CLANG_ATOMIC_INT_LOCK_FREE = @as(c_int, 2);
pub const __CLANG_ATOMIC_LONG_LOCK_FREE = @as(c_int, 2);
pub const __CLANG_ATOMIC_LLONG_LOCK_FREE = @as(c_int, 2);
pub const __CLANG_ATOMIC_POINTER_LOCK_FREE = @as(c_int, 2);
pub const __GCC_ATOMIC_BOOL_LOCK_FREE = @as(c_int, 2);
pub const __GCC_ATOMIC_CHAR_LOCK_FREE = @as(c_int, 2);
pub const __GCC_ATOMIC_CHAR16_T_LOCK_FREE = @as(c_int, 2);
pub const __GCC_ATOMIC_CHAR32_T_LOCK_FREE = @as(c_int, 2);
pub const __GCC_ATOMIC_WCHAR_T_LOCK_FREE = @as(c_int, 2);
pub const __GCC_ATOMIC_SHORT_LOCK_FREE = @as(c_int, 2);
pub const __GCC_ATOMIC_INT_LOCK_FREE = @as(c_int, 2);
pub const __GCC_ATOMIC_LONG_LOCK_FREE = @as(c_int, 2);
pub const __GCC_ATOMIC_LLONG_LOCK_FREE = @as(c_int, 2);
pub const __GCC_ATOMIC_POINTER_LOCK_FREE = @as(c_int, 2);
pub const __NO_INLINE__ = @as(c_int, 1);
pub const __PIC__ = @as(c_int, 2);
pub const __pic__ = @as(c_int, 2);
pub const __FLT_RADIX__ = @as(c_int, 2);
pub const __DECIMAL_DIG__ = __LDBL_DECIMAL_DIG__;
pub const __SSP_STRONG__ = @as(c_int, 2);
pub const __ELF__ = @as(c_int, 1);
pub const __AARCH64EL__ = @as(c_int, 1);
pub const __aarch64__ = @as(c_int, 1);
pub const __GCC_ASM_FLAG_OUTPUTS__ = @as(c_int, 1);
pub const __AARCH64_CMODEL_SMALL__ = @as(c_int, 1);
pub const __ARM_ACLE = @as(c_int, 200);
pub const __ARM_ARCH = @as(c_int, 8);
pub const __ARM_ARCH_PROFILE = 'A';
pub const __ARM_64BIT_STATE = @as(c_int, 1);
pub const __ARM_PCS_AAPCS64 = @as(c_int, 1);
pub const __ARM_ARCH_ISA_A64 = @as(c_int, 1);
pub const __ARM_FEATURE_CLZ = @as(c_int, 1);
pub const __ARM_FEATURE_FMA = @as(c_int, 1);
pub const __ARM_FEATURE_LDREX = @as(c_int, 0xF);
pub const __ARM_FEATURE_IDIV = @as(c_int, 1);
pub const __ARM_FEATURE_DIV = @as(c_int, 1);
pub const __ARM_FEATURE_NUMERIC_MAXMIN = @as(c_int, 1);
pub const __ARM_FEATURE_DIRECTED_ROUNDING = @as(c_int, 1);
pub const __ARM_ALIGN_MAX_STACK_PWR = @as(c_int, 4);
pub const __ARM_STATE_ZA = @as(c_int, 1);
pub const __ARM_STATE_ZT0 = @as(c_int, 1);
pub const __ARM_FP = @as(c_int, 0xE);
pub const __ARM_FP16_FORMAT_IEEE = @as(c_int, 1);
pub const __ARM_FP16_ARGS = @as(c_int, 1);
pub const __ARM_SIZEOF_WCHAR_T = @as(c_int, 4);
pub const __ARM_SIZEOF_MINIMAL_ENUM = @as(c_int, 4);
pub const __ARM_NEON = @as(c_int, 1);
pub const __ARM_NEON_FP = @as(c_int, 0xE);
pub const __ARM_FEATURE_CRC32 = @as(c_int, 1);
pub const __ARM_FEATURE_RCPC = @as(c_int, 1);
pub const __ARM_FEATURE_CRYPTO = @as(c_int, 1);
pub const __ARM_FEATURE_AES = @as(c_int, 1);
pub const __ARM_FEATURE_SHA2 = @as(c_int, 1);
pub const __ARM_FEATURE_SHA3 = @as(c_int, 1);
pub const __ARM_FEATURE_SHA512 = @as(c_int, 1);
pub const __ARM_FEATURE_BTI = @as(c_int, 1);
pub const __ARM_FEATURE_UNALIGNED = @as(c_int, 1);
pub const __ARM_FEATURE_FP16_VECTOR_ARITHMETIC = @as(c_int, 1);
pub const __ARM_FEATURE_FP16_SCALAR_ARITHMETIC = @as(c_int, 1);
pub const __ARM_FEATURE_DOTPROD = @as(c_int, 1);
pub const __ARM_FEATURE_MATMUL_INT8 = @as(c_int, 1);
pub const __ARM_FEATURE_ATOMICS = @as(c_int, 1);
pub const __ARM_FEATURE_BF16 = @as(c_int, 1);
pub const __ARM_FEATURE_BF16_VECTOR_ARITHMETIC = @as(c_int, 1);
pub const __ARM_BF16_FORMAT_ALTERNATIVE = @as(c_int, 1);
pub const __ARM_FEATURE_BF16_SCALAR_ARITHMETIC = @as(c_int, 1);
pub const __ARM_FEATURE_FP16_FML = @as(c_int, 1);
pub const __ARM_FEATURE_RNG = @as(c_int, 1);
pub const __GCC_HAVE_SYNC_COMPARE_AND_SWAP_1 = @as(c_int, 1);
pub const __GCC_HAVE_SYNC_COMPARE_AND_SWAP_2 = @as(c_int, 1);
pub const __GCC_HAVE_SYNC_COMPARE_AND_SWAP_4 = @as(c_int, 1);
pub const __GCC_HAVE_SYNC_COMPARE_AND_SWAP_8 = @as(c_int, 1);
pub const __GCC_HAVE_SYNC_COMPARE_AND_SWAP_16 = @as(c_int, 1);
pub const __FP_FAST_FMA = @as(c_int, 1);
pub const __FP_FAST_FMAF = @as(c_int, 1);
pub const unix = @as(c_int, 1);
pub const __unix = @as(c_int, 1);
pub const __unix__ = @as(c_int, 1);
pub const linux = @as(c_int, 1);
pub const __linux = @as(c_int, 1);
pub const __linux__ = @as(c_int, 1);
pub const __gnu_linux__ = @as(c_int, 1);
pub const __STDC__ = @as(c_int, 1);
pub const __STDC_HOSTED__ = @as(c_int, 1);
pub const __STDC_VERSION__ = @as(c_long, 201710);
pub const __STDC_UTF_16__ = @as(c_int, 1);
pub const __STDC_UTF_32__ = @as(c_int, 1);
pub const __STDC_EMBED_NOT_FOUND__ = @as(c_int, 0);
pub const __STDC_EMBED_FOUND__ = @as(c_int, 1);
pub const __STDC_EMBED_EMPTY__ = @as(c_int, 2);
pub const _DEBUG = @as(c_int, 1);
pub const __GLIBC_MINOR__ = @as(c_int, 41);
pub const __GCC_HAVE_DWARF2_CFI_ASM = @as(c_int, 1);
pub const _SYS_SOCKET_H = @as(c_int, 1);
pub const _FEATURES_H = @as(c_int, 1);
pub const __KERNEL_STRICT_NAMES = "";
pub inline fn __GNUC_PREREQ(maj: anytype, min: anytype) @TypeOf(((__GNUC__ << @as(c_int, 16)) + __GNUC_MINOR__) >= ((maj << @as(c_int, 16)) + min)) {
    _ = &maj;
    _ = &min;
    return ((__GNUC__ << @as(c_int, 16)) + __GNUC_MINOR__) >= ((maj << @as(c_int, 16)) + min);
}
pub inline fn __glibc_clang_prereq(maj: anytype, min: anytype) @TypeOf(((__clang_major__ << @as(c_int, 16)) + __clang_minor__) >= ((maj << @as(c_int, 16)) + min)) {
    _ = &maj;
    _ = &min;
    return ((__clang_major__ << @as(c_int, 16)) + __clang_minor__) >= ((maj << @as(c_int, 16)) + min);
}
pub const __GLIBC_USE = @compileError("unable to translate macro: undefined identifier `__GLIBC_USE_`");
// /usr/include/features.h:191:9
pub const _DEFAULT_SOURCE = @as(c_int, 1);
pub const __GLIBC_USE_ISOC2Y = @as(c_int, 0);
pub const __GLIBC_USE_ISOC23 = @as(c_int, 0);
pub const __USE_ISOC11 = @as(c_int, 1);
pub const __USE_ISOC99 = @as(c_int, 1);
pub const __USE_ISOC95 = @as(c_int, 1);
pub const __USE_POSIX_IMPLICITLY = @as(c_int, 1);
pub const _POSIX_SOURCE = @as(c_int, 1);
pub const _POSIX_C_SOURCE = @as(c_long, 200809);
pub const __USE_POSIX = @as(c_int, 1);
pub const __USE_POSIX2 = @as(c_int, 1);
pub const __USE_POSIX199309 = @as(c_int, 1);
pub const __USE_POSIX199506 = @as(c_int, 1);
pub const __USE_XOPEN2K = @as(c_int, 1);
pub const __USE_XOPEN2K8 = @as(c_int, 1);
pub const _ATFILE_SOURCE = @as(c_int, 1);
pub const __WORDSIZE = @as(c_int, 64);
pub const __WORDSIZE_TIME64_COMPAT32 = @as(c_int, 0);
pub const __TIMESIZE = @as(c_int, 64);
pub const __USE_TIME_BITS64 = @as(c_int, 1);
pub const __USE_MISC = @as(c_int, 1);
pub const __USE_ATFILE = @as(c_int, 1);
pub const __USE_FORTIFY_LEVEL = @as(c_int, 0);
pub const __GLIBC_USE_DEPRECATED_GETS = @as(c_int, 0);
pub const __GLIBC_USE_DEPRECATED_SCANF = @as(c_int, 0);
pub const __GLIBC_USE_C23_STRTOL = @as(c_int, 0);
pub const _STDC_PREDEF_H = @as(c_int, 1);
pub const __STDC_IEC_559__ = @as(c_int, 1);
pub const __STDC_IEC_60559_BFP__ = @as(c_long, 201404);
pub const __STDC_IEC_559_COMPLEX__ = @as(c_int, 1);
pub const __STDC_IEC_60559_COMPLEX__ = @as(c_long, 201404);
pub const __STDC_ISO_10646__ = @as(c_long, 201706);
pub const __GNU_LIBRARY__ = @as(c_int, 6);
pub const __GLIBC__ = @as(c_int, 2);
pub inline fn __GLIBC_PREREQ(maj: anytype, min: anytype) @TypeOf(((__GLIBC__ << @as(c_int, 16)) + __GLIBC_MINOR__) >= ((maj << @as(c_int, 16)) + min)) {
    _ = &maj;
    _ = &min;
    return ((__GLIBC__ << @as(c_int, 16)) + __GLIBC_MINOR__) >= ((maj << @as(c_int, 16)) + min);
}
pub const _SYS_CDEFS_H = @as(c_int, 1);
pub const __glibc_has_attribute = @compileError("unable to translate macro: undefined identifier `__has_attribute`");
// /usr/include/aarch64-linux-gnu/sys/cdefs.h:45:10
pub inline fn __glibc_has_builtin(name: anytype) @TypeOf(__has_builtin(name)) {
    _ = &name;
    return __has_builtin(name);
}
pub const __glibc_has_extension = @compileError("unable to translate macro: undefined identifier `__has_extension`");
// /usr/include/aarch64-linux-gnu/sys/cdefs.h:55:10
pub const __LEAF = "";
pub const __LEAF_ATTR = "";
pub const __THROW = @compileError("unable to translate macro: undefined identifier `__nothrow__`");
// /usr/include/aarch64-linux-gnu/sys/cdefs.h:79:11
pub const __THROWNL = @compileError("unable to translate macro: undefined identifier `__nothrow__`");
// /usr/include/aarch64-linux-gnu/sys/cdefs.h:80:11
pub const __NTH = @compileError("unable to translate macro: undefined identifier `__nothrow__`");
// /usr/include/aarch64-linux-gnu/sys/cdefs.h:81:11
pub const __NTHNL = @compileError("unable to translate macro: undefined identifier `__nothrow__`");
// /usr/include/aarch64-linux-gnu/sys/cdefs.h:82:11
pub const __COLD = @compileError("unable to translate macro: undefined identifier `__cold__`");
// /usr/include/aarch64-linux-gnu/sys/cdefs.h:102:11
pub inline fn __P(args: anytype) @TypeOf(args) {
    _ = &args;
    return args;
}
pub inline fn __PMT(args: anytype) @TypeOf(args) {
    _ = &args;
    return args;
}
pub const __CONCAT = @compileError("unable to translate C expr: unexpected token '##'");
// /usr/include/aarch64-linux-gnu/sys/cdefs.h:131:9
pub const __STRING = @compileError("unable to translate C expr: unexpected token '#'");
// /usr/include/aarch64-linux-gnu/sys/cdefs.h:132:9
pub const __ptr_t = ?*anyopaque;
pub const __BEGIN_DECLS = "";
pub const __END_DECLS = "";
pub const __attribute_overloadable__ = @compileError("unable to translate macro: undefined identifier `__overloadable__`");
// /usr/include/aarch64-linux-gnu/sys/cdefs.h:151:10
pub inline fn __bos(ptr: anytype) @TypeOf(__builtin_object_size(ptr, __USE_FORTIFY_LEVEL > @as(c_int, 1))) {
    _ = &ptr;
    return __builtin_object_size(ptr, __USE_FORTIFY_LEVEL > @as(c_int, 1));
}
pub inline fn __bos0(ptr: anytype) @TypeOf(__builtin_object_size(ptr, @as(c_int, 0))) {
    _ = &ptr;
    return __builtin_object_size(ptr, @as(c_int, 0));
}
pub inline fn __glibc_objsize0(__o: anytype) @TypeOf(__bos0(__o)) {
    _ = &__o;
    return __bos0(__o);
}
pub inline fn __glibc_objsize(__o: anytype) @TypeOf(__bos(__o)) {
    _ = &__o;
    return __bos(__o);
}
pub const __warnattr = @compileError("unable to translate C expr: unexpected token ''");
// /usr/include/aarch64-linux-gnu/sys/cdefs.h:370:10
pub const __errordecl = @compileError("unable to translate C expr: unexpected token 'extern'");
// /usr/include/aarch64-linux-gnu/sys/cdefs.h:371:10
pub const __flexarr = @compileError("unable to translate C expr: unexpected token '['");
// /usr/include/aarch64-linux-gnu/sys/cdefs.h:379:10
pub const __glibc_c99_flexarr_available = @as(c_int, 1);
pub const __REDIRECT = @compileError("unable to translate C expr: unexpected token '__asm__'");
// /usr/include/aarch64-linux-gnu/sys/cdefs.h:410:10
pub const __REDIRECT_NTH = @compileError("unable to translate C expr: unexpected token '__asm__'");
// /usr/include/aarch64-linux-gnu/sys/cdefs.h:417:11
pub const __REDIRECT_NTHNL = @compileError("unable to translate C expr: unexpected token '__asm__'");
// /usr/include/aarch64-linux-gnu/sys/cdefs.h:419:11
pub const __ASMNAME = @compileError("unable to translate C expr: unexpected token ','");
// /usr/include/aarch64-linux-gnu/sys/cdefs.h:422:10
pub inline fn __ASMNAME2(prefix: anytype, cname: anytype) @TypeOf(__STRING(prefix) ++ cname) {
    _ = &prefix;
    _ = &cname;
    return __STRING(prefix) ++ cname;
}
pub const __REDIRECT_FORTIFY = __REDIRECT;
pub const __REDIRECT_FORTIFY_NTH = __REDIRECT_NTH;
pub const __attribute_malloc__ = @compileError("unable to translate macro: undefined identifier `__malloc__`");
// /usr/include/aarch64-linux-gnu/sys/cdefs.h:452:10
pub const __attribute_alloc_size__ = @compileError("unable to translate C expr: unexpected token ''");
// /usr/include/aarch64-linux-gnu/sys/cdefs.h:463:10
pub const __attribute_alloc_align__ = @compileError("unable to translate macro: undefined identifier `__alloc_align__`");
// /usr/include/aarch64-linux-gnu/sys/cdefs.h:469:10
pub const __attribute_pure__ = @compileError("unable to translate macro: undefined identifier `__pure__`");
// /usr/include/aarch64-linux-gnu/sys/cdefs.h:479:10
pub const __attribute_const__ = @compileError("unable to translate C expr: unexpected token '__attribute__'");
// /usr/include/aarch64-linux-gnu/sys/cdefs.h:486:10
pub const __attribute_maybe_unused__ = @compileError("unable to translate macro: undefined identifier `__unused__`");
// /usr/include/aarch64-linux-gnu/sys/cdefs.h:492:10
pub const __attribute_used__ = @compileError("unable to translate macro: undefined identifier `__used__`");
// /usr/include/aarch64-linux-gnu/sys/cdefs.h:501:10
pub const __attribute_noinline__ = @compileError("unable to translate macro: undefined identifier `__noinline__`");
// /usr/include/aarch64-linux-gnu/sys/cdefs.h:502:10
pub const __attribute_deprecated__ = @compileError("unable to translate macro: undefined identifier `__deprecated__`");
// /usr/include/aarch64-linux-gnu/sys/cdefs.h:510:10
pub const __attribute_deprecated_msg__ = @compileError("unable to translate macro: undefined identifier `__deprecated__`");
// /usr/include/aarch64-linux-gnu/sys/cdefs.h:520:10
pub const __attribute_format_arg__ = @compileError("unable to translate macro: undefined identifier `__format_arg__`");
// /usr/include/aarch64-linux-gnu/sys/cdefs.h:533:10
pub const __attribute_format_strfmon__ = @compileError("unable to translate macro: undefined identifier `__format__`");
// /usr/include/aarch64-linux-gnu/sys/cdefs.h:543:10
pub const __attribute_nonnull__ = @compileError("unable to translate macro: undefined identifier `__nonnull__`");
// /usr/include/aarch64-linux-gnu/sys/cdefs.h:555:11
pub inline fn __nonnull(params: anytype) @TypeOf(__attribute_nonnull__(params)) {
    _ = &params;
    return __attribute_nonnull__(params);
}
pub const __returns_nonnull = @compileError("unable to translate macro: undefined identifier `__returns_nonnull__`");
// /usr/include/aarch64-linux-gnu/sys/cdefs.h:568:10
pub const __attribute_warn_unused_result__ = @compileError("unable to translate macro: undefined identifier `__warn_unused_result__`");
// /usr/include/aarch64-linux-gnu/sys/cdefs.h:577:10
pub const __wur = "";
pub const __always_inline = @compileError("unable to translate macro: undefined identifier `__always_inline__`");
// /usr/include/aarch64-linux-gnu/sys/cdefs.h:595:10
pub const __attribute_artificial__ = @compileError("unable to translate macro: undefined identifier `__artificial__`");
// /usr/include/aarch64-linux-gnu/sys/cdefs.h:604:10
pub const __extern_inline = @compileError("unable to translate macro: undefined identifier `__gnu_inline__`");
// /usr/include/aarch64-linux-gnu/sys/cdefs.h:622:11
pub const __extern_always_inline = @compileError("unable to translate macro: undefined identifier `__gnu_inline__`");
// /usr/include/aarch64-linux-gnu/sys/cdefs.h:623:11
pub const __fortify_function = __extern_always_inline ++ __attribute_artificial__;
pub const __restrict_arr = @compileError("unable to translate C expr: unexpected token '__restrict'");
// /usr/include/aarch64-linux-gnu/sys/cdefs.h:666:10
pub inline fn __glibc_unlikely(cond: anytype) @TypeOf(__builtin_expect(cond, @as(c_int, 0))) {
    _ = &cond;
    return __builtin_expect(cond, @as(c_int, 0));
}
pub inline fn __glibc_likely(cond: anytype) @TypeOf(__builtin_expect(cond, @as(c_int, 1))) {
    _ = &cond;
    return __builtin_expect(cond, @as(c_int, 1));
}
pub const __attribute_nonstring__ = "";
pub const __attribute_copy__ = @compileError("unable to translate C expr: unexpected token ''");
// /usr/include/aarch64-linux-gnu/sys/cdefs.h:715:10
pub const __LDOUBLE_REDIRECTS_TO_FLOAT128_ABI = @as(c_int, 0);
pub inline fn __LDBL_REDIR1(name: anytype, proto: anytype, alias: anytype) @TypeOf(name ++ proto) {
    _ = &name;
    _ = &proto;
    _ = &alias;
    return name ++ proto;
}
pub inline fn __LDBL_REDIR(name: anytype, proto: anytype) @TypeOf(name ++ proto) {
    _ = &name;
    _ = &proto;
    return name ++ proto;
}
pub inline fn __LDBL_REDIR1_NTH(name: anytype, proto: anytype, alias: anytype) @TypeOf(name ++ proto ++ __THROW) {
    _ = &name;
    _ = &proto;
    _ = &alias;
    return name ++ proto ++ __THROW;
}
pub inline fn __LDBL_REDIR_NTH(name: anytype, proto: anytype) @TypeOf(name ++ proto ++ __THROW) {
    _ = &name;
    _ = &proto;
    return name ++ proto ++ __THROW;
}
pub const __LDBL_REDIR2_DECL = @compileError("unable to translate C expr: unexpected token ''");
// /usr/include/aarch64-linux-gnu/sys/cdefs.h:792:10
pub const __LDBL_REDIR_DECL = @compileError("unable to translate C expr: unexpected token ''");
// /usr/include/aarch64-linux-gnu/sys/cdefs.h:793:10
pub inline fn __REDIRECT_LDBL(name: anytype, proto: anytype, alias: anytype) @TypeOf(__REDIRECT(name, proto, alias)) {
    _ = &name;
    _ = &proto;
    _ = &alias;
    return __REDIRECT(name, proto, alias);
}
pub inline fn __REDIRECT_NTH_LDBL(name: anytype, proto: anytype, alias: anytype) @TypeOf(__REDIRECT_NTH(name, proto, alias)) {
    _ = &name;
    _ = &proto;
    _ = &alias;
    return __REDIRECT_NTH(name, proto, alias);
}
pub const __glibc_macro_warning1 = @compileError("unable to translate macro: undefined identifier `_Pragma`");
// /usr/include/aarch64-linux-gnu/sys/cdefs.h:807:10
pub const __glibc_macro_warning = @compileError("unable to translate macro: undefined identifier `GCC`");
// /usr/include/aarch64-linux-gnu/sys/cdefs.h:808:10
pub const __HAVE_GENERIC_SELECTION = @as(c_int, 1);
pub const __fortified_attr_access = @compileError("unable to translate C expr: unexpected token ''");
// /usr/include/aarch64-linux-gnu/sys/cdefs.h:853:11
pub const __attr_access = @compileError("unable to translate C expr: unexpected token ''");
// /usr/include/aarch64-linux-gnu/sys/cdefs.h:854:11
pub const __attr_access_none = @compileError("unable to translate C expr: unexpected token ''");
// /usr/include/aarch64-linux-gnu/sys/cdefs.h:855:11
pub const __attr_dealloc = @compileError("unable to translate C expr: unexpected token ''");
// /usr/include/aarch64-linux-gnu/sys/cdefs.h:865:10
pub const __attr_dealloc_free = "";
pub const __attribute_returns_twice__ = @compileError("unable to translate macro: undefined identifier `__returns_twice__`");
// /usr/include/aarch64-linux-gnu/sys/cdefs.h:872:10
pub const __attribute_struct_may_alias__ = @compileError("unable to translate macro: undefined identifier `__may_alias__`");
// /usr/include/aarch64-linux-gnu/sys/cdefs.h:881:10
pub const __stub___compat_bdflush = "";
pub const __stub___compat_create_module = "";
pub const __stub___compat_get_kernel_syms = "";
pub const __stub___compat_query_module = "";
pub const __stub___compat_uselib = "";
pub const __stub_chflags = "";
pub const __stub_fchflags = "";
pub const __stub_gtty = "";
pub const __stub_revoke = "";
pub const __stub_setlogin = "";
pub const __stub_sigreturn = "";
pub const __stub_stty = "";
pub const __iovec_defined = @as(c_int, 1);
pub const __need_size_t = "";
pub const _SIZE_T = "";
pub const __BITS_SOCKET_H = "";
pub const _SYS_TYPES_H = @as(c_int, 1);
pub const _BITS_TYPES_H = @as(c_int, 1);
pub const __S16_TYPE = c_short;
pub const __U16_TYPE = c_ushort;
pub const __S32_TYPE = c_int;
pub const __U32_TYPE = c_uint;
pub const __SLONGWORD_TYPE = c_long;
pub const __ULONGWORD_TYPE = c_ulong;
pub const __SQUAD_TYPE = c_long;
pub const __UQUAD_TYPE = c_ulong;
pub const __SWORD_TYPE = c_long;
pub const __UWORD_TYPE = c_ulong;
pub const __SLONG32_TYPE = c_int;
pub const __ULONG32_TYPE = c_uint;
pub const __S64_TYPE = c_long;
pub const __U64_TYPE = c_ulong;
pub const __STD_TYPE = @compileError("unable to translate C expr: unexpected token 'typedef'");
// /usr/include/aarch64-linux-gnu/bits/types.h:137:10
pub const _BITS_TYPESIZES_H = @as(c_int, 1);
pub const __INO_T_TYPE = __ULONGWORD_TYPE;
pub const __OFF_T_TYPE = __SLONGWORD_TYPE;
pub const __RLIM_T_TYPE = __ULONGWORD_TYPE;
pub const __BLKCNT_T_TYPE = __SLONGWORD_TYPE;
pub const __FSBLKCNT_T_TYPE = __ULONGWORD_TYPE;
pub const __FSFILCNT_T_TYPE = __ULONGWORD_TYPE;
pub const __TIME_T_TYPE = __SLONGWORD_TYPE;
pub const __SUSECONDS_T_TYPE = __SLONGWORD_TYPE;
pub const __DEV_T_TYPE = __UQUAD_TYPE;
pub const __UID_T_TYPE = __U32_TYPE;
pub const __GID_T_TYPE = __U32_TYPE;
pub const __INO64_T_TYPE = __UQUAD_TYPE;
pub const __MODE_T_TYPE = __U32_TYPE;
pub const __NLINK_T_TYPE = __U32_TYPE;
pub const __OFF64_T_TYPE = __SQUAD_TYPE;
pub const __PID_T_TYPE = __S32_TYPE;
pub const __RLIM64_T_TYPE = __UQUAD_TYPE;
pub const __BLKCNT64_T_TYPE = __SQUAD_TYPE;
pub const __FSBLKCNT64_T_TYPE = __UQUAD_TYPE;
pub const __FSFILCNT64_T_TYPE = __UQUAD_TYPE;
pub const __FSWORD_T_TYPE = __SWORD_TYPE;
pub const __ID_T_TYPE = __U32_TYPE;
pub const __CLOCK_T_TYPE = __SLONGWORD_TYPE;
pub const __USECONDS_T_TYPE = __U32_TYPE;
pub const __SUSECONDS64_T_TYPE = __SQUAD_TYPE;
pub const __DADDR_T_TYPE = __S32_TYPE;
pub const __KEY_T_TYPE = __S32_TYPE;
pub const __CLOCKID_T_TYPE = __S32_TYPE;
pub const __TIMER_T_TYPE = ?*anyopaque;
pub const __BLKSIZE_T_TYPE = __S32_TYPE;
pub const __FSID_T_TYPE = @compileError("unable to translate macro: undefined identifier `__val`");
// /usr/include/aarch64-linux-gnu/bits/typesizes.h:72:9
pub const __SSIZE_T_TYPE = __SWORD_TYPE;
pub const __SYSCALL_SLONG_TYPE = __SLONGWORD_TYPE;
pub const __SYSCALL_ULONG_TYPE = __ULONGWORD_TYPE;
pub const __CPU_MASK_TYPE = __ULONGWORD_TYPE;
pub const __OFF_T_MATCHES_OFF64_T = @as(c_int, 1);
pub const __INO_T_MATCHES_INO64_T = @as(c_int, 1);
pub const __RLIM_T_MATCHES_RLIM64_T = @as(c_int, 1);
pub const __STATFS_MATCHES_STATFS64 = @as(c_int, 1);
pub const __KERNEL_OLD_TIMEVAL_MATCHES_TIMEVAL64 = __WORDSIZE == @as(c_int, 64);
pub const __FD_SETSIZE = @as(c_int, 1024);
pub const _BITS_TIME64_H = @as(c_int, 1);
pub const __TIME64_T_TYPE = __TIME_T_TYPE;
pub const __u_char_defined = "";
pub const __ino_t_defined = "";
pub const __dev_t_defined = "";
pub const __gid_t_defined = "";
pub const __mode_t_defined = "";
pub const __nlink_t_defined = "";
pub const __uid_t_defined = "";
pub const __off_t_defined = "";
pub const __pid_t_defined = "";
pub const __id_t_defined = "";
pub const __ssize_t_defined = "";
pub const __daddr_t_defined = "";
pub const __key_t_defined = "";
pub const __clock_t_defined = @as(c_int, 1);
pub const __clockid_t_defined = @as(c_int, 1);
pub const __time_t_defined = @as(c_int, 1);
pub const __timer_t_defined = @as(c_int, 1);
pub const _BITS_STDINT_INTN_H = @as(c_int, 1);
pub const __BIT_TYPES_DEFINED__ = @as(c_int, 1);
pub const _ENDIAN_H = @as(c_int, 1);
pub const _BITS_ENDIAN_H = @as(c_int, 1);
pub const __LITTLE_ENDIAN = @as(c_int, 1234);
pub const __BIG_ENDIAN = @as(c_int, 4321);
pub const __PDP_ENDIAN = @as(c_int, 3412);
pub const _BITS_ENDIANNESS_H = @as(c_int, 1);
pub const __BYTE_ORDER = __LITTLE_ENDIAN;
pub const __FLOAT_WORD_ORDER = __BYTE_ORDER;
pub inline fn __LONG_LONG_PAIR(HI: anytype, LO: anytype) @TypeOf(HI) {
    _ = &HI;
    _ = &LO;
    return blk: {
        _ = &LO;
        break :blk HI;
    };
}
pub const LITTLE_ENDIAN = __LITTLE_ENDIAN;
pub const BIG_ENDIAN = __BIG_ENDIAN;
pub const PDP_ENDIAN = __PDP_ENDIAN;
pub const BYTE_ORDER = __BYTE_ORDER;
pub const _BITS_BYTESWAP_H = @as(c_int, 1);
pub inline fn __bswap_constant_16(x: anytype) __uint16_t {
    _ = &x;
    return @import("std").zig.c_translation.cast(__uint16_t, ((x >> @as(c_int, 8)) & @as(c_int, 0xff)) | ((x & @as(c_int, 0xff)) << @as(c_int, 8)));
}
pub inline fn __bswap_constant_32(x: anytype) @TypeOf(((((x & @import("std").zig.c_translation.promoteIntLiteral(c_uint, 0xff000000, .hex)) >> @as(c_int, 24)) | ((x & @import("std").zig.c_translation.promoteIntLiteral(c_uint, 0x00ff0000, .hex)) >> @as(c_int, 8))) | ((x & @as(c_uint, 0x0000ff00)) << @as(c_int, 8))) | ((x & @as(c_uint, 0x000000ff)) << @as(c_int, 24))) {
    _ = &x;
    return ((((x & @import("std").zig.c_translation.promoteIntLiteral(c_uint, 0xff000000, .hex)) >> @as(c_int, 24)) | ((x & @import("std").zig.c_translation.promoteIntLiteral(c_uint, 0x00ff0000, .hex)) >> @as(c_int, 8))) | ((x & @as(c_uint, 0x0000ff00)) << @as(c_int, 8))) | ((x & @as(c_uint, 0x000000ff)) << @as(c_int, 24));
}
pub inline fn __bswap_constant_64(x: anytype) @TypeOf(((((((((x & @as(c_ulonglong, 0xff00000000000000)) >> @as(c_int, 56)) | ((x & @as(c_ulonglong, 0x00ff000000000000)) >> @as(c_int, 40))) | ((x & @as(c_ulonglong, 0x0000ff0000000000)) >> @as(c_int, 24))) | ((x & @as(c_ulonglong, 0x000000ff00000000)) >> @as(c_int, 8))) | ((x & @as(c_ulonglong, 0x00000000ff000000)) << @as(c_int, 8))) | ((x & @as(c_ulonglong, 0x0000000000ff0000)) << @as(c_int, 24))) | ((x & @as(c_ulonglong, 0x000000000000ff00)) << @as(c_int, 40))) | ((x & @as(c_ulonglong, 0x00000000000000ff)) << @as(c_int, 56))) {
    _ = &x;
    return ((((((((x & @as(c_ulonglong, 0xff00000000000000)) >> @as(c_int, 56)) | ((x & @as(c_ulonglong, 0x00ff000000000000)) >> @as(c_int, 40))) | ((x & @as(c_ulonglong, 0x0000ff0000000000)) >> @as(c_int, 24))) | ((x & @as(c_ulonglong, 0x000000ff00000000)) >> @as(c_int, 8))) | ((x & @as(c_ulonglong, 0x00000000ff000000)) << @as(c_int, 8))) | ((x & @as(c_ulonglong, 0x0000000000ff0000)) << @as(c_int, 24))) | ((x & @as(c_ulonglong, 0x000000000000ff00)) << @as(c_int, 40))) | ((x & @as(c_ulonglong, 0x00000000000000ff)) << @as(c_int, 56));
}
pub const _BITS_UINTN_IDENTITY_H = @as(c_int, 1);
pub inline fn htobe16(x: anytype) @TypeOf(__bswap_16(x)) {
    _ = &x;
    return __bswap_16(x);
}
pub inline fn htole16(x: anytype) @TypeOf(__uint16_identity(x)) {
    _ = &x;
    return __uint16_identity(x);
}
pub inline fn be16toh(x: anytype) @TypeOf(__bswap_16(x)) {
    _ = &x;
    return __bswap_16(x);
}
pub inline fn le16toh(x: anytype) @TypeOf(__uint16_identity(x)) {
    _ = &x;
    return __uint16_identity(x);
}
pub inline fn htobe32(x: anytype) @TypeOf(__bswap_32(x)) {
    _ = &x;
    return __bswap_32(x);
}
pub inline fn htole32(x: anytype) @TypeOf(__uint32_identity(x)) {
    _ = &x;
    return __uint32_identity(x);
}
pub inline fn be32toh(x: anytype) @TypeOf(__bswap_32(x)) {
    _ = &x;
    return __bswap_32(x);
}
pub inline fn le32toh(x: anytype) @TypeOf(__uint32_identity(x)) {
    _ = &x;
    return __uint32_identity(x);
}
pub inline fn htobe64(x: anytype) @TypeOf(__bswap_64(x)) {
    _ = &x;
    return __bswap_64(x);
}
pub inline fn htole64(x: anytype) @TypeOf(__uint64_identity(x)) {
    _ = &x;
    return __uint64_identity(x);
}
pub inline fn be64toh(x: anytype) @TypeOf(__bswap_64(x)) {
    _ = &x;
    return __bswap_64(x);
}
pub inline fn le64toh(x: anytype) @TypeOf(__uint64_identity(x)) {
    _ = &x;
    return __uint64_identity(x);
}
pub const _SYS_SELECT_H = @as(c_int, 1);
pub const __FD_ZERO = @compileError("unable to translate macro: undefined identifier `__i`");
// /usr/include/aarch64-linux-gnu/bits/select.h:25:9
pub const __FD_SET = @compileError("unable to translate C expr: expected ')' instead got '|='");
// /usr/include/aarch64-linux-gnu/bits/select.h:32:9
pub const __FD_CLR = @compileError("unable to translate C expr: expected ')' instead got '&='");
// /usr/include/aarch64-linux-gnu/bits/select.h:34:9
pub inline fn __FD_ISSET(d: anytype, s: anytype) @TypeOf((__FDS_BITS(s)[@as(usize, @intCast(__FD_ELT(d)))] & __FD_MASK(d)) != @as(c_int, 0)) {
    _ = &d;
    _ = &s;
    return (__FDS_BITS(s)[@as(usize, @intCast(__FD_ELT(d)))] & __FD_MASK(d)) != @as(c_int, 0);
}
pub const __sigset_t_defined = @as(c_int, 1);
pub const ____sigset_t_defined = "";
pub const _SIGSET_NWORDS = @import("std").zig.c_translation.MacroArithmetic.div(@as(c_int, 1024), @as(c_int, 8) * @import("std").zig.c_translation.sizeof(c_ulong));
pub const __timeval_defined = @as(c_int, 1);
pub const _STRUCT_TIMESPEC = @as(c_int, 1);
pub const __suseconds_t_defined = "";
pub const __NFDBITS = @as(c_int, 8) * @import("std").zig.c_translation.cast(c_int, @import("std").zig.c_translation.sizeof(__fd_mask));
pub inline fn __FD_ELT(d: anytype) @TypeOf(@import("std").zig.c_translation.MacroArithmetic.div(d, __NFDBITS)) {
    _ = &d;
    return @import("std").zig.c_translation.MacroArithmetic.div(d, __NFDBITS);
}
pub inline fn __FD_MASK(d: anytype) __fd_mask {
    _ = &d;
    return @import("std").zig.c_translation.cast(__fd_mask, @as(c_ulong, 1) << @import("std").zig.c_translation.MacroArithmetic.rem(d, __NFDBITS));
}
pub inline fn __FDS_BITS(set: anytype) @TypeOf(set.*.__fds_bits) {
    _ = &set;
    return set.*.__fds_bits;
}
pub const FD_SETSIZE = __FD_SETSIZE;
pub const NFDBITS = __NFDBITS;
pub inline fn FD_SET(fd: anytype, fdsetp: anytype) @TypeOf(__FD_SET(fd, fdsetp)) {
    _ = &fd;
    _ = &fdsetp;
    return __FD_SET(fd, fdsetp);
}
pub inline fn FD_CLR(fd: anytype, fdsetp: anytype) @TypeOf(__FD_CLR(fd, fdsetp)) {
    _ = &fd;
    _ = &fdsetp;
    return __FD_CLR(fd, fdsetp);
}
pub inline fn FD_ISSET(fd: anytype, fdsetp: anytype) @TypeOf(__FD_ISSET(fd, fdsetp)) {
    _ = &fd;
    _ = &fdsetp;
    return __FD_ISSET(fd, fdsetp);
}
pub inline fn FD_ZERO(fdsetp: anytype) @TypeOf(__FD_ZERO(fdsetp)) {
    _ = &fdsetp;
    return __FD_ZERO(fdsetp);
}
pub const __blksize_t_defined = "";
pub const __blkcnt_t_defined = "";
pub const __fsblkcnt_t_defined = "";
pub const __fsfilcnt_t_defined = "";
pub const _BITS_PTHREADTYPES_COMMON_H = @as(c_int, 1);
pub const _THREAD_SHARED_TYPES_H = @as(c_int, 1);
pub const _BITS_PTHREADTYPES_ARCH_H = @as(c_int, 1);
pub const __SIZEOF_PTHREAD_ATTR_T = @as(c_int, 64);
pub const __SIZEOF_PTHREAD_MUTEX_T = @as(c_int, 48);
pub const __SIZEOF_PTHREAD_MUTEXATTR_T = @as(c_int, 8);
pub const __SIZEOF_PTHREAD_CONDATTR_T = @as(c_int, 8);
pub const __SIZEOF_PTHREAD_RWLOCK_T = @as(c_int, 56);
pub const __SIZEOF_PTHREAD_BARRIER_T = @as(c_int, 32);
pub const __SIZEOF_PTHREAD_BARRIERATTR_T = @as(c_int, 8);
pub const __SIZEOF_PTHREAD_COND_T = @as(c_int, 48);
pub const __SIZEOF_PTHREAD_RWLOCKATTR_T = @as(c_int, 8);
pub const __LOCK_ALIGNMENT = "";
pub const __ONCE_ALIGNMENT = "";
pub const _BITS_ATOMIC_WIDE_COUNTER_H = "";
pub const _THREAD_MUTEX_INTERNAL_H = @as(c_int, 1);
pub const __PTHREAD_MUTEX_HAVE_PREV = @as(c_int, 1);
pub const __PTHREAD_MUTEX_INITIALIZER = @compileError("unable to translate C expr: unexpected token '{'");
// /usr/include/aarch64-linux-gnu/bits/struct_mutex.h:77:10
pub const _RWLOCK_INTERNAL_H = "";
pub inline fn __PTHREAD_RWLOCK_INITIALIZER(__flags: anytype) @TypeOf(__flags) {
    _ = &__flags;
    return blk: {
        _ = @as(c_int, 0);
        _ = @as(c_int, 0);
        _ = @as(c_int, 0);
        _ = @as(c_int, 0);
        _ = @as(c_int, 0);
        _ = @as(c_int, 0);
        _ = @as(c_int, 0);
        _ = @as(c_int, 0);
        _ = @as(c_int, 0);
        _ = @as(c_int, 0);
        break :blk __flags;
    };
}
pub const __ONCE_FLAG_INIT = @compileError("unable to translate C expr: unexpected token '{'");
// /usr/include/aarch64-linux-gnu/bits/thread-shared-types.h:114:9
pub const __have_pthread_attr_t = @as(c_int, 1);
pub const __socklen_t_defined = "";
pub const PF_UNSPEC = @as(c_int, 0);
pub const PF_LOCAL = @as(c_int, 1);
pub const PF_UNIX = PF_LOCAL;
pub const PF_FILE = PF_LOCAL;
pub const PF_INET = @as(c_int, 2);
pub const PF_AX25 = @as(c_int, 3);
pub const PF_IPX = @as(c_int, 4);
pub const PF_APPLETALK = @as(c_int, 5);
pub const PF_NETROM = @as(c_int, 6);
pub const PF_BRIDGE = @as(c_int, 7);
pub const PF_ATMPVC = @as(c_int, 8);
pub const PF_X25 = @as(c_int, 9);
pub const PF_INET6 = @as(c_int, 10);
pub const PF_ROSE = @as(c_int, 11);
pub const PF_DECnet = @as(c_int, 12);
pub const PF_NETBEUI = @as(c_int, 13);
pub const PF_SECURITY = @as(c_int, 14);
pub const PF_KEY = @as(c_int, 15);
pub const PF_NETLINK = @as(c_int, 16);
pub const PF_ROUTE = PF_NETLINK;
pub const PF_PACKET = @as(c_int, 17);
pub const PF_ASH = @as(c_int, 18);
pub const PF_ECONET = @as(c_int, 19);
pub const PF_ATMSVC = @as(c_int, 20);
pub const PF_RDS = @as(c_int, 21);
pub const PF_SNA = @as(c_int, 22);
pub const PF_IRDA = @as(c_int, 23);
pub const PF_PPPOX = @as(c_int, 24);
pub const PF_WANPIPE = @as(c_int, 25);
pub const PF_LLC = @as(c_int, 26);
pub const PF_IB = @as(c_int, 27);
pub const PF_MPLS = @as(c_int, 28);
pub const PF_CAN = @as(c_int, 29);
pub const PF_TIPC = @as(c_int, 30);
pub const PF_BLUETOOTH = @as(c_int, 31);
pub const PF_IUCV = @as(c_int, 32);
pub const PF_RXRPC = @as(c_int, 33);
pub const PF_ISDN = @as(c_int, 34);
pub const PF_PHONET = @as(c_int, 35);
pub const PF_IEEE802154 = @as(c_int, 36);
pub const PF_CAIF = @as(c_int, 37);
pub const PF_ALG = @as(c_int, 38);
pub const PF_NFC = @as(c_int, 39);
pub const PF_VSOCK = @as(c_int, 40);
pub const PF_KCM = @as(c_int, 41);
pub const PF_QIPCRTR = @as(c_int, 42);
pub const PF_SMC = @as(c_int, 43);
pub const PF_XDP = @as(c_int, 44);
pub const PF_MCTP = @as(c_int, 45);
pub const PF_MAX = @as(c_int, 46);
pub const AF_UNSPEC = PF_UNSPEC;
pub const AF_LOCAL = PF_LOCAL;
pub const AF_UNIX = PF_UNIX;
pub const AF_FILE = PF_FILE;
pub const AF_INET = PF_INET;
pub const AF_AX25 = PF_AX25;
pub const AF_IPX = PF_IPX;
pub const AF_APPLETALK = PF_APPLETALK;
pub const AF_NETROM = PF_NETROM;
pub const AF_BRIDGE = PF_BRIDGE;
pub const AF_ATMPVC = PF_ATMPVC;
pub const AF_X25 = PF_X25;
pub const AF_INET6 = PF_INET6;
pub const AF_ROSE = PF_ROSE;
pub const AF_DECnet = PF_DECnet;
pub const AF_NETBEUI = PF_NETBEUI;
pub const AF_SECURITY = PF_SECURITY;
pub const AF_KEY = PF_KEY;
pub const AF_NETLINK = PF_NETLINK;
pub const AF_ROUTE = PF_ROUTE;
pub const AF_PACKET = PF_PACKET;
pub const AF_ASH = PF_ASH;
pub const AF_ECONET = PF_ECONET;
pub const AF_ATMSVC = PF_ATMSVC;
pub const AF_RDS = PF_RDS;
pub const AF_SNA = PF_SNA;
pub const AF_IRDA = PF_IRDA;
pub const AF_PPPOX = PF_PPPOX;
pub const AF_WANPIPE = PF_WANPIPE;
pub const AF_LLC = PF_LLC;
pub const AF_IB = PF_IB;
pub const AF_MPLS = PF_MPLS;
pub const AF_CAN = PF_CAN;
pub const AF_TIPC = PF_TIPC;
pub const AF_BLUETOOTH = PF_BLUETOOTH;
pub const AF_IUCV = PF_IUCV;
pub const AF_RXRPC = PF_RXRPC;
pub const AF_ISDN = PF_ISDN;
pub const AF_PHONET = PF_PHONET;
pub const AF_IEEE802154 = PF_IEEE802154;
pub const AF_CAIF = PF_CAIF;
pub const AF_ALG = PF_ALG;
pub const AF_NFC = PF_NFC;
pub const AF_VSOCK = PF_VSOCK;
pub const AF_KCM = PF_KCM;
pub const AF_QIPCRTR = PF_QIPCRTR;
pub const AF_SMC = PF_SMC;
pub const AF_XDP = PF_XDP;
pub const AF_MCTP = PF_MCTP;
pub const AF_MAX = PF_MAX;
pub const SOL_RAW = @as(c_int, 255);
pub const SOL_DECNET = @as(c_int, 261);
pub const SOL_X25 = @as(c_int, 262);
pub const SOL_PACKET = @as(c_int, 263);
pub const SOL_ATM = @as(c_int, 264);
pub const SOL_AAL = @as(c_int, 265);
pub const SOL_IRDA = @as(c_int, 266);
pub const SOL_NETBEUI = @as(c_int, 267);
pub const SOL_LLC = @as(c_int, 268);
pub const SOL_DCCP = @as(c_int, 269);
pub const SOL_NETLINK = @as(c_int, 270);
pub const SOL_TIPC = @as(c_int, 271);
pub const SOL_RXRPC = @as(c_int, 272);
pub const SOL_PPPOL2TP = @as(c_int, 273);
pub const SOL_BLUETOOTH = @as(c_int, 274);
pub const SOL_PNPIPE = @as(c_int, 275);
pub const SOL_RDS = @as(c_int, 276);
pub const SOL_IUCV = @as(c_int, 277);
pub const SOL_CAIF = @as(c_int, 278);
pub const SOL_ALG = @as(c_int, 279);
pub const SOL_NFC = @as(c_int, 280);
pub const SOL_KCM = @as(c_int, 281);
pub const SOL_TLS = @as(c_int, 282);
pub const SOL_XDP = @as(c_int, 283);
pub const SOL_MPTCP = @as(c_int, 284);
pub const SOL_MCTP = @as(c_int, 285);
pub const SOL_SMC = @as(c_int, 286);
pub const SOL_VSOCK = @as(c_int, 287);
pub const SOMAXCONN = @as(c_int, 4096);
pub const _BITS_SOCKADDR_H = @as(c_int, 1);
pub const __SOCKADDR_COMMON = @compileError("unable to translate macro: undefined identifier `family`");
// /usr/include/aarch64-linux-gnu/bits/sockaddr.h:34:9
pub const __SOCKADDR_COMMON_SIZE = @import("std").zig.c_translation.sizeof(c_ushort);
pub const _SS_SIZE = @as(c_int, 128);
pub const __ss_aligntype = c_ulong;
pub const _SS_PADSIZE = (_SS_SIZE - __SOCKADDR_COMMON_SIZE) - @import("std").zig.c_translation.sizeof(__ss_aligntype);
pub inline fn CMSG_DATA(cmsg: anytype) @TypeOf(cmsg.*.__cmsg_data) {
    _ = &cmsg;
    return cmsg.*.__cmsg_data;
}
pub inline fn CMSG_NXTHDR(mhdr: anytype, cmsg: anytype) @TypeOf(__cmsg_nxthdr(mhdr, cmsg)) {
    _ = &mhdr;
    _ = &cmsg;
    return __cmsg_nxthdr(mhdr, cmsg);
}
pub inline fn CMSG_FIRSTHDR(mhdr: anytype) @TypeOf(if (@import("std").zig.c_translation.cast(usize, mhdr.*.msg_controllen) >= @import("std").zig.c_translation.sizeof(struct_cmsghdr)) @import("std").zig.c_translation.cast([*c]struct_cmsghdr, mhdr.*.msg_control) else @import("std").zig.c_translation.cast([*c]struct_cmsghdr, @as(c_int, 0))) {
    _ = &mhdr;
    return if (@import("std").zig.c_translation.cast(usize, mhdr.*.msg_controllen) >= @import("std").zig.c_translation.sizeof(struct_cmsghdr)) @import("std").zig.c_translation.cast([*c]struct_cmsghdr, mhdr.*.msg_control) else @import("std").zig.c_translation.cast([*c]struct_cmsghdr, @as(c_int, 0));
}
pub inline fn CMSG_ALIGN(len: anytype) @TypeOf(((len + @import("std").zig.c_translation.sizeof(usize)) - @as(c_int, 1)) & @import("std").zig.c_translation.cast(usize, ~(@import("std").zig.c_translation.sizeof(usize) - @as(c_int, 1)))) {
    _ = &len;
    return ((len + @import("std").zig.c_translation.sizeof(usize)) - @as(c_int, 1)) & @import("std").zig.c_translation.cast(usize, ~(@import("std").zig.c_translation.sizeof(usize) - @as(c_int, 1)));
}
pub inline fn CMSG_SPACE(len: anytype) @TypeOf(CMSG_ALIGN(len) + CMSG_ALIGN(@import("std").zig.c_translation.sizeof(struct_cmsghdr))) {
    _ = &len;
    return CMSG_ALIGN(len) + CMSG_ALIGN(@import("std").zig.c_translation.sizeof(struct_cmsghdr));
}
pub inline fn CMSG_LEN(len: anytype) @TypeOf(CMSG_ALIGN(@import("std").zig.c_translation.sizeof(struct_cmsghdr)) + len) {
    _ = &len;
    return CMSG_ALIGN(@import("std").zig.c_translation.sizeof(struct_cmsghdr)) + len;
}
pub inline fn __CMSG_PADDING(len: anytype) @TypeOf((@import("std").zig.c_translation.sizeof(usize) - (len & (@import("std").zig.c_translation.sizeof(usize) - @as(c_int, 1)))) & (@import("std").zig.c_translation.sizeof(usize) - @as(c_int, 1))) {
    _ = &len;
    return (@import("std").zig.c_translation.sizeof(usize) - (len & (@import("std").zig.c_translation.sizeof(usize) - @as(c_int, 1)))) & (@import("std").zig.c_translation.sizeof(usize) - @as(c_int, 1));
}
pub const __ASM_GENERIC_SOCKET_H = "";
pub const _LINUX_POSIX_TYPES_H = "";
pub const _LINUX_STDDEF_H = "";
pub inline fn __struct_group_tag(TAG: anytype) @TypeOf(TAG) {
    _ = &TAG;
    return TAG;
}
pub const __struct_group = @compileError("unable to translate C expr: expected ')' instead got '...'");
// /usr/include/linux/stddef.h:33:9
pub const __DECLARE_FLEX_ARRAY = @compileError("unable to translate macro: undefined identifier `__empty_`");
// /usr/include/linux/stddef.h:54:9
pub const __counted_by = @compileError("unable to translate C expr: unexpected token ''");
// /usr/include/linux/stddef.h:62:9
pub const __counted_by_le = @compileError("unable to translate C expr: unexpected token ''");
// /usr/include/linux/stddef.h:66:9
pub const __counted_by_be = @compileError("unable to translate C expr: unexpected token ''");
// /usr/include/linux/stddef.h:70:9
pub const __ASM_POSIX_TYPES_H = "";
pub const __ASM_GENERIC_POSIX_TYPES_H = "";
pub const __ASM_BITSPERLONG_H = "";
pub const __BITS_PER_LONG = @as(c_int, 64);
pub const __ASM_GENERIC_BITS_PER_LONG = "";
pub const __BITS_PER_LONG_LONG = @as(c_int, 64);
pub const __ASM_GENERIC_SOCKIOS_H = "";
pub const FIOSETOWN = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8901, .hex);
pub const SIOCSPGRP = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8902, .hex);
pub const FIOGETOWN = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8903, .hex);
pub const SIOCGPGRP = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8904, .hex);
pub const SIOCATMARK = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8905, .hex);
pub const SIOCGSTAMP_OLD = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8906, .hex);
pub const SIOCGSTAMPNS_OLD = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8907, .hex);
pub const SOL_SOCKET = @as(c_int, 1);
pub const SO_DEBUG = @as(c_int, 1);
pub const SO_REUSEADDR = @as(c_int, 2);
pub const SO_TYPE = @as(c_int, 3);
pub const SO_ERROR = @as(c_int, 4);
pub const SO_DONTROUTE = @as(c_int, 5);
pub const SO_BROADCAST = @as(c_int, 6);
pub const SO_SNDBUF = @as(c_int, 7);
pub const SO_RCVBUF = @as(c_int, 8);
pub const SO_SNDBUFFORCE = @as(c_int, 32);
pub const SO_RCVBUFFORCE = @as(c_int, 33);
pub const SO_KEEPALIVE = @as(c_int, 9);
pub const SO_OOBINLINE = @as(c_int, 10);
pub const SO_NO_CHECK = @as(c_int, 11);
pub const SO_PRIORITY = @as(c_int, 12);
pub const SO_LINGER = @as(c_int, 13);
pub const SO_BSDCOMPAT = @as(c_int, 14);
pub const SO_REUSEPORT = @as(c_int, 15);
pub const SO_PASSCRED = @as(c_int, 16);
pub const SO_PEERCRED = @as(c_int, 17);
pub const SO_RCVLOWAT = @as(c_int, 18);
pub const SO_SNDLOWAT = @as(c_int, 19);
pub const SO_RCVTIMEO_OLD = @as(c_int, 20);
pub const SO_SNDTIMEO_OLD = @as(c_int, 21);
pub const SO_SECURITY_AUTHENTICATION = @as(c_int, 22);
pub const SO_SECURITY_ENCRYPTION_TRANSPORT = @as(c_int, 23);
pub const SO_SECURITY_ENCRYPTION_NETWORK = @as(c_int, 24);
pub const SO_BINDTODEVICE = @as(c_int, 25);
pub const SO_ATTACH_FILTER = @as(c_int, 26);
pub const SO_DETACH_FILTER = @as(c_int, 27);
pub const SO_GET_FILTER = SO_ATTACH_FILTER;
pub const SO_PEERNAME = @as(c_int, 28);
pub const SO_ACCEPTCONN = @as(c_int, 30);
pub const SO_PEERSEC = @as(c_int, 31);
pub const SO_PASSSEC = @as(c_int, 34);
pub const SO_MARK = @as(c_int, 36);
pub const SO_PROTOCOL = @as(c_int, 38);
pub const SO_DOMAIN = @as(c_int, 39);
pub const SO_RXQ_OVFL = @as(c_int, 40);
pub const SO_WIFI_STATUS = @as(c_int, 41);
pub const SCM_WIFI_STATUS = SO_WIFI_STATUS;
pub const SO_PEEK_OFF = @as(c_int, 42);
pub const SO_NOFCS = @as(c_int, 43);
pub const SO_LOCK_FILTER = @as(c_int, 44);
pub const SO_SELECT_ERR_QUEUE = @as(c_int, 45);
pub const SO_BUSY_POLL = @as(c_int, 46);
pub const SO_MAX_PACING_RATE = @as(c_int, 47);
pub const SO_BPF_EXTENSIONS = @as(c_int, 48);
pub const SO_INCOMING_CPU = @as(c_int, 49);
pub const SO_ATTACH_BPF = @as(c_int, 50);
pub const SO_DETACH_BPF = SO_DETACH_FILTER;
pub const SO_ATTACH_REUSEPORT_CBPF = @as(c_int, 51);
pub const SO_ATTACH_REUSEPORT_EBPF = @as(c_int, 52);
pub const SO_CNX_ADVICE = @as(c_int, 53);
pub const SCM_TIMESTAMPING_OPT_STATS = @as(c_int, 54);
pub const SO_MEMINFO = @as(c_int, 55);
pub const SO_INCOMING_NAPI_ID = @as(c_int, 56);
pub const SO_COOKIE = @as(c_int, 57);
pub const SCM_TIMESTAMPING_PKTINFO = @as(c_int, 58);
pub const SO_PEERGROUPS = @as(c_int, 59);
pub const SO_ZEROCOPY = @as(c_int, 60);
pub const SO_TXTIME = @as(c_int, 61);
pub const SCM_TXTIME = SO_TXTIME;
pub const SO_BINDTOIFINDEX = @as(c_int, 62);
pub const SO_TIMESTAMP_OLD = @as(c_int, 29);
pub const SO_TIMESTAMPNS_OLD = @as(c_int, 35);
pub const SO_TIMESTAMPING_OLD = @as(c_int, 37);
pub const SO_TIMESTAMP_NEW = @as(c_int, 63);
pub const SO_TIMESTAMPNS_NEW = @as(c_int, 64);
pub const SO_TIMESTAMPING_NEW = @as(c_int, 65);
pub const SO_RCVTIMEO_NEW = @as(c_int, 66);
pub const SO_SNDTIMEO_NEW = @as(c_int, 67);
pub const SO_DETACH_REUSEPORT_BPF = @as(c_int, 68);
pub const SO_PREFER_BUSY_POLL = @as(c_int, 69);
pub const SO_BUSY_POLL_BUDGET = @as(c_int, 70);
pub const SO_NETNS_COOKIE = @as(c_int, 71);
pub const SO_BUF_LOCK = @as(c_int, 72);
pub const SO_RESERVE_MEM = @as(c_int, 73);
pub const SO_TXREHASH = @as(c_int, 74);
pub const SO_RCVMARK = @as(c_int, 75);
pub const SO_PASSPIDFD = @as(c_int, 76);
pub const SO_PEERPIDFD = @as(c_int, 77);
pub const SO_DEVMEM_LINEAR = @as(c_int, 78);
pub const SCM_DEVMEM_LINEAR = SO_DEVMEM_LINEAR;
pub const SO_DEVMEM_DMABUF = @as(c_int, 79);
pub const SCM_DEVMEM_DMABUF = SO_DEVMEM_DMABUF;
pub const SO_DEVMEM_DONTNEED = @as(c_int, 80);
pub const SO_TIMESTAMP = SO_TIMESTAMP_OLD;
pub const SO_TIMESTAMPNS = SO_TIMESTAMPNS_OLD;
pub const SO_TIMESTAMPING = SO_TIMESTAMPING_OLD;
pub const SO_RCVTIMEO = SO_RCVTIMEO_OLD;
pub const SO_SNDTIMEO = SO_SNDTIMEO_OLD;
pub const SCM_TIMESTAMP = SO_TIMESTAMP;
pub const SCM_TIMESTAMPNS = SO_TIMESTAMPNS;
pub const SCM_TIMESTAMPING = SO_TIMESTAMPING;
pub const __osockaddr_defined = @as(c_int, 1);
pub const __SOCKADDR_ARG = @compileError("unable to translate C expr: unexpected token '__restrict'");
// /usr/include/aarch64-linux-gnu/sys/socket.h:58:10
pub const __CONST_SOCKADDR_ARG = @compileError("unable to translate C expr: unexpected token 'const'");
// /usr/include/aarch64-linux-gnu/sys/socket.h:59:10
pub const _SYS_EPOLL_H = @as(c_int, 1);
pub const __CLANG_STDINT_H = "";
pub const _STDINT_H = @as(c_int, 1);
pub const __GLIBC_INTERNAL_STARTING_HEADER_IMPLEMENTATION = "";
pub const __GLIBC_USE_LIB_EXT2 = @as(c_int, 0);
pub const __GLIBC_USE_IEC_60559_BFP_EXT = @as(c_int, 0);
pub const __GLIBC_USE_IEC_60559_BFP_EXT_C23 = @as(c_int, 0);
pub const __GLIBC_USE_IEC_60559_EXT = @as(c_int, 0);
pub const __GLIBC_USE_IEC_60559_FUNCS_EXT = @as(c_int, 0);
pub const __GLIBC_USE_IEC_60559_FUNCS_EXT_C23 = @as(c_int, 0);
pub const __GLIBC_USE_IEC_60559_TYPES_EXT = @as(c_int, 0);
pub const _BITS_WCHAR_H = @as(c_int, 1);
pub const __WCHAR_MAX = __WCHAR_MAX__;
pub const __WCHAR_MIN = '\x00' + @as(c_int, 0);
pub const _BITS_STDINT_UINTN_H = @as(c_int, 1);
pub const _BITS_STDINT_LEAST_H = @as(c_int, 1);
pub const __intptr_t_defined = "";
pub const __INT64_C = @import("std").zig.c_translation.Macros.L_SUFFIX;
pub const __UINT64_C = @import("std").zig.c_translation.Macros.UL_SUFFIX;
pub const INT8_MIN = -@as(c_int, 128);
pub const INT16_MIN = -@as(c_int, 32767) - @as(c_int, 1);
pub const INT32_MIN = -@import("std").zig.c_translation.promoteIntLiteral(c_int, 2147483647, .decimal) - @as(c_int, 1);
pub const INT64_MIN = -__INT64_C(@import("std").zig.c_translation.promoteIntLiteral(c_int, 9223372036854775807, .decimal)) - @as(c_int, 1);
pub const INT8_MAX = @as(c_int, 127);
pub const INT16_MAX = @as(c_int, 32767);
pub const INT32_MAX = @import("std").zig.c_translation.promoteIntLiteral(c_int, 2147483647, .decimal);
pub const INT64_MAX = __INT64_C(@import("std").zig.c_translation.promoteIntLiteral(c_int, 9223372036854775807, .decimal));
pub const UINT8_MAX = @as(c_int, 255);
pub const UINT16_MAX = @import("std").zig.c_translation.promoteIntLiteral(c_int, 65535, .decimal);
pub const UINT32_MAX = @import("std").zig.c_translation.promoteIntLiteral(c_uint, 4294967295, .decimal);
pub const UINT64_MAX = __UINT64_C(@import("std").zig.c_translation.promoteIntLiteral(c_int, 18446744073709551615, .decimal));
pub const INT_LEAST8_MIN = -@as(c_int, 128);
pub const INT_LEAST16_MIN = -@as(c_int, 32767) - @as(c_int, 1);
pub const INT_LEAST32_MIN = -@import("std").zig.c_translation.promoteIntLiteral(c_int, 2147483647, .decimal) - @as(c_int, 1);
pub const INT_LEAST64_MIN = -__INT64_C(@import("std").zig.c_translation.promoteIntLiteral(c_int, 9223372036854775807, .decimal)) - @as(c_int, 1);
pub const INT_LEAST8_MAX = @as(c_int, 127);
pub const INT_LEAST16_MAX = @as(c_int, 32767);
pub const INT_LEAST32_MAX = @import("std").zig.c_translation.promoteIntLiteral(c_int, 2147483647, .decimal);
pub const INT_LEAST64_MAX = __INT64_C(@import("std").zig.c_translation.promoteIntLiteral(c_int, 9223372036854775807, .decimal));
pub const UINT_LEAST8_MAX = @as(c_int, 255);
pub const UINT_LEAST16_MAX = @import("std").zig.c_translation.promoteIntLiteral(c_int, 65535, .decimal);
pub const UINT_LEAST32_MAX = @import("std").zig.c_translation.promoteIntLiteral(c_uint, 4294967295, .decimal);
pub const UINT_LEAST64_MAX = __UINT64_C(@import("std").zig.c_translation.promoteIntLiteral(c_int, 18446744073709551615, .decimal));
pub const INT_FAST8_MIN = -@as(c_int, 128);
pub const INT_FAST16_MIN = -@import("std").zig.c_translation.promoteIntLiteral(c_long, 9223372036854775807, .decimal) - @as(c_int, 1);
pub const INT_FAST32_MIN = -@import("std").zig.c_translation.promoteIntLiteral(c_long, 9223372036854775807, .decimal) - @as(c_int, 1);
pub const INT_FAST64_MIN = -__INT64_C(@import("std").zig.c_translation.promoteIntLiteral(c_int, 9223372036854775807, .decimal)) - @as(c_int, 1);
pub const INT_FAST8_MAX = @as(c_int, 127);
pub const INT_FAST16_MAX = @import("std").zig.c_translation.promoteIntLiteral(c_long, 9223372036854775807, .decimal);
pub const INT_FAST32_MAX = @import("std").zig.c_translation.promoteIntLiteral(c_long, 9223372036854775807, .decimal);
pub const INT_FAST64_MAX = __INT64_C(@import("std").zig.c_translation.promoteIntLiteral(c_int, 9223372036854775807, .decimal));
pub const UINT_FAST8_MAX = @as(c_int, 255);
pub const UINT_FAST16_MAX = @import("std").zig.c_translation.promoteIntLiteral(c_ulong, 18446744073709551615, .decimal);
pub const UINT_FAST32_MAX = @import("std").zig.c_translation.promoteIntLiteral(c_ulong, 18446744073709551615, .decimal);
pub const UINT_FAST64_MAX = __UINT64_C(@import("std").zig.c_translation.promoteIntLiteral(c_int, 18446744073709551615, .decimal));
pub const INTPTR_MIN = -@import("std").zig.c_translation.promoteIntLiteral(c_long, 9223372036854775807, .decimal) - @as(c_int, 1);
pub const INTPTR_MAX = @import("std").zig.c_translation.promoteIntLiteral(c_long, 9223372036854775807, .decimal);
pub const UINTPTR_MAX = @import("std").zig.c_translation.promoteIntLiteral(c_ulong, 18446744073709551615, .decimal);
pub const INTMAX_MIN = -__INT64_C(@import("std").zig.c_translation.promoteIntLiteral(c_int, 9223372036854775807, .decimal)) - @as(c_int, 1);
pub const INTMAX_MAX = __INT64_C(@import("std").zig.c_translation.promoteIntLiteral(c_int, 9223372036854775807, .decimal));
pub const UINTMAX_MAX = __UINT64_C(@import("std").zig.c_translation.promoteIntLiteral(c_int, 18446744073709551615, .decimal));
pub const PTRDIFF_MIN = -@import("std").zig.c_translation.promoteIntLiteral(c_long, 9223372036854775807, .decimal) - @as(c_int, 1);
pub const PTRDIFF_MAX = @import("std").zig.c_translation.promoteIntLiteral(c_long, 9223372036854775807, .decimal);
pub const SIG_ATOMIC_MIN = -@import("std").zig.c_translation.promoteIntLiteral(c_int, 2147483647, .decimal) - @as(c_int, 1);
pub const SIG_ATOMIC_MAX = @import("std").zig.c_translation.promoteIntLiteral(c_int, 2147483647, .decimal);
pub const SIZE_MAX = @import("std").zig.c_translation.promoteIntLiteral(c_ulong, 18446744073709551615, .decimal);
pub const WCHAR_MIN = __WCHAR_MIN;
pub const WCHAR_MAX = __WCHAR_MAX;
pub const WINT_MIN = @as(c_uint, 0);
pub const WINT_MAX = @import("std").zig.c_translation.promoteIntLiteral(c_uint, 4294967295, .decimal);
pub inline fn INT8_C(c: anytype) @TypeOf(c) {
    _ = &c;
    return c;
}
pub inline fn INT16_C(c: anytype) @TypeOf(c) {
    _ = &c;
    return c;
}
pub inline fn INT32_C(c: anytype) @TypeOf(c) {
    _ = &c;
    return c;
}
pub const INT64_C = @import("std").zig.c_translation.Macros.L_SUFFIX;
pub inline fn UINT8_C(c: anytype) @TypeOf(c) {
    _ = &c;
    return c;
}
pub inline fn UINT16_C(c: anytype) @TypeOf(c) {
    _ = &c;
    return c;
}
pub const UINT32_C = @import("std").zig.c_translation.Macros.U_SUFFIX;
pub const UINT64_C = @import("std").zig.c_translation.Macros.UL_SUFFIX;
pub const INTMAX_C = @import("std").zig.c_translation.Macros.L_SUFFIX;
pub const UINTMAX_C = @import("std").zig.c_translation.Macros.UL_SUFFIX;
pub const _SYS_IOCTL_H = @as(c_int, 1);
pub const __ASM_GENERIC_IOCTLS_H = "";
pub const _LINUX_IOCTL_H = "";
pub const _ASM_GENERIC_IOCTL_H = "";
pub const _IOC_NRBITS = @as(c_int, 8);
pub const _IOC_TYPEBITS = @as(c_int, 8);
pub const _IOC_SIZEBITS = @as(c_int, 14);
pub const _IOC_DIRBITS = @as(c_int, 2);
pub const _IOC_NRMASK = (@as(c_int, 1) << _IOC_NRBITS) - @as(c_int, 1);
pub const _IOC_TYPEMASK = (@as(c_int, 1) << _IOC_TYPEBITS) - @as(c_int, 1);
pub const _IOC_SIZEMASK = (@as(c_int, 1) << _IOC_SIZEBITS) - @as(c_int, 1);
pub const _IOC_DIRMASK = (@as(c_int, 1) << _IOC_DIRBITS) - @as(c_int, 1);
pub const _IOC_NRSHIFT = @as(c_int, 0);
pub const _IOC_TYPESHIFT = _IOC_NRSHIFT + _IOC_NRBITS;
pub const _IOC_SIZESHIFT = _IOC_TYPESHIFT + _IOC_TYPEBITS;
pub const _IOC_DIRSHIFT = _IOC_SIZESHIFT + _IOC_SIZEBITS;
pub const _IOC_NONE = @as(c_uint, 0);
pub const _IOC_WRITE = @as(c_uint, 1);
pub const _IOC_READ = @as(c_uint, 2);
pub inline fn _IOC(dir: anytype, @"type": anytype, nr: anytype, size: anytype) @TypeOf((((dir << _IOC_DIRSHIFT) | (@"type" << _IOC_TYPESHIFT)) | (nr << _IOC_NRSHIFT)) | (size << _IOC_SIZESHIFT)) {
    _ = &dir;
    _ = &@"type";
    _ = &nr;
    _ = &size;
    return (((dir << _IOC_DIRSHIFT) | (@"type" << _IOC_TYPESHIFT)) | (nr << _IOC_NRSHIFT)) | (size << _IOC_SIZESHIFT);
}
pub inline fn _IOC_TYPECHECK(t: anytype) @TypeOf(@import("std").zig.c_translation.sizeof(t)) {
    _ = &t;
    return @import("std").zig.c_translation.sizeof(t);
}
pub inline fn _IO(@"type": anytype, nr: anytype) @TypeOf(_IOC(_IOC_NONE, @"type", nr, @as(c_int, 0))) {
    _ = &@"type";
    _ = &nr;
    return _IOC(_IOC_NONE, @"type", nr, @as(c_int, 0));
}
pub inline fn _IOR(@"type": anytype, nr: anytype, size: anytype) @TypeOf(_IOC(_IOC_READ, @"type", nr, _IOC_TYPECHECK(size))) {
    _ = &@"type";
    _ = &nr;
    _ = &size;
    return _IOC(_IOC_READ, @"type", nr, _IOC_TYPECHECK(size));
}
pub inline fn _IOW(@"type": anytype, nr: anytype, size: anytype) @TypeOf(_IOC(_IOC_WRITE, @"type", nr, _IOC_TYPECHECK(size))) {
    _ = &@"type";
    _ = &nr;
    _ = &size;
    return _IOC(_IOC_WRITE, @"type", nr, _IOC_TYPECHECK(size));
}
pub inline fn _IOWR(@"type": anytype, nr: anytype, size: anytype) @TypeOf(_IOC(_IOC_READ | _IOC_WRITE, @"type", nr, _IOC_TYPECHECK(size))) {
    _ = &@"type";
    _ = &nr;
    _ = &size;
    return _IOC(_IOC_READ | _IOC_WRITE, @"type", nr, _IOC_TYPECHECK(size));
}
pub inline fn _IOR_BAD(@"type": anytype, nr: anytype, size: anytype) @TypeOf(_IOC(_IOC_READ, @"type", nr, @import("std").zig.c_translation.sizeof(size))) {
    _ = &@"type";
    _ = &nr;
    _ = &size;
    return _IOC(_IOC_READ, @"type", nr, @import("std").zig.c_translation.sizeof(size));
}
pub inline fn _IOW_BAD(@"type": anytype, nr: anytype, size: anytype) @TypeOf(_IOC(_IOC_WRITE, @"type", nr, @import("std").zig.c_translation.sizeof(size))) {
    _ = &@"type";
    _ = &nr;
    _ = &size;
    return _IOC(_IOC_WRITE, @"type", nr, @import("std").zig.c_translation.sizeof(size));
}
pub inline fn _IOWR_BAD(@"type": anytype, nr: anytype, size: anytype) @TypeOf(_IOC(_IOC_READ | _IOC_WRITE, @"type", nr, @import("std").zig.c_translation.sizeof(size))) {
    _ = &@"type";
    _ = &nr;
    _ = &size;
    return _IOC(_IOC_READ | _IOC_WRITE, @"type", nr, @import("std").zig.c_translation.sizeof(size));
}
pub inline fn _IOC_DIR(nr: anytype) @TypeOf((nr >> _IOC_DIRSHIFT) & _IOC_DIRMASK) {
    _ = &nr;
    return (nr >> _IOC_DIRSHIFT) & _IOC_DIRMASK;
}
pub inline fn _IOC_TYPE(nr: anytype) @TypeOf((nr >> _IOC_TYPESHIFT) & _IOC_TYPEMASK) {
    _ = &nr;
    return (nr >> _IOC_TYPESHIFT) & _IOC_TYPEMASK;
}
pub inline fn _IOC_NR(nr: anytype) @TypeOf((nr >> _IOC_NRSHIFT) & _IOC_NRMASK) {
    _ = &nr;
    return (nr >> _IOC_NRSHIFT) & _IOC_NRMASK;
}
pub inline fn _IOC_SIZE(nr: anytype) @TypeOf((nr >> _IOC_SIZESHIFT) & _IOC_SIZEMASK) {
    _ = &nr;
    return (nr >> _IOC_SIZESHIFT) & _IOC_SIZEMASK;
}
pub const IOC_IN = _IOC_WRITE << _IOC_DIRSHIFT;
pub const IOC_OUT = _IOC_READ << _IOC_DIRSHIFT;
pub const IOC_INOUT = (_IOC_WRITE | _IOC_READ) << _IOC_DIRSHIFT;
pub const IOCSIZE_MASK = _IOC_SIZEMASK << _IOC_SIZESHIFT;
pub const IOCSIZE_SHIFT = _IOC_SIZESHIFT;
pub const TCGETS = @as(c_int, 0x5401);
pub const TCSETS = @as(c_int, 0x5402);
pub const TCSETSW = @as(c_int, 0x5403);
pub const TCSETSF = @as(c_int, 0x5404);
pub const TCGETA = @as(c_int, 0x5405);
pub const TCSETA = @as(c_int, 0x5406);
pub const TCSETAW = @as(c_int, 0x5407);
pub const TCSETAF = @as(c_int, 0x5408);
pub const TCSBRK = @as(c_int, 0x5409);
pub const TCXONC = @as(c_int, 0x540A);
pub const TCFLSH = @as(c_int, 0x540B);
pub const TIOCEXCL = @as(c_int, 0x540C);
pub const TIOCNXCL = @as(c_int, 0x540D);
pub const TIOCSCTTY = @as(c_int, 0x540E);
pub const TIOCGPGRP = @as(c_int, 0x540F);
pub const TIOCSPGRP = @as(c_int, 0x5410);
pub const TIOCOUTQ = @as(c_int, 0x5411);
pub const TIOCSTI = @as(c_int, 0x5412);
pub const TIOCGWINSZ = @as(c_int, 0x5413);
pub const TIOCSWINSZ = @as(c_int, 0x5414);
pub const TIOCMGET = @as(c_int, 0x5415);
pub const TIOCMBIS = @as(c_int, 0x5416);
pub const TIOCMBIC = @as(c_int, 0x5417);
pub const TIOCMSET = @as(c_int, 0x5418);
pub const TIOCGSOFTCAR = @as(c_int, 0x5419);
pub const TIOCSSOFTCAR = @as(c_int, 0x541A);
pub const FIONREAD = @as(c_int, 0x541B);
pub const TIOCINQ = FIONREAD;
pub const TIOCLINUX = @as(c_int, 0x541C);
pub const TIOCCONS = @as(c_int, 0x541D);
pub const TIOCGSERIAL = @as(c_int, 0x541E);
pub const TIOCSSERIAL = @as(c_int, 0x541F);
pub const TIOCPKT = @as(c_int, 0x5420);
pub const FIONBIO = @as(c_int, 0x5421);
pub const TIOCNOTTY = @as(c_int, 0x5422);
pub const TIOCSETD = @as(c_int, 0x5423);
pub const TIOCGETD = @as(c_int, 0x5424);
pub const TCSBRKP = @as(c_int, 0x5425);
pub const TIOCSBRK = @as(c_int, 0x5427);
pub const TIOCCBRK = @as(c_int, 0x5428);
pub const TIOCGSID = @as(c_int, 0x5429);
pub const TCGETS2 = @compileError("unable to translate macro: undefined identifier `termios2`");
// /usr/include/asm-generic/ioctls.h:61:9
pub const TCSETS2 = @compileError("unable to translate macro: undefined identifier `termios2`");
// /usr/include/asm-generic/ioctls.h:62:9
pub const TCSETSW2 = @compileError("unable to translate macro: undefined identifier `termios2`");
// /usr/include/asm-generic/ioctls.h:63:9
pub const TCSETSF2 = @compileError("unable to translate macro: undefined identifier `termios2`");
// /usr/include/asm-generic/ioctls.h:64:9
pub const TIOCGRS485 = @as(c_int, 0x542E);
pub const TIOCSRS485 = @as(c_int, 0x542F);
pub const TIOCGPTN = _IOR('T', @as(c_int, 0x30), c_uint);
pub const TIOCSPTLCK = _IOW('T', @as(c_int, 0x31), c_int);
pub const TIOCGDEV = _IOR('T', @as(c_int, 0x32), c_uint);
pub const TCGETX = @as(c_int, 0x5432);
pub const TCSETX = @as(c_int, 0x5433);
pub const TCSETXF = @as(c_int, 0x5434);
pub const TCSETXW = @as(c_int, 0x5435);
pub const TIOCSIG = _IOW('T', @as(c_int, 0x36), c_int);
pub const TIOCVHANGUP = @as(c_int, 0x5437);
pub const TIOCGPKT = _IOR('T', @as(c_int, 0x38), c_int);
pub const TIOCGPTLCK = _IOR('T', @as(c_int, 0x39), c_int);
pub const TIOCGEXCL = _IOR('T', @as(c_int, 0x40), c_int);
pub const TIOCGPTPEER = _IO('T', @as(c_int, 0x41));
pub const TIOCGISO7816 = @compileError("unable to translate macro: undefined identifier `serial_iso7816`");
// /usr/include/asm-generic/ioctls.h:82:9
pub const TIOCSISO7816 = @compileError("unable to translate macro: undefined identifier `serial_iso7816`");
// /usr/include/asm-generic/ioctls.h:83:9
pub const FIONCLEX = @as(c_int, 0x5450);
pub const FIOCLEX = @as(c_int, 0x5451);
pub const FIOASYNC = @as(c_int, 0x5452);
pub const TIOCSERCONFIG = @as(c_int, 0x5453);
pub const TIOCSERGWILD = @as(c_int, 0x5454);
pub const TIOCSERSWILD = @as(c_int, 0x5455);
pub const TIOCGLCKTRMIOS = @as(c_int, 0x5456);
pub const TIOCSLCKTRMIOS = @as(c_int, 0x5457);
pub const TIOCSERGSTRUCT = @as(c_int, 0x5458);
pub const TIOCSERGETLSR = @as(c_int, 0x5459);
pub const TIOCSERGETMULTI = @as(c_int, 0x545A);
pub const TIOCSERSETMULTI = @as(c_int, 0x545B);
pub const TIOCMIWAIT = @as(c_int, 0x545C);
pub const TIOCGICOUNT = @as(c_int, 0x545D);
pub const FIOQSIZE = @as(c_int, 0x5460);
pub const TIOCPKT_DATA = @as(c_int, 0);
pub const TIOCPKT_FLUSHREAD = @as(c_int, 1);
pub const TIOCPKT_FLUSHWRITE = @as(c_int, 2);
pub const TIOCPKT_STOP = @as(c_int, 4);
pub const TIOCPKT_START = @as(c_int, 8);
pub const TIOCPKT_NOSTOP = @as(c_int, 16);
pub const TIOCPKT_DOSTOP = @as(c_int, 32);
pub const TIOCPKT_IOCTL = @as(c_int, 64);
pub const TIOCSER_TEMT = @as(c_int, 0x01);
pub const SIOCADDRT = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x890B, .hex);
pub const SIOCDELRT = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x890C, .hex);
pub const SIOCRTMSG = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x890D, .hex);
pub const SIOCGIFNAME = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8910, .hex);
pub const SIOCSIFLINK = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8911, .hex);
pub const SIOCGIFCONF = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8912, .hex);
pub const SIOCGIFFLAGS = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8913, .hex);
pub const SIOCSIFFLAGS = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8914, .hex);
pub const SIOCGIFADDR = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8915, .hex);
pub const SIOCSIFADDR = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8916, .hex);
pub const SIOCGIFDSTADDR = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8917, .hex);
pub const SIOCSIFDSTADDR = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8918, .hex);
pub const SIOCGIFBRDADDR = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8919, .hex);
pub const SIOCSIFBRDADDR = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x891a, .hex);
pub const SIOCGIFNETMASK = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x891b, .hex);
pub const SIOCSIFNETMASK = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x891c, .hex);
pub const SIOCGIFMETRIC = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x891d, .hex);
pub const SIOCSIFMETRIC = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x891e, .hex);
pub const SIOCGIFMEM = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x891f, .hex);
pub const SIOCSIFMEM = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8920, .hex);
pub const SIOCGIFMTU = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8921, .hex);
pub const SIOCSIFMTU = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8922, .hex);
pub const SIOCSIFNAME = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8923, .hex);
pub const SIOCSIFHWADDR = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8924, .hex);
pub const SIOCGIFENCAP = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8925, .hex);
pub const SIOCSIFENCAP = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8926, .hex);
pub const SIOCGIFHWADDR = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8927, .hex);
pub const SIOCGIFSLAVE = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8929, .hex);
pub const SIOCSIFSLAVE = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8930, .hex);
pub const SIOCADDMULTI = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8931, .hex);
pub const SIOCDELMULTI = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8932, .hex);
pub const SIOCGIFINDEX = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8933, .hex);
pub const SIOGIFINDEX = SIOCGIFINDEX;
pub const SIOCSIFPFLAGS = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8934, .hex);
pub const SIOCGIFPFLAGS = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8935, .hex);
pub const SIOCDIFADDR = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8936, .hex);
pub const SIOCSIFHWBROADCAST = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8937, .hex);
pub const SIOCGIFCOUNT = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8938, .hex);
pub const SIOCGIFBR = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8940, .hex);
pub const SIOCSIFBR = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8941, .hex);
pub const SIOCGIFTXQLEN = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8942, .hex);
pub const SIOCSIFTXQLEN = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8943, .hex);
pub const SIOCDARP = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8953, .hex);
pub const SIOCGARP = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8954, .hex);
pub const SIOCSARP = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8955, .hex);
pub const SIOCDRARP = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8960, .hex);
pub const SIOCGRARP = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8961, .hex);
pub const SIOCSRARP = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8962, .hex);
pub const SIOCGIFMAP = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8970, .hex);
pub const SIOCSIFMAP = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8971, .hex);
pub const SIOCADDDLCI = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8980, .hex);
pub const SIOCDELDLCI = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8981, .hex);
pub const SIOCDEVPRIVATE = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x89F0, .hex);
pub const SIOCPROTOPRIVATE = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x89E0, .hex);
pub const NCC = @as(c_int, 8);
pub const TIOCM_LE = @as(c_int, 0x001);
pub const TIOCM_DTR = @as(c_int, 0x002);
pub const TIOCM_RTS = @as(c_int, 0x004);
pub const TIOCM_ST = @as(c_int, 0x008);
pub const TIOCM_SR = @as(c_int, 0x010);
pub const TIOCM_CTS = @as(c_int, 0x020);
pub const TIOCM_CAR = @as(c_int, 0x040);
pub const TIOCM_RNG = @as(c_int, 0x080);
pub const TIOCM_DSR = @as(c_int, 0x100);
pub const TIOCM_CD = TIOCM_CAR;
pub const TIOCM_RI = TIOCM_RNG;
pub const N_TTY = @as(c_int, 0);
pub const N_SLIP = @as(c_int, 1);
pub const N_MOUSE = @as(c_int, 2);
pub const N_PPP = @as(c_int, 3);
pub const N_STRIP = @as(c_int, 4);
pub const N_AX25 = @as(c_int, 5);
pub const N_X25 = @as(c_int, 6);
pub const N_6PACK = @as(c_int, 7);
pub const N_MASC = @as(c_int, 8);
pub const N_R3964 = @as(c_int, 9);
pub const N_PROFIBUS_FDL = @as(c_int, 10);
pub const N_IRDA = @as(c_int, 11);
pub const N_SMSBLOCK = @as(c_int, 12);
pub const N_HDLC = @as(c_int, 13);
pub const N_SYNC_PPP = @as(c_int, 14);
pub const N_HCI = @as(c_int, 15);
pub const _SYS_TTYDEFAULTS_H_ = "";
pub const TTYDEF_IFLAG = @compileError("unable to translate macro: undefined identifier `BRKINT`");
// /usr/include/aarch64-linux-gnu/sys/ttydefaults.h:46:9
pub const TTYDEF_OFLAG = @compileError("unable to translate macro: undefined identifier `OPOST`");
// /usr/include/aarch64-linux-gnu/sys/ttydefaults.h:47:9
pub const TTYDEF_LFLAG = @compileError("unable to translate macro: undefined identifier `ECHO`");
// /usr/include/aarch64-linux-gnu/sys/ttydefaults.h:48:9
pub const TTYDEF_CFLAG = @compileError("unable to translate macro: undefined identifier `CREAD`");
// /usr/include/aarch64-linux-gnu/sys/ttydefaults.h:49:9
pub const TTYDEF_SPEED = @compileError("unable to translate macro: undefined identifier `B9600`");
// /usr/include/aarch64-linux-gnu/sys/ttydefaults.h:50:9
pub inline fn CTRL(x: anytype) @TypeOf(x & @as(c_int, 0o37)) {
    _ = &x;
    return x & @as(c_int, 0o37);
}
pub const CEOF = CTRL('d');
pub const CEOL = '\x00';
pub const CERASE = @as(c_int, 0o177);
pub const CINTR = CTRL('c');
pub const CSTATUS = '\x00';
pub const CKILL = CTRL('u');
pub const CMIN = @as(c_int, 1);
pub const CQUIT = @as(c_int, 0o34);
pub const CSUSP = CTRL('z');
pub const CTIME = @as(c_int, 0);
pub const CDSUSP = CTRL('y');
pub const CSTART = CTRL('q');
pub const CSTOP = CTRL('s');
pub const CLNEXT = CTRL('v');
pub const CDISCARD = CTRL('o');
pub const CWERASE = CTRL('w');
pub const CREPRINT = CTRL('r');
pub const CEOT = CEOF;
pub const CBRK = CEOL;
pub const CRPRNT = CREPRINT;
pub const CFLUSH = CDISCARD;
pub const __EPOLL_PACKED = "";
pub const EPOLL_CTL_ADD = @as(c_int, 1);
pub const EPOLL_CTL_DEL = @as(c_int, 2);
pub const EPOLL_CTL_MOD = @as(c_int, 3);
pub const EPOLL_IOC_TYPE = @as(c_int, 0x8A);
pub const EPIOCSPARAMS = _IOW(EPOLL_IOC_TYPE, @as(c_int, 0x01), struct_epoll_params);
pub const EPIOCGPARAMS = _IOR(EPOLL_IOC_TYPE, @as(c_int, 0x02), struct_epoll_params);
pub const _SYS_TIMERFD_H = @as(c_int, 1);
pub const _TIME_H = @as(c_int, 1);
pub const __need_NULL = "";
pub const NULL = @import("std").zig.c_translation.cast(?*anyopaque, @as(c_int, 0));
pub const _BITS_TIME_H = @as(c_int, 1);
pub const CLOCKS_PER_SEC = @import("std").zig.c_translation.cast(__clock_t, @import("std").zig.c_translation.promoteIntLiteral(c_int, 1000000, .decimal));
pub const CLOCK_REALTIME = @as(c_int, 0);
pub const CLOCK_MONOTONIC = @as(c_int, 1);
pub const CLOCK_PROCESS_CPUTIME_ID = @as(c_int, 2);
pub const CLOCK_THREAD_CPUTIME_ID = @as(c_int, 3);
pub const CLOCK_MONOTONIC_RAW = @as(c_int, 4);
pub const CLOCK_REALTIME_COARSE = @as(c_int, 5);
pub const CLOCK_MONOTONIC_COARSE = @as(c_int, 6);
pub const CLOCK_BOOTTIME = @as(c_int, 7);
pub const CLOCK_REALTIME_ALARM = @as(c_int, 8);
pub const CLOCK_BOOTTIME_ALARM = @as(c_int, 9);
pub const CLOCK_TAI = @as(c_int, 11);
pub const TIMER_ABSTIME = @as(c_int, 1);
pub const __struct_tm_defined = @as(c_int, 1);
pub const __itimerspec_defined = @as(c_int, 1);
pub const _BITS_TYPES_LOCALE_T_H = @as(c_int, 1);
pub const _BITS_TYPES___LOCALE_T_H = @as(c_int, 1);
pub const TIME_UTC = @as(c_int, 1);
pub inline fn __isleap(year: anytype) @TypeOf((@import("std").zig.c_translation.MacroArithmetic.rem(year, @as(c_int, 4)) == @as(c_int, 0)) and ((@import("std").zig.c_translation.MacroArithmetic.rem(year, @as(c_int, 100)) != @as(c_int, 0)) or (@import("std").zig.c_translation.MacroArithmetic.rem(year, @as(c_int, 400)) == @as(c_int, 0)))) {
    _ = &year;
    return (@import("std").zig.c_translation.MacroArithmetic.rem(year, @as(c_int, 4)) == @as(c_int, 0)) and ((@import("std").zig.c_translation.MacroArithmetic.rem(year, @as(c_int, 100)) != @as(c_int, 0)) or (@import("std").zig.c_translation.MacroArithmetic.rem(year, @as(c_int, 400)) == @as(c_int, 0)));
}
pub const _SYS_EVENTFD_H = @as(c_int, 1);
pub const _NETINET_IN_H = @as(c_int, 1);
pub const __USE_KERNEL_IPV6_DEFS = @as(c_int, 0);
pub const IP_OPTIONS = @as(c_int, 4);
pub const IP_HDRINCL = @as(c_int, 3);
pub const IP_TOS = @as(c_int, 1);
pub const IP_TTL = @as(c_int, 2);
pub const IP_RECVOPTS = @as(c_int, 6);
pub const IP_RECVRETOPTS = IP_RETOPTS;
pub const IP_RETOPTS = @as(c_int, 7);
pub const IP_MULTICAST_IF = @as(c_int, 32);
pub const IP_MULTICAST_TTL = @as(c_int, 33);
pub const IP_MULTICAST_LOOP = @as(c_int, 34);
pub const IP_ADD_MEMBERSHIP = @as(c_int, 35);
pub const IP_DROP_MEMBERSHIP = @as(c_int, 36);
pub const IP_UNBLOCK_SOURCE = @as(c_int, 37);
pub const IP_BLOCK_SOURCE = @as(c_int, 38);
pub const IP_ADD_SOURCE_MEMBERSHIP = @as(c_int, 39);
pub const IP_DROP_SOURCE_MEMBERSHIP = @as(c_int, 40);
pub const IP_MSFILTER = @as(c_int, 41);
pub const MCAST_JOIN_GROUP = @as(c_int, 42);
pub const MCAST_BLOCK_SOURCE = @as(c_int, 43);
pub const MCAST_UNBLOCK_SOURCE = @as(c_int, 44);
pub const MCAST_LEAVE_GROUP = @as(c_int, 45);
pub const MCAST_JOIN_SOURCE_GROUP = @as(c_int, 46);
pub const MCAST_LEAVE_SOURCE_GROUP = @as(c_int, 47);
pub const MCAST_MSFILTER = @as(c_int, 48);
pub const IP_MULTICAST_ALL = @as(c_int, 49);
pub const IP_UNICAST_IF = @as(c_int, 50);
pub const MCAST_EXCLUDE = @as(c_int, 0);
pub const MCAST_INCLUDE = @as(c_int, 1);
pub const IP_ROUTER_ALERT = @as(c_int, 5);
pub const IP_PKTINFO = @as(c_int, 8);
pub const IP_PKTOPTIONS = @as(c_int, 9);
pub const IP_PMTUDISC = @as(c_int, 10);
pub const IP_MTU_DISCOVER = @as(c_int, 10);
pub const IP_RECVERR = @as(c_int, 11);
pub const IP_RECVTTL = @as(c_int, 12);
pub const IP_RECVTOS = @as(c_int, 13);
pub const IP_MTU = @as(c_int, 14);
pub const IP_FREEBIND = @as(c_int, 15);
pub const IP_IPSEC_POLICY = @as(c_int, 16);
pub const IP_XFRM_POLICY = @as(c_int, 17);
pub const IP_PASSSEC = @as(c_int, 18);
pub const IP_TRANSPARENT = @as(c_int, 19);
pub const IP_ORIGDSTADDR = @as(c_int, 20);
pub const IP_RECVORIGDSTADDR = IP_ORIGDSTADDR;
pub const IP_MINTTL = @as(c_int, 21);
pub const IP_NODEFRAG = @as(c_int, 22);
pub const IP_CHECKSUM = @as(c_int, 23);
pub const IP_BIND_ADDRESS_NO_PORT = @as(c_int, 24);
pub const IP_RECVFRAGSIZE = @as(c_int, 25);
pub const IP_RECVERR_RFC4884 = @as(c_int, 26);
pub const IP_PMTUDISC_DONT = @as(c_int, 0);
pub const IP_PMTUDISC_WANT = @as(c_int, 1);
pub const IP_PMTUDISC_DO = @as(c_int, 2);
pub const IP_PMTUDISC_PROBE = @as(c_int, 3);
pub const IP_PMTUDISC_INTERFACE = @as(c_int, 4);
pub const IP_PMTUDISC_OMIT = @as(c_int, 5);
pub const IP_LOCAL_PORT_RANGE = @as(c_int, 51);
pub const IP_PROTOCOL = @as(c_int, 52);
pub const SOL_IP = @as(c_int, 0);
pub const IP_DEFAULT_MULTICAST_TTL = @as(c_int, 1);
pub const IP_DEFAULT_MULTICAST_LOOP = @as(c_int, 1);
pub const IP_MAX_MEMBERSHIPS = @as(c_int, 20);
pub const IPV6_ADDRFORM = @as(c_int, 1);
pub const IPV6_2292PKTINFO = @as(c_int, 2);
pub const IPV6_2292HOPOPTS = @as(c_int, 3);
pub const IPV6_2292DSTOPTS = @as(c_int, 4);
pub const IPV6_2292RTHDR = @as(c_int, 5);
pub const IPV6_2292PKTOPTIONS = @as(c_int, 6);
pub const IPV6_CHECKSUM = @as(c_int, 7);
pub const IPV6_2292HOPLIMIT = @as(c_int, 8);
pub const SCM_SRCRT = @compileError("unable to translate macro: undefined identifier `IPV6_RXSRCRT`");
// /usr/include/aarch64-linux-gnu/bits/in.h:172:9
pub const IPV6_NEXTHOP = @as(c_int, 9);
pub const IPV6_AUTHHDR = @as(c_int, 10);
pub const IPV6_UNICAST_HOPS = @as(c_int, 16);
pub const IPV6_MULTICAST_IF = @as(c_int, 17);
pub const IPV6_MULTICAST_HOPS = @as(c_int, 18);
pub const IPV6_MULTICAST_LOOP = @as(c_int, 19);
pub const IPV6_JOIN_GROUP = @as(c_int, 20);
pub const IPV6_LEAVE_GROUP = @as(c_int, 21);
pub const IPV6_ROUTER_ALERT = @as(c_int, 22);
pub const IPV6_MTU_DISCOVER = @as(c_int, 23);
pub const IPV6_MTU = @as(c_int, 24);
pub const IPV6_RECVERR = @as(c_int, 25);
pub const IPV6_V6ONLY = @as(c_int, 26);
pub const IPV6_JOIN_ANYCAST = @as(c_int, 27);
pub const IPV6_LEAVE_ANYCAST = @as(c_int, 28);
pub const IPV6_MULTICAST_ALL = @as(c_int, 29);
pub const IPV6_ROUTER_ALERT_ISOLATE = @as(c_int, 30);
pub const IPV6_RECVERR_RFC4884 = @as(c_int, 31);
pub const IPV6_IPSEC_POLICY = @as(c_int, 34);
pub const IPV6_XFRM_POLICY = @as(c_int, 35);
pub const IPV6_HDRINCL = @as(c_int, 36);
pub const IPV6_RECVPKTINFO = @as(c_int, 49);
pub const IPV6_PKTINFO = @as(c_int, 50);
pub const IPV6_RECVHOPLIMIT = @as(c_int, 51);
pub const IPV6_HOPLIMIT = @as(c_int, 52);
pub const IPV6_RECVHOPOPTS = @as(c_int, 53);
pub const IPV6_HOPOPTS = @as(c_int, 54);
pub const IPV6_RTHDRDSTOPTS = @as(c_int, 55);
pub const IPV6_RECVRTHDR = @as(c_int, 56);
pub const IPV6_RTHDR = @as(c_int, 57);
pub const IPV6_RECVDSTOPTS = @as(c_int, 58);
pub const IPV6_DSTOPTS = @as(c_int, 59);
pub const IPV6_RECVPATHMTU = @as(c_int, 60);
pub const IPV6_PATHMTU = @as(c_int, 61);
pub const IPV6_DONTFRAG = @as(c_int, 62);
pub const IPV6_RECVTCLASS = @as(c_int, 66);
pub const IPV6_TCLASS = @as(c_int, 67);
pub const IPV6_AUTOFLOWLABEL = @as(c_int, 70);
pub const IPV6_ADDR_PREFERENCES = @as(c_int, 72);
pub const IPV6_MINHOPCOUNT = @as(c_int, 73);
pub const IPV6_ORIGDSTADDR = @as(c_int, 74);
pub const IPV6_RECVORIGDSTADDR = IPV6_ORIGDSTADDR;
pub const IPV6_TRANSPARENT = @as(c_int, 75);
pub const IPV6_UNICAST_IF = @as(c_int, 76);
pub const IPV6_RECVFRAGSIZE = @as(c_int, 77);
pub const IPV6_FREEBIND = @as(c_int, 78);
pub const IPV6_ADD_MEMBERSHIP = IPV6_JOIN_GROUP;
pub const IPV6_DROP_MEMBERSHIP = IPV6_LEAVE_GROUP;
pub const IPV6_RXHOPOPTS = IPV6_HOPOPTS;
pub const IPV6_RXDSTOPTS = IPV6_DSTOPTS;
pub const IPV6_PMTUDISC_DONT = @as(c_int, 0);
pub const IPV6_PMTUDISC_WANT = @as(c_int, 1);
pub const IPV6_PMTUDISC_DO = @as(c_int, 2);
pub const IPV6_PMTUDISC_PROBE = @as(c_int, 3);
pub const IPV6_PMTUDISC_INTERFACE = @as(c_int, 4);
pub const IPV6_PMTUDISC_OMIT = @as(c_int, 5);
pub const SOL_IPV6 = @as(c_int, 41);
pub const SOL_ICMPV6 = @as(c_int, 58);
pub const IPV6_RTHDR_LOOSE = @as(c_int, 0);
pub const IPV6_RTHDR_STRICT = @as(c_int, 1);
pub const IPV6_RTHDR_TYPE_0 = @as(c_int, 0);
pub inline fn IN_CLASSA(a: anytype) @TypeOf((@import("std").zig.c_translation.cast(in_addr_t, a) & @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x80000000, .hex)) == @as(c_int, 0)) {
    _ = &a;
    return (@import("std").zig.c_translation.cast(in_addr_t, a) & @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x80000000, .hex)) == @as(c_int, 0);
}
pub const IN_CLASSA_NET = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0xff000000, .hex);
pub const IN_CLASSA_NSHIFT = @as(c_int, 24);
pub const IN_CLASSA_HOST = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0xffffffff, .hex) & ~IN_CLASSA_NET;
pub const IN_CLASSA_MAX = @as(c_int, 128);
pub inline fn IN_CLASSB(a: anytype) @TypeOf((@import("std").zig.c_translation.cast(in_addr_t, a) & @import("std").zig.c_translation.promoteIntLiteral(c_int, 0xc0000000, .hex)) == @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x80000000, .hex)) {
    _ = &a;
    return (@import("std").zig.c_translation.cast(in_addr_t, a) & @import("std").zig.c_translation.promoteIntLiteral(c_int, 0xc0000000, .hex)) == @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x80000000, .hex);
}
pub const IN_CLASSB_NET = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0xffff0000, .hex);
pub const IN_CLASSB_NSHIFT = @as(c_int, 16);
pub const IN_CLASSB_HOST = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0xffffffff, .hex) & ~IN_CLASSB_NET;
pub const IN_CLASSB_MAX = @import("std").zig.c_translation.promoteIntLiteral(c_int, 65536, .decimal);
pub inline fn IN_CLASSC(a: anytype) @TypeOf((@import("std").zig.c_translation.cast(in_addr_t, a) & @import("std").zig.c_translation.promoteIntLiteral(c_int, 0xe0000000, .hex)) == @import("std").zig.c_translation.promoteIntLiteral(c_int, 0xc0000000, .hex)) {
    _ = &a;
    return (@import("std").zig.c_translation.cast(in_addr_t, a) & @import("std").zig.c_translation.promoteIntLiteral(c_int, 0xe0000000, .hex)) == @import("std").zig.c_translation.promoteIntLiteral(c_int, 0xc0000000, .hex);
}
pub const IN_CLASSC_NET = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0xffffff00, .hex);
pub const IN_CLASSC_NSHIFT = @as(c_int, 8);
pub const IN_CLASSC_HOST = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0xffffffff, .hex) & ~IN_CLASSC_NET;
pub inline fn IN_CLASSD(a: anytype) @TypeOf((@import("std").zig.c_translation.cast(in_addr_t, a) & @import("std").zig.c_translation.promoteIntLiteral(c_int, 0xf0000000, .hex)) == @import("std").zig.c_translation.promoteIntLiteral(c_int, 0xe0000000, .hex)) {
    _ = &a;
    return (@import("std").zig.c_translation.cast(in_addr_t, a) & @import("std").zig.c_translation.promoteIntLiteral(c_int, 0xf0000000, .hex)) == @import("std").zig.c_translation.promoteIntLiteral(c_int, 0xe0000000, .hex);
}
pub inline fn IN_MULTICAST(a: anytype) @TypeOf(IN_CLASSD(a)) {
    _ = &a;
    return IN_CLASSD(a);
}
pub inline fn IN_EXPERIMENTAL(a: anytype) @TypeOf((@import("std").zig.c_translation.cast(in_addr_t, a) & @import("std").zig.c_translation.promoteIntLiteral(c_int, 0xe0000000, .hex)) == @import("std").zig.c_translation.promoteIntLiteral(c_int, 0xe0000000, .hex)) {
    _ = &a;
    return (@import("std").zig.c_translation.cast(in_addr_t, a) & @import("std").zig.c_translation.promoteIntLiteral(c_int, 0xe0000000, .hex)) == @import("std").zig.c_translation.promoteIntLiteral(c_int, 0xe0000000, .hex);
}
pub inline fn IN_BADCLASS(a: anytype) @TypeOf((@import("std").zig.c_translation.cast(in_addr_t, a) & @import("std").zig.c_translation.promoteIntLiteral(c_int, 0xf0000000, .hex)) == @import("std").zig.c_translation.promoteIntLiteral(c_int, 0xf0000000, .hex)) {
    _ = &a;
    return (@import("std").zig.c_translation.cast(in_addr_t, a) & @import("std").zig.c_translation.promoteIntLiteral(c_int, 0xf0000000, .hex)) == @import("std").zig.c_translation.promoteIntLiteral(c_int, 0xf0000000, .hex);
}
pub const INADDR_ANY = @import("std").zig.c_translation.cast(in_addr_t, @as(c_int, 0x00000000));
pub const INADDR_BROADCAST = @import("std").zig.c_translation.cast(in_addr_t, @import("std").zig.c_translation.promoteIntLiteral(c_int, 0xffffffff, .hex));
pub const INADDR_NONE = @import("std").zig.c_translation.cast(in_addr_t, @import("std").zig.c_translation.promoteIntLiteral(c_int, 0xffffffff, .hex));
pub const INADDR_DUMMY = @import("std").zig.c_translation.cast(in_addr_t, @import("std").zig.c_translation.promoteIntLiteral(c_int, 0xc0000008, .hex));
pub const IN_LOOPBACKNET = @as(c_int, 127);
pub const INADDR_LOOPBACK = @import("std").zig.c_translation.cast(in_addr_t, @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x7f000001, .hex));
pub const INADDR_UNSPEC_GROUP = @import("std").zig.c_translation.cast(in_addr_t, @import("std").zig.c_translation.promoteIntLiteral(c_int, 0xe0000000, .hex));
pub const INADDR_ALLHOSTS_GROUP = @import("std").zig.c_translation.cast(in_addr_t, @import("std").zig.c_translation.promoteIntLiteral(c_int, 0xe0000001, .hex));
pub const INADDR_ALLRTRS_GROUP = @import("std").zig.c_translation.cast(in_addr_t, @import("std").zig.c_translation.promoteIntLiteral(c_int, 0xe0000002, .hex));
pub const INADDR_ALLSNOOPERS_GROUP = @import("std").zig.c_translation.cast(in_addr_t, @import("std").zig.c_translation.promoteIntLiteral(c_int, 0xe000006a, .hex));
pub const INADDR_MAX_LOCAL_GROUP = @import("std").zig.c_translation.cast(in_addr_t, @import("std").zig.c_translation.promoteIntLiteral(c_int, 0xe00000ff, .hex));
pub const s6_addr = @compileError("unable to translate macro: undefined identifier `__in6_u`");
// /usr/include/netinet/in.h:231:9
pub const s6_addr16 = @compileError("unable to translate macro: undefined identifier `__in6_u`");
// /usr/include/netinet/in.h:233:10
pub const s6_addr32 = @compileError("unable to translate macro: undefined identifier `__in6_u`");
// /usr/include/netinet/in.h:234:10
pub const IN6ADDR_ANY_INIT = @compileError("unable to translate C expr: unexpected token '{'");
// /usr/include/netinet/in.h:241:9
pub const IN6ADDR_LOOPBACK_INIT = @compileError("unable to translate C expr: unexpected token '{'");
// /usr/include/netinet/in.h:242:9
pub const INET_ADDRSTRLEN = @as(c_int, 16);
pub const INET6_ADDRSTRLEN = @as(c_int, 46);
pub inline fn IP_MSFILTER_SIZE(numsrc: anytype) @TypeOf((@import("std").zig.c_translation.sizeof(struct_ip_msfilter) - @import("std").zig.c_translation.sizeof(struct_in_addr)) + (numsrc * @import("std").zig.c_translation.sizeof(struct_in_addr))) {
    _ = &numsrc;
    return (@import("std").zig.c_translation.sizeof(struct_ip_msfilter) - @import("std").zig.c_translation.sizeof(struct_in_addr)) + (numsrc * @import("std").zig.c_translation.sizeof(struct_in_addr));
}
pub inline fn GROUP_FILTER_SIZE(numsrc: anytype) @TypeOf((@import("std").zig.c_translation.sizeof(struct_group_filter) - @import("std").zig.c_translation.sizeof(struct_sockaddr_storage)) + (numsrc * @import("std").zig.c_translation.sizeof(struct_sockaddr_storage))) {
    _ = &numsrc;
    return (@import("std").zig.c_translation.sizeof(struct_group_filter) - @import("std").zig.c_translation.sizeof(struct_sockaddr_storage)) + (numsrc * @import("std").zig.c_translation.sizeof(struct_sockaddr_storage));
}
pub const IN6_IS_ADDR_UNSPECIFIED = @compileError("unable to translate macro: undefined identifier `__a`");
// /usr/include/netinet/in.h:437:10
pub const IN6_IS_ADDR_LOOPBACK = @compileError("unable to translate macro: undefined identifier `__a`");
// /usr/include/netinet/in.h:445:10
pub const IN6_IS_ADDR_LINKLOCAL = @compileError("unable to translate macro: undefined identifier `__a`");
// /usr/include/netinet/in.h:453:10
pub const IN6_IS_ADDR_SITELOCAL = @compileError("unable to translate macro: undefined identifier `__a`");
// /usr/include/netinet/in.h:458:10
pub const IN6_IS_ADDR_V4MAPPED = @compileError("unable to translate macro: undefined identifier `__a`");
// /usr/include/netinet/in.h:463:10
pub const IN6_IS_ADDR_V4COMPAT = @compileError("unable to translate macro: undefined identifier `__a`");
// /usr/include/netinet/in.h:470:10
pub const IN6_ARE_ADDR_EQUAL = @compileError("unable to translate macro: undefined identifier `__a`");
// /usr/include/netinet/in.h:478:10
pub const IN6_IS_ADDR_MULTICAST = @compileError("unable to translate C expr: unexpected token 'const'");
// /usr/include/netinet/in.h:525:9
pub const IN6_IS_ADDR_MC_NODELOCAL = @compileError("unable to translate C expr: unexpected token 'const'");
// /usr/include/netinet/in.h:537:9
pub const IN6_IS_ADDR_MC_LINKLOCAL = @compileError("unable to translate C expr: unexpected token 'const'");
// /usr/include/netinet/in.h:541:9
pub const IN6_IS_ADDR_MC_SITELOCAL = @compileError("unable to translate C expr: unexpected token 'const'");
// /usr/include/netinet/in.h:545:9
pub const IN6_IS_ADDR_MC_ORGLOCAL = @compileError("unable to translate C expr: unexpected token 'const'");
// /usr/include/netinet/in.h:549:9
pub const IN6_IS_ADDR_MC_GLOBAL = @compileError("unable to translate C expr: unexpected token 'const'");
// /usr/include/netinet/in.h:553:9
pub const _NETINET_TCP_H = @as(c_int, 1);
pub const TCP_NODELAY = @as(c_int, 1);
pub const TCP_MAXSEG = @as(c_int, 2);
pub const TCP_CORK = @as(c_int, 3);
pub const TCP_KEEPIDLE = @as(c_int, 4);
pub const TCP_KEEPINTVL = @as(c_int, 5);
pub const TCP_KEEPCNT = @as(c_int, 6);
pub const TCP_SYNCNT = @as(c_int, 7);
pub const TCP_LINGER2 = @as(c_int, 8);
pub const TCP_DEFER_ACCEPT = @as(c_int, 9);
pub const TCP_WINDOW_CLAMP = @as(c_int, 10);
pub const TCP_INFO = @as(c_int, 11);
pub const TCP_QUICKACK = @as(c_int, 12);
pub const TCP_CONGESTION = @as(c_int, 13);
pub const TCP_MD5SIG = @as(c_int, 14);
pub const TCP_COOKIE_TRANSACTIONS = @as(c_int, 15);
pub const TCP_THIN_LINEAR_TIMEOUTS = @as(c_int, 16);
pub const TCP_THIN_DUPACK = @as(c_int, 17);
pub const TCP_USER_TIMEOUT = @as(c_int, 18);
pub const TCP_REPAIR = @as(c_int, 19);
pub const TCP_REPAIR_QUEUE = @as(c_int, 20);
pub const TCP_QUEUE_SEQ = @as(c_int, 21);
pub const TCP_REPAIR_OPTIONS = @as(c_int, 22);
pub const TCP_FASTOPEN = @as(c_int, 23);
pub const TCP_TIMESTAMP = @as(c_int, 24);
pub const TCP_NOTSENT_LOWAT = @as(c_int, 25);
pub const TCP_CC_INFO = @as(c_int, 26);
pub const TCP_SAVE_SYN = @as(c_int, 27);
pub const TCP_SAVED_SYN = @as(c_int, 28);
pub const TCP_REPAIR_WINDOW = @as(c_int, 29);
pub const TCP_FASTOPEN_CONNECT = @as(c_int, 30);
pub const TCP_ULP = @as(c_int, 31);
pub const TCP_MD5SIG_EXT = @as(c_int, 32);
pub const TCP_FASTOPEN_KEY = @as(c_int, 33);
pub const TCP_FASTOPEN_NO_COOKIE = @as(c_int, 34);
pub const TCP_ZEROCOPY_RECEIVE = @as(c_int, 35);
pub const TCP_INQ = @as(c_int, 36);
pub const TCP_CM_INQ = TCP_INQ;
pub const TCP_TX_DELAY = @as(c_int, 37);
pub const TCP_REPAIR_ON = @as(c_int, 1);
pub const TCP_REPAIR_OFF = @as(c_int, 0);
pub const TCP_REPAIR_OFF_NO_WP = -@as(c_int, 1);
pub const TH_FIN = @as(c_int, 0x01);
pub const TH_SYN = @as(c_int, 0x02);
pub const TH_RST = @as(c_int, 0x04);
pub const TH_PUSH = @as(c_int, 0x08);
pub const TH_ACK = @as(c_int, 0x10);
pub const TH_URG = @as(c_int, 0x20);
pub const TCPOPT_EOL = @as(c_int, 0);
pub const TCPOPT_NOP = @as(c_int, 1);
pub const TCPOPT_MAXSEG = @as(c_int, 2);
pub const TCPOLEN_MAXSEG = @as(c_int, 4);
pub const TCPOPT_WINDOW = @as(c_int, 3);
pub const TCPOLEN_WINDOW = @as(c_int, 3);
pub const TCPOPT_SACK_PERMITTED = @as(c_int, 4);
pub const TCPOLEN_SACK_PERMITTED = @as(c_int, 2);
pub const TCPOPT_SACK = @as(c_int, 5);
pub const TCPOPT_TIMESTAMP = @as(c_int, 8);
pub const TCPOLEN_TIMESTAMP = @as(c_int, 10);
pub const TCPOLEN_TSTAMP_APPA = TCPOLEN_TIMESTAMP + @as(c_int, 2);
pub const TCPOPT_TSTAMP_HDR = (((TCPOPT_NOP << @as(c_int, 24)) | (TCPOPT_NOP << @as(c_int, 16))) | (TCPOPT_TIMESTAMP << @as(c_int, 8))) | TCPOLEN_TIMESTAMP;
pub const TCP_MSS = @as(c_int, 512);
pub const TCP_MAXWIN = @import("std").zig.c_translation.promoteIntLiteral(c_int, 65535, .decimal);
pub const TCP_MAX_WINSHIFT = @as(c_int, 14);
pub const SOL_TCP = @as(c_int, 6);
pub const TCPI_OPT_TIMESTAMPS = @as(c_int, 1);
pub const TCPI_OPT_SACK = @as(c_int, 2);
pub const TCPI_OPT_WSCALE = @as(c_int, 4);
pub const TCPI_OPT_ECN = @as(c_int, 8);
pub const TCPI_OPT_ECN_SEEN = @as(c_int, 16);
pub const TCPI_OPT_SYN_DATA = @as(c_int, 32);
pub const TCP_MD5SIG_MAXKEYLEN = @as(c_int, 80);
pub const TCP_MD5SIG_FLAG_PREFIX = @as(c_int, 1);
pub const TCP_MD5SIG_FLAG_IFINDEX = @as(c_int, 2);
pub const TCP_COOKIE_MIN = @as(c_int, 8);
pub const TCP_COOKIE_MAX = @as(c_int, 16);
pub const TCP_COOKIE_PAIR_SIZE = @as(c_int, 2) * TCP_COOKIE_MAX;
pub const TCP_COOKIE_IN_ALWAYS = @as(c_int, 1) << @as(c_int, 0);
pub const TCP_COOKIE_OUT_NEVER = @as(c_int, 1) << @as(c_int, 1);
pub const TCP_S_DATA_IN = @as(c_int, 1) << @as(c_int, 2);
pub const TCP_S_DATA_OUT = @as(c_int, 1) << @as(c_int, 3);
pub const TCP_MSS_DEFAULT = @as(c_uint, 536);
pub const TCP_MSS_DESIRED = @as(c_uint, 1220);
pub const _ARPA_INET_H = @as(c_int, 1);
pub const _NETDB_H = @as(c_int, 1);
pub const _RPC_NETDB_H = @as(c_int, 1);
pub const _PATH_HEQUIV = "/etc/hosts.equiv";
pub const _PATH_HOSTS = "/etc/hosts";
pub const _PATH_NETWORKS = "/etc/networks";
pub const _PATH_NSSWITCH_CONF = "/etc/nsswitch.conf";
pub const _PATH_PROTOCOLS = "/etc/protocols";
pub const _PATH_SERVICES = "/etc/services";
pub const h_errno = __h_errno_location().*;
pub const HOST_NOT_FOUND = @as(c_int, 1);
pub const TRY_AGAIN = @as(c_int, 2);
pub const NO_RECOVERY = @as(c_int, 3);
pub const NO_DATA = @as(c_int, 4);
pub const NETDB_INTERNAL = -@as(c_int, 1);
pub const NETDB_SUCCESS = @as(c_int, 0);
pub const NO_ADDRESS = NO_DATA;
pub const h_addr = @compileError("unable to translate macro: undefined identifier `h_addr_list`");
// /usr/include/netdb.h:106:10
pub const AI_PASSIVE = @as(c_int, 0x0001);
pub const AI_CANONNAME = @as(c_int, 0x0002);
pub const AI_NUMERICHOST = @as(c_int, 0x0004);
pub const AI_V4MAPPED = @as(c_int, 0x0008);
pub const AI_ALL = @as(c_int, 0x0010);
pub const AI_ADDRCONFIG = @as(c_int, 0x0020);
pub const AI_NUMERICSERV = @as(c_int, 0x0400);
pub const EAI_BADFLAGS = -@as(c_int, 1);
pub const EAI_NONAME = -@as(c_int, 2);
pub const EAI_AGAIN = -@as(c_int, 3);
pub const EAI_FAIL = -@as(c_int, 4);
pub const EAI_FAMILY = -@as(c_int, 6);
pub const EAI_SOCKTYPE = -@as(c_int, 7);
pub const EAI_SERVICE = -@as(c_int, 8);
pub const EAI_MEMORY = -@as(c_int, 10);
pub const EAI_SYSTEM = -@as(c_int, 11);
pub const EAI_OVERFLOW = -@as(c_int, 12);
pub const NI_MAXHOST = @as(c_int, 1025);
pub const NI_MAXSERV = @as(c_int, 32);
pub const NI_NUMERICHOST = @as(c_int, 1);
pub const NI_NUMERICSERV = @as(c_int, 2);
pub const NI_NOFQDN = @as(c_int, 4);
pub const NI_NAMEREQD = @as(c_int, 8);
pub const NI_DGRAM = @as(c_int, 16);
pub const _UNISTD_H = @as(c_int, 1);
pub const _POSIX_VERSION = @as(c_long, 200809);
pub const __POSIX2_THIS_VERSION = @as(c_long, 200809);
pub const _POSIX2_VERSION = __POSIX2_THIS_VERSION;
pub const _POSIX2_C_VERSION = __POSIX2_THIS_VERSION;
pub const _POSIX2_C_BIND = __POSIX2_THIS_VERSION;
pub const _POSIX2_C_DEV = __POSIX2_THIS_VERSION;
pub const _POSIX2_SW_DEV = __POSIX2_THIS_VERSION;
pub const _POSIX2_LOCALEDEF = __POSIX2_THIS_VERSION;
pub const _XOPEN_VERSION = @as(c_int, 700);
pub const _XOPEN_XCU_VERSION = @as(c_int, 4);
pub const _XOPEN_XPG2 = @as(c_int, 1);
pub const _XOPEN_XPG3 = @as(c_int, 1);
pub const _XOPEN_XPG4 = @as(c_int, 1);
pub const _XOPEN_UNIX = @as(c_int, 1);
pub const _XOPEN_ENH_I18N = @as(c_int, 1);
pub const _XOPEN_LEGACY = @as(c_int, 1);
pub const _BITS_POSIX_OPT_H = @as(c_int, 1);
pub const _POSIX_JOB_CONTROL = @as(c_int, 1);
pub const _POSIX_SAVED_IDS = @as(c_int, 1);
pub const _POSIX_PRIORITY_SCHEDULING = @as(c_long, 200809);
pub const _POSIX_SYNCHRONIZED_IO = @as(c_long, 200809);
pub const _POSIX_FSYNC = @as(c_long, 200809);
pub const _POSIX_MAPPED_FILES = @as(c_long, 200809);
pub const _POSIX_MEMLOCK = @as(c_long, 200809);
pub const _POSIX_MEMLOCK_RANGE = @as(c_long, 200809);
pub const _POSIX_MEMORY_PROTECTION = @as(c_long, 200809);
pub const _POSIX_CHOWN_RESTRICTED = @as(c_int, 0);
pub const _POSIX_VDISABLE = '\x00';
pub const _POSIX_NO_TRUNC = @as(c_int, 1);
pub const _XOPEN_REALTIME = @as(c_int, 1);
pub const _XOPEN_REALTIME_THREADS = @as(c_int, 1);
pub const _XOPEN_SHM = @as(c_int, 1);
pub const _POSIX_THREADS = @as(c_long, 200809);
pub const _POSIX_REENTRANT_FUNCTIONS = @as(c_int, 1);
pub const _POSIX_THREAD_SAFE_FUNCTIONS = @as(c_long, 200809);
pub const _POSIX_THREAD_PRIORITY_SCHEDULING = @as(c_long, 200809);
pub const _POSIX_THREAD_ATTR_STACKSIZE = @as(c_long, 200809);
pub const _POSIX_THREAD_ATTR_STACKADDR = @as(c_long, 200809);
pub const _POSIX_THREAD_PRIO_INHERIT = @as(c_long, 200809);
pub const _POSIX_THREAD_PRIO_PROTECT = @as(c_long, 200809);
pub const _POSIX_THREAD_ROBUST_PRIO_INHERIT = @as(c_long, 200809);
pub const _POSIX_THREAD_ROBUST_PRIO_PROTECT = -@as(c_int, 1);
pub const _POSIX_SEMAPHORES = @as(c_long, 200809);
pub const _POSIX_REALTIME_SIGNALS = @as(c_long, 200809);
pub const _POSIX_ASYNCHRONOUS_IO = @as(c_long, 200809);
pub const _POSIX_ASYNC_IO = @as(c_int, 1);
pub const _LFS_ASYNCHRONOUS_IO = @as(c_int, 1);
pub const _POSIX_PRIORITIZED_IO = @as(c_long, 200809);
pub const _LFS64_ASYNCHRONOUS_IO = @as(c_int, 1);
pub const _LFS_LARGEFILE = @as(c_int, 1);
pub const _LFS64_LARGEFILE = @as(c_int, 1);
pub const _LFS64_STDIO = @as(c_int, 1);
pub const _POSIX_SHARED_MEMORY_OBJECTS = @as(c_long, 200809);
pub const _POSIX_CPUTIME = @as(c_int, 0);
pub const _POSIX_THREAD_CPUTIME = @as(c_int, 0);
pub const _POSIX_REGEXP = @as(c_int, 1);
pub const _POSIX_READER_WRITER_LOCKS = @as(c_long, 200809);
pub const _POSIX_SHELL = @as(c_int, 1);
pub const _POSIX_TIMEOUTS = @as(c_long, 200809);
pub const _POSIX_SPIN_LOCKS = @as(c_long, 200809);
pub const _POSIX_SPAWN = @as(c_long, 200809);
pub const _POSIX_TIMERS = @as(c_long, 200809);
pub const _POSIX_BARRIERS = @as(c_long, 200809);
pub const _POSIX_MESSAGE_PASSING = @as(c_long, 200809);
pub const _POSIX_THREAD_PROCESS_SHARED = @as(c_long, 200809);
pub const _POSIX_MONOTONIC_CLOCK = @as(c_int, 0);
pub const _POSIX_CLOCK_SELECTION = @as(c_long, 200809);
pub const _POSIX_ADVISORY_INFO = @as(c_long, 200809);
pub const _POSIX_IPV6 = @as(c_long, 200809);
pub const _POSIX_RAW_SOCKETS = @as(c_long, 200809);
pub const _POSIX2_CHAR_TERM = @as(c_long, 200809);
pub const _POSIX_SPORADIC_SERVER = -@as(c_int, 1);
pub const _POSIX_THREAD_SPORADIC_SERVER = -@as(c_int, 1);
pub const _POSIX_TRACE = -@as(c_int, 1);
pub const _POSIX_TRACE_EVENT_FILTER = -@as(c_int, 1);
pub const _POSIX_TRACE_INHERIT = -@as(c_int, 1);
pub const _POSIX_TRACE_LOG = -@as(c_int, 1);
pub const _POSIX_TYPED_MEMORY_OBJECTS = -@as(c_int, 1);
pub const _POSIX_V7_ILP32_OFF32 = -@as(c_int, 1);
pub const _POSIX_V7_ILP32_OFFBIG = -@as(c_int, 1);
pub const _POSIX_V6_ILP32_OFF32 = -@as(c_int, 1);
pub const _POSIX_V6_ILP32_OFFBIG = -@as(c_int, 1);
pub const _XBS5_ILP32_OFF32 = -@as(c_int, 1);
pub const _XBS5_ILP32_OFFBIG = -@as(c_int, 1);
pub const _POSIX_V7_LPBIG_OFFBIG = -@as(c_int, 1);
pub const _POSIX_V6_LPBIG_OFFBIG = -@as(c_int, 1);
pub const _XBS5_LPBIG_OFFBIG = -@as(c_int, 1);
pub const _POSIX_V7_LP64_OFF64 = @as(c_int, 1);
pub const _POSIX_V6_LP64_OFF64 = @as(c_int, 1);
pub const _XBS5_LP64_OFF64 = @as(c_int, 1);
pub const STDIN_FILENO = @as(c_int, 0);
pub const STDOUT_FILENO = @as(c_int, 1);
pub const STDERR_FILENO = @as(c_int, 2);
pub const __useconds_t_defined = "";
pub const R_OK = @as(c_int, 4);
pub const W_OK = @as(c_int, 2);
pub const X_OK = @as(c_int, 1);
pub const F_OK = @as(c_int, 0);
pub const SEEK_SET = @as(c_int, 0);
pub const SEEK_CUR = @as(c_int, 1);
pub const SEEK_END = @as(c_int, 2);
pub const L_SET = SEEK_SET;
pub const L_INCR = SEEK_CUR;
pub const L_XTND = SEEK_END;
pub const _SC_PAGE_SIZE = _SC_PAGESIZE;
pub const _CS_POSIX_V6_WIDTH_RESTRICTED_ENVS = _CS_V6_WIDTH_RESTRICTED_ENVS;
pub const _CS_POSIX_V5_WIDTH_RESTRICTED_ENVS = _CS_V5_WIDTH_RESTRICTED_ENVS;
pub const _CS_POSIX_V7_WIDTH_RESTRICTED_ENVS = _CS_V7_WIDTH_RESTRICTED_ENVS;
pub const _GETOPT_POSIX_H = @as(c_int, 1);
pub const _GETOPT_CORE_H = @as(c_int, 1);
pub const F_ULOCK = @as(c_int, 0);
pub const F_LOCK = @as(c_int, 1);
pub const F_TLOCK = @as(c_int, 2);
pub const F_TEST = @as(c_int, 3);
pub const _FCNTL_H = @as(c_int, 1);
pub const __O_DIRECTORY = @as(c_int, 0o40000);
pub const __O_NOFOLLOW = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0o100000, .octal);
pub const __O_DIRECT = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0o200000, .octal);
pub const __O_LARGEFILE = @as(c_int, 0);
pub const F_GETLK64 = @as(c_int, 5);
pub const F_SETLK64 = @as(c_int, 6);
pub const F_SETLKW64 = @as(c_int, 7);
pub const O_ACCMODE = @as(c_int, 0o003);
pub const O_RDONLY = @as(c_int, 0o0);
pub const O_WRONLY = @as(c_int, 0o1);
pub const O_RDWR = @as(c_int, 0o2);
pub const O_CREAT = @as(c_int, 0o100);
pub const O_EXCL = @as(c_int, 0o200);
pub const O_NOCTTY = @as(c_int, 0o400);
pub const O_TRUNC = @as(c_int, 0o1000);
pub const O_APPEND = @as(c_int, 0o2000);
pub const O_NONBLOCK = @as(c_int, 0o4000);
pub const O_NDELAY = O_NONBLOCK;
pub const O_SYNC = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0o4010000, .octal);
pub const O_FSYNC = O_SYNC;
pub const O_ASYNC = @as(c_int, 0o20000);
pub const __O_CLOEXEC = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0o2000000, .octal);
pub const __O_NOATIME = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0o1000000, .octal);
pub const __O_PATH = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0o10000000, .octal);
pub const __O_DSYNC = @as(c_int, 0o10000);
pub const __O_TMPFILE = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0o20000000, .octal) | __O_DIRECTORY;
pub const F_GETLK = F_GETLK64;
pub const F_SETLK = F_SETLK64;
pub const F_SETLKW = F_SETLKW64;
pub const O_DIRECTORY = __O_DIRECTORY;
pub const O_NOFOLLOW = __O_NOFOLLOW;
pub const O_CLOEXEC = __O_CLOEXEC;
pub const O_DSYNC = __O_DSYNC;
pub const O_RSYNC = O_SYNC;
pub const F_DUPFD = @as(c_int, 0);
pub const F_GETFD = @as(c_int, 1);
pub const F_SETFD = @as(c_int, 2);
pub const F_GETFL = @as(c_int, 3);
pub const F_SETFL = @as(c_int, 4);
pub const __F_SETOWN = @as(c_int, 8);
pub const __F_GETOWN = @as(c_int, 9);
pub const F_SETOWN = __F_SETOWN;
pub const F_GETOWN = __F_GETOWN;
pub const __F_SETSIG = @as(c_int, 10);
pub const __F_GETSIG = @as(c_int, 11);
pub const __F_SETOWN_EX = @as(c_int, 15);
pub const __F_GETOWN_EX = @as(c_int, 16);
pub const F_DUPFD_CLOEXEC = @as(c_int, 1030);
pub const FD_CLOEXEC = @as(c_int, 1);
pub const F_RDLCK = @as(c_int, 0);
pub const F_WRLCK = @as(c_int, 1);
pub const F_UNLCK = @as(c_int, 2);
pub const F_EXLCK = @as(c_int, 4);
pub const F_SHLCK = @as(c_int, 8);
pub const LOCK_SH = @as(c_int, 1);
pub const LOCK_EX = @as(c_int, 2);
pub const LOCK_NB = @as(c_int, 4);
pub const LOCK_UN = @as(c_int, 8);
pub const FAPPEND = O_APPEND;
pub const FFSYNC = O_FSYNC;
pub const FASYNC = O_ASYNC;
pub const FNONBLOCK = O_NONBLOCK;
pub const FNDELAY = O_NDELAY;
pub const __POSIX_FADV_DONTNEED = @as(c_int, 4);
pub const __POSIX_FADV_NOREUSE = @as(c_int, 5);
pub const POSIX_FADV_NORMAL = @as(c_int, 0);
pub const POSIX_FADV_RANDOM = @as(c_int, 1);
pub const POSIX_FADV_SEQUENTIAL = @as(c_int, 2);
pub const POSIX_FADV_WILLNEED = @as(c_int, 3);
pub const POSIX_FADV_DONTNEED = __POSIX_FADV_DONTNEED;
pub const POSIX_FADV_NOREUSE = __POSIX_FADV_NOREUSE;
pub inline fn __OPEN_NEEDS_MODE(oflag: anytype) @TypeOf(((oflag & O_CREAT) != @as(c_int, 0)) or ((oflag & __O_TMPFILE) == __O_TMPFILE)) {
    _ = &oflag;
    return ((oflag & O_CREAT) != @as(c_int, 0)) or ((oflag & __O_TMPFILE) == __O_TMPFILE);
}
pub const _BITS_STAT_H = @as(c_int, 1);
pub const _BITS_STRUCT_STAT_H = @as(c_int, 1);
pub inline fn __field64(@"type": anytype, type64: anytype, name: anytype) @TypeOf(@"type" ++ name) {
    _ = &@"type";
    _ = &type64;
    _ = &name;
    return @"type" ++ name;
}
pub const st_atime = @compileError("unable to translate macro: undefined identifier `st_atim`");
// /usr/include/aarch64-linux-gnu/bits/struct_stat.h:68:10
pub const st_mtime = @compileError("unable to translate macro: undefined identifier `st_mtim`");
// /usr/include/aarch64-linux-gnu/bits/struct_stat.h:69:10
pub const st_ctime = @compileError("unable to translate macro: undefined identifier `st_ctim`");
// /usr/include/aarch64-linux-gnu/bits/struct_stat.h:70:10
pub const _STATBUF_ST_BLKSIZE = "";
pub const _STATBUF_ST_RDEV = "";
pub const _STATBUF_ST_NSEC = "";
pub const __S_IFMT = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0o170000, .octal);
pub const __S_IFDIR = @as(c_int, 0o040000);
pub const __S_IFCHR = @as(c_int, 0o020000);
pub const __S_IFBLK = @as(c_int, 0o060000);
pub const __S_IFREG = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0o100000, .octal);
pub const __S_IFIFO = @as(c_int, 0o010000);
pub const __S_IFLNK = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0o120000, .octal);
pub const __S_IFSOCK = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0o140000, .octal);
pub inline fn __S_TYPEISMQ(buf: anytype) @TypeOf(buf.*.st_mode - buf.*.st_mode) {
    _ = &buf;
    return buf.*.st_mode - buf.*.st_mode;
}
pub inline fn __S_TYPEISSEM(buf: anytype) @TypeOf(buf.*.st_mode - buf.*.st_mode) {
    _ = &buf;
    return buf.*.st_mode - buf.*.st_mode;
}
pub inline fn __S_TYPEISSHM(buf: anytype) @TypeOf(buf.*.st_mode - buf.*.st_mode) {
    _ = &buf;
    return buf.*.st_mode - buf.*.st_mode;
}
pub const __S_ISUID = @as(c_int, 0o4000);
pub const __S_ISGID = @as(c_int, 0o2000);
pub const __S_ISVTX = @as(c_int, 0o1000);
pub const __S_IREAD = @as(c_int, 0o400);
pub const __S_IWRITE = @as(c_int, 0o200);
pub const __S_IEXEC = @as(c_int, 0o100);
pub const UTIME_NOW = (@as(c_long, 1) << @as(c_int, 30)) - @as(c_long, 1);
pub const UTIME_OMIT = (@as(c_long, 1) << @as(c_int, 30)) - @as(c_long, 2);
pub const S_IFMT = __S_IFMT;
pub const S_IFDIR = __S_IFDIR;
pub const S_IFCHR = __S_IFCHR;
pub const S_IFBLK = __S_IFBLK;
pub const S_IFREG = __S_IFREG;
pub const S_IFIFO = __S_IFIFO;
pub const S_IFLNK = __S_IFLNK;
pub const S_IFSOCK = __S_IFSOCK;
pub const S_ISUID = __S_ISUID;
pub const S_ISGID = __S_ISGID;
pub const S_ISVTX = __S_ISVTX;
pub const S_IRUSR = __S_IREAD;
pub const S_IWUSR = __S_IWRITE;
pub const S_IXUSR = __S_IEXEC;
pub const S_IRWXU = (__S_IREAD | __S_IWRITE) | __S_IEXEC;
pub const S_IRGRP = S_IRUSR >> @as(c_int, 3);
pub const S_IWGRP = S_IWUSR >> @as(c_int, 3);
pub const S_IXGRP = S_IXUSR >> @as(c_int, 3);
pub const S_IRWXG = S_IRWXU >> @as(c_int, 3);
pub const S_IROTH = S_IRGRP >> @as(c_int, 3);
pub const S_IWOTH = S_IWGRP >> @as(c_int, 3);
pub const S_IXOTH = S_IXGRP >> @as(c_int, 3);
pub const S_IRWXO = S_IRWXG >> @as(c_int, 3);
pub const AT_FDCWD = -@as(c_int, 100);
pub const AT_SYMLINK_NOFOLLOW = @as(c_int, 0x100);
pub const AT_REMOVEDIR = @as(c_int, 0x200);
pub const AT_SYMLINK_FOLLOW = @as(c_int, 0x400);
pub const AT_EACCESS = @as(c_int, 0x200);
pub const _ERRNO_H = @as(c_int, 1);
pub const _BITS_ERRNO_H = @as(c_int, 1);
pub const _ASM_GENERIC_ERRNO_H = "";
pub const _ASM_GENERIC_ERRNO_BASE_H = "";
pub const EPERM = @as(c_int, 1);
pub const ENOENT = @as(c_int, 2);
pub const ESRCH = @as(c_int, 3);
pub const EINTR = @as(c_int, 4);
pub const EIO = @as(c_int, 5);
pub const ENXIO = @as(c_int, 6);
pub const E2BIG = @as(c_int, 7);
pub const ENOEXEC = @as(c_int, 8);
pub const EBADF = @as(c_int, 9);
pub const ECHILD = @as(c_int, 10);
pub const EAGAIN = @as(c_int, 11);
pub const ENOMEM = @as(c_int, 12);
pub const EACCES = @as(c_int, 13);
pub const EFAULT = @as(c_int, 14);
pub const ENOTBLK = @as(c_int, 15);
pub const EBUSY = @as(c_int, 16);
pub const EEXIST = @as(c_int, 17);
pub const EXDEV = @as(c_int, 18);
pub const ENODEV = @as(c_int, 19);
pub const ENOTDIR = @as(c_int, 20);
pub const EISDIR = @as(c_int, 21);
pub const EINVAL = @as(c_int, 22);
pub const ENFILE = @as(c_int, 23);
pub const EMFILE = @as(c_int, 24);
pub const ENOTTY = @as(c_int, 25);
pub const ETXTBSY = @as(c_int, 26);
pub const EFBIG = @as(c_int, 27);
pub const ENOSPC = @as(c_int, 28);
pub const ESPIPE = @as(c_int, 29);
pub const EROFS = @as(c_int, 30);
pub const EMLINK = @as(c_int, 31);
pub const EPIPE = @as(c_int, 32);
pub const EDOM = @as(c_int, 33);
pub const ERANGE = @as(c_int, 34);
pub const EDEADLK = @as(c_int, 35);
pub const ENAMETOOLONG = @as(c_int, 36);
pub const ENOLCK = @as(c_int, 37);
pub const ENOSYS = @as(c_int, 38);
pub const ENOTEMPTY = @as(c_int, 39);
pub const ELOOP = @as(c_int, 40);
pub const EWOULDBLOCK = EAGAIN;
pub const ENOMSG = @as(c_int, 42);
pub const EIDRM = @as(c_int, 43);
pub const ECHRNG = @as(c_int, 44);
pub const EL2NSYNC = @as(c_int, 45);
pub const EL3HLT = @as(c_int, 46);
pub const EL3RST = @as(c_int, 47);
pub const ELNRNG = @as(c_int, 48);
pub const EUNATCH = @as(c_int, 49);
pub const ENOCSI = @as(c_int, 50);
pub const EL2HLT = @as(c_int, 51);
pub const EBADE = @as(c_int, 52);
pub const EBADR = @as(c_int, 53);
pub const EXFULL = @as(c_int, 54);
pub const ENOANO = @as(c_int, 55);
pub const EBADRQC = @as(c_int, 56);
pub const EBADSLT = @as(c_int, 57);
pub const EDEADLOCK = EDEADLK;
pub const EBFONT = @as(c_int, 59);
pub const ENOSTR = @as(c_int, 60);
pub const ENODATA = @as(c_int, 61);
pub const ETIME = @as(c_int, 62);
pub const ENOSR = @as(c_int, 63);
pub const ENONET = @as(c_int, 64);
pub const ENOPKG = @as(c_int, 65);
pub const EREMOTE = @as(c_int, 66);
pub const ENOLINK = @as(c_int, 67);
pub const EADV = @as(c_int, 68);
pub const ESRMNT = @as(c_int, 69);
pub const ECOMM = @as(c_int, 70);
pub const EPROTO = @as(c_int, 71);
pub const EMULTIHOP = @as(c_int, 72);
pub const EDOTDOT = @as(c_int, 73);
pub const EBADMSG = @as(c_int, 74);
pub const EOVERFLOW = @as(c_int, 75);
pub const ENOTUNIQ = @as(c_int, 76);
pub const EBADFD = @as(c_int, 77);
pub const EREMCHG = @as(c_int, 78);
pub const ELIBACC = @as(c_int, 79);
pub const ELIBBAD = @as(c_int, 80);
pub const ELIBSCN = @as(c_int, 81);
pub const ELIBMAX = @as(c_int, 82);
pub const ELIBEXEC = @as(c_int, 83);
pub const EILSEQ = @as(c_int, 84);
pub const ERESTART = @as(c_int, 85);
pub const ESTRPIPE = @as(c_int, 86);
pub const EUSERS = @as(c_int, 87);
pub const ENOTSOCK = @as(c_int, 88);
pub const EDESTADDRREQ = @as(c_int, 89);
pub const EMSGSIZE = @as(c_int, 90);
pub const EPROTOTYPE = @as(c_int, 91);
pub const ENOPROTOOPT = @as(c_int, 92);
pub const EPROTONOSUPPORT = @as(c_int, 93);
pub const ESOCKTNOSUPPORT = @as(c_int, 94);
pub const EOPNOTSUPP = @as(c_int, 95);
pub const EPFNOSUPPORT = @as(c_int, 96);
pub const EAFNOSUPPORT = @as(c_int, 97);
pub const EADDRINUSE = @as(c_int, 98);
pub const EADDRNOTAVAIL = @as(c_int, 99);
pub const ENETDOWN = @as(c_int, 100);
pub const ENETUNREACH = @as(c_int, 101);
pub const ENETRESET = @as(c_int, 102);
pub const ECONNABORTED = @as(c_int, 103);
pub const ECONNRESET = @as(c_int, 104);
pub const ENOBUFS = @as(c_int, 105);
pub const EISCONN = @as(c_int, 106);
pub const ENOTCONN = @as(c_int, 107);
pub const ESHUTDOWN = @as(c_int, 108);
pub const ETOOMANYREFS = @as(c_int, 109);
pub const ETIMEDOUT = @as(c_int, 110);
pub const ECONNREFUSED = @as(c_int, 111);
pub const EHOSTDOWN = @as(c_int, 112);
pub const EHOSTUNREACH = @as(c_int, 113);
pub const EALREADY = @as(c_int, 114);
pub const EINPROGRESS = @as(c_int, 115);
pub const ESTALE = @as(c_int, 116);
pub const EUCLEAN = @as(c_int, 117);
pub const ENOTNAM = @as(c_int, 118);
pub const ENAVAIL = @as(c_int, 119);
pub const EISNAM = @as(c_int, 120);
pub const EREMOTEIO = @as(c_int, 121);
pub const EDQUOT = @as(c_int, 122);
pub const ENOMEDIUM = @as(c_int, 123);
pub const EMEDIUMTYPE = @as(c_int, 124);
pub const ECANCELED = @as(c_int, 125);
pub const ENOKEY = @as(c_int, 126);
pub const EKEYEXPIRED = @as(c_int, 127);
pub const EKEYREVOKED = @as(c_int, 128);
pub const EKEYREJECTED = @as(c_int, 129);
pub const EOWNERDEAD = @as(c_int, 130);
pub const ENOTRECOVERABLE = @as(c_int, 131);
pub const ERFKILL = @as(c_int, 132);
pub const EHWPOISON = @as(c_int, 133);
pub const ENOTSUP = EOPNOTSUPP;
pub const errno = __errno_location().*;
pub const _SIGNAL_H = "";
pub const _BITS_SIGNUM_GENERIC_H = @as(c_int, 1);
pub const SIG_ERR = @import("std").zig.c_translation.cast(__sighandler_t, -@as(c_int, 1));
pub const SIG_DFL = @import("std").zig.c_translation.cast(__sighandler_t, @as(c_int, 0));
pub const SIG_IGN = @import("std").zig.c_translation.cast(__sighandler_t, @as(c_int, 1));
pub const SIGINT = @as(c_int, 2);
pub const SIGILL = @as(c_int, 4);
pub const SIGABRT = @as(c_int, 6);
pub const SIGFPE = @as(c_int, 8);
pub const SIGSEGV = @as(c_int, 11);
pub const SIGTERM = @as(c_int, 15);
pub const SIGHUP = @as(c_int, 1);
pub const SIGQUIT = @as(c_int, 3);
pub const SIGTRAP = @as(c_int, 5);
pub const SIGKILL = @as(c_int, 9);
pub const SIGPIPE = @as(c_int, 13);
pub const SIGALRM = @as(c_int, 14);
pub const SIGIO = SIGPOLL;
pub const SIGIOT = SIGABRT;
pub const SIGCLD = SIGCHLD;
pub const _BITS_SIGNUM_ARCH_H = @as(c_int, 1);
pub const SIGSTKFLT = @as(c_int, 16);
pub const SIGPWR = @as(c_int, 30);
pub const SIGBUS = @as(c_int, 7);
pub const SIGSYS = @as(c_int, 31);
pub const SIGURG = @as(c_int, 23);
pub const SIGSTOP = @as(c_int, 19);
pub const SIGTSTP = @as(c_int, 20);
pub const SIGCONT = @as(c_int, 18);
pub const SIGCHLD = @as(c_int, 17);
pub const SIGTTIN = @as(c_int, 21);
pub const SIGTTOU = @as(c_int, 22);
pub const SIGPOLL = @as(c_int, 29);
pub const SIGXFSZ = @as(c_int, 25);
pub const SIGXCPU = @as(c_int, 24);
pub const SIGVTALRM = @as(c_int, 26);
pub const SIGPROF = @as(c_int, 27);
pub const SIGUSR1 = @as(c_int, 10);
pub const SIGUSR2 = @as(c_int, 12);
pub const SIGWINCH = @as(c_int, 28);
pub const __SIGRTMIN = @as(c_int, 32);
pub const __SIGRTMAX = @as(c_int, 64);
pub const _NSIG = __SIGRTMAX + @as(c_int, 1);
pub const __sig_atomic_t_defined = @as(c_int, 1);
pub const __siginfo_t_defined = @as(c_int, 1);
pub const ____sigval_t_defined = "";
pub const __SI_MAX_SIZE = @as(c_int, 128);
pub const __SI_PAD_SIZE = @import("std").zig.c_translation.MacroArithmetic.div(__SI_MAX_SIZE, @import("std").zig.c_translation.sizeof(c_int)) - @as(c_int, 4);
pub const _BITS_SIGINFO_ARCH_H = @as(c_int, 1);
pub const __SI_ALIGNMENT = "";
pub const __SI_BAND_TYPE = c_long;
pub const __SI_CLOCK_T = __clock_t;
pub const __SI_ERRNO_THEN_CODE = @as(c_int, 1);
pub const __SI_HAVE_SIGSYS = @as(c_int, 1);
pub const __SI_SIGFAULT_ADDL = "";
pub const si_pid = @compileError("unable to translate macro: undefined identifier `_sifields`");
// /usr/include/aarch64-linux-gnu/bits/types/siginfo_t.h:128:9
pub const si_uid = @compileError("unable to translate macro: undefined identifier `_sifields`");
// /usr/include/aarch64-linux-gnu/bits/types/siginfo_t.h:129:9
pub const si_timerid = @compileError("unable to translate macro: undefined identifier `_sifields`");
// /usr/include/aarch64-linux-gnu/bits/types/siginfo_t.h:130:9
pub const si_overrun = @compileError("unable to translate macro: undefined identifier `_sifields`");
// /usr/include/aarch64-linux-gnu/bits/types/siginfo_t.h:131:9
pub const si_status = @compileError("unable to translate macro: undefined identifier `_sifields`");
// /usr/include/aarch64-linux-gnu/bits/types/siginfo_t.h:132:9
pub const si_utime = @compileError("unable to translate macro: undefined identifier `_sifields`");
// /usr/include/aarch64-linux-gnu/bits/types/siginfo_t.h:133:9
pub const si_stime = @compileError("unable to translate macro: undefined identifier `_sifields`");
// /usr/include/aarch64-linux-gnu/bits/types/siginfo_t.h:134:9
pub const si_value = @compileError("unable to translate macro: undefined identifier `_sifields`");
// /usr/include/aarch64-linux-gnu/bits/types/siginfo_t.h:135:9
pub const si_int = @compileError("unable to translate macro: undefined identifier `_sifields`");
// /usr/include/aarch64-linux-gnu/bits/types/siginfo_t.h:136:9
pub const si_ptr = @compileError("unable to translate macro: undefined identifier `_sifields`");
// /usr/include/aarch64-linux-gnu/bits/types/siginfo_t.h:137:9
pub const si_addr = @compileError("unable to translate macro: undefined identifier `_sifields`");
// /usr/include/aarch64-linux-gnu/bits/types/siginfo_t.h:138:9
pub const si_addr_lsb = @compileError("unable to translate macro: undefined identifier `_sifields`");
// /usr/include/aarch64-linux-gnu/bits/types/siginfo_t.h:139:9
pub const si_lower = @compileError("unable to translate macro: undefined identifier `_sifields`");
// /usr/include/aarch64-linux-gnu/bits/types/siginfo_t.h:140:9
pub const si_upper = @compileError("unable to translate macro: undefined identifier `_sifields`");
// /usr/include/aarch64-linux-gnu/bits/types/siginfo_t.h:141:9
pub const si_pkey = @compileError("unable to translate macro: undefined identifier `_sifields`");
// /usr/include/aarch64-linux-gnu/bits/types/siginfo_t.h:142:9
pub const si_band = @compileError("unable to translate macro: undefined identifier `_sifields`");
// /usr/include/aarch64-linux-gnu/bits/types/siginfo_t.h:143:9
pub const si_fd = @compileError("unable to translate macro: undefined identifier `_sifields`");
// /usr/include/aarch64-linux-gnu/bits/types/siginfo_t.h:144:9
pub const si_call_addr = @compileError("unable to translate macro: undefined identifier `_sifields`");
// /usr/include/aarch64-linux-gnu/bits/types/siginfo_t.h:146:10
pub const si_syscall = @compileError("unable to translate macro: undefined identifier `_sifields`");
// /usr/include/aarch64-linux-gnu/bits/types/siginfo_t.h:147:10
pub const si_arch = @compileError("unable to translate macro: undefined identifier `_sifields`");
// /usr/include/aarch64-linux-gnu/bits/types/siginfo_t.h:148:10
pub const _BITS_SIGINFO_CONSTS_H = @as(c_int, 1);
pub const __SI_ASYNCIO_AFTER_SIGIO = @as(c_int, 1);
pub const __sigval_t_defined = "";
pub const __sigevent_t_defined = @as(c_int, 1);
pub const __SIGEV_MAX_SIZE = @as(c_int, 64);
pub const __SIGEV_PAD_SIZE = @import("std").zig.c_translation.MacroArithmetic.div(__SIGEV_MAX_SIZE, @import("std").zig.c_translation.sizeof(c_int)) - @as(c_int, 4);
pub const sigev_notify_function = @compileError("unable to translate macro: undefined identifier `_sigev_un`");
// /usr/include/aarch64-linux-gnu/bits/types/sigevent_t.h:45:9
pub const sigev_notify_attributes = @compileError("unable to translate macro: undefined identifier `_sigev_un`");
// /usr/include/aarch64-linux-gnu/bits/types/sigevent_t.h:46:9
pub const _BITS_SIGEVENT_CONSTS_H = @as(c_int, 1);
pub inline fn sigmask(sig: anytype) @TypeOf(__glibc_macro_warning("sigmask is deprecated")(@import("std").zig.c_translation.cast(c_int, @as(c_uint, 1) << (sig - @as(c_int, 1))))) {
    _ = &sig;
    return __glibc_macro_warning("sigmask is deprecated")(@import("std").zig.c_translation.cast(c_int, @as(c_uint, 1) << (sig - @as(c_int, 1))));
}
pub const NSIG = _NSIG;
pub const _BITS_SIGACTION_H = @as(c_int, 1);
pub const sa_handler = @compileError("unable to translate macro: undefined identifier `__sigaction_handler`");
// /usr/include/aarch64-linux-gnu/bits/sigaction.h:39:10
pub const sa_sigaction = @compileError("unable to translate macro: undefined identifier `__sigaction_handler`");
// /usr/include/aarch64-linux-gnu/bits/sigaction.h:40:10
pub const SA_NOCLDSTOP = @as(c_int, 1);
pub const SA_NOCLDWAIT = @as(c_int, 2);
pub const SA_SIGINFO = @as(c_int, 4);
pub const SA_ONSTACK = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x08000000, .hex);
pub const SA_RESTART = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x10000000, .hex);
pub const SA_NODEFER = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x40000000, .hex);
pub const SA_RESETHAND = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x80000000, .hex);
pub const SA_INTERRUPT = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x20000000, .hex);
pub const SA_NOMASK = SA_NODEFER;
pub const SA_ONESHOT = SA_RESETHAND;
pub const SA_STACK = SA_ONSTACK;
pub const SIG_BLOCK = @as(c_int, 0);
pub const SIG_UNBLOCK = @as(c_int, 1);
pub const SIG_SETMASK = @as(c_int, 2);
pub const _BITS_SIGCONTEXT_H = @as(c_int, 1);
pub const sigcontext_struct = sigcontext;
pub const __ASM_SIGCONTEXT_H = "";
pub const _LINUX_TYPES_H = "";
pub const _ASM_GENERIC_TYPES_H = "";
pub const _ASM_GENERIC_INT_LL64_H = "";
pub const __bitwise = "";
pub const __bitwise__ = "";
pub const __aligned_u64 = @compileError("unable to translate macro: undefined identifier `aligned`");
// /usr/include/linux/types.h:50:9
pub const __aligned_s64 = @compileError("unable to translate macro: undefined identifier `aligned`");
// /usr/include/linux/types.h:51:9
pub const __aligned_be64 = @compileError("unable to translate macro: undefined identifier `aligned`");
// /usr/include/linux/types.h:52:9
pub const __aligned_le64 = @compileError("unable to translate macro: undefined identifier `aligned`");
// /usr/include/linux/types.h:53:9
pub const FPSIMD_MAGIC = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x46508001, .hex);
pub const ESR_MAGIC = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x45535201, .hex);
pub const POE_MAGIC = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x504f4530, .hex);
pub const EXTRA_MAGIC = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x45585401, .hex);
pub const SVE_MAGIC = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x53564501, .hex);
pub const SVE_SIG_FLAG_SM = @as(c_int, 0x1);
pub const TPIDR2_MAGIC = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x54504902, .hex);
pub const FPMR_MAGIC = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x46504d52, .hex);
pub const ZA_MAGIC = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x54366345, .hex);
pub const ZT_MAGIC = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x5a544e01, .hex);
pub const __ASM_SVE_CONTEXT_H = "";
pub const __SVE_VQ_BYTES = @as(c_int, 16);
pub const __SVE_VQ_MIN = @as(c_int, 1);
pub const __SVE_VQ_MAX = @as(c_int, 512);
pub const __SVE_VL_MIN = __SVE_VQ_MIN * __SVE_VQ_BYTES;
pub const __SVE_VL_MAX = __SVE_VQ_MAX * __SVE_VQ_BYTES;
pub const __SVE_NUM_ZREGS = @as(c_int, 32);
pub const __SVE_NUM_PREGS = @as(c_int, 16);
pub inline fn __sve_vl_valid(vl: anytype) @TypeOf(((@import("std").zig.c_translation.MacroArithmetic.rem(vl, __SVE_VQ_BYTES) == @as(c_int, 0)) and (vl >= __SVE_VL_MIN)) and (vl <= __SVE_VL_MAX)) {
    _ = &vl;
    return ((@import("std").zig.c_translation.MacroArithmetic.rem(vl, __SVE_VQ_BYTES) == @as(c_int, 0)) and (vl >= __SVE_VL_MIN)) and (vl <= __SVE_VL_MAX);
}
pub inline fn __sve_vq_from_vl(vl: anytype) @TypeOf(@import("std").zig.c_translation.MacroArithmetic.div(vl, __SVE_VQ_BYTES)) {
    _ = &vl;
    return @import("std").zig.c_translation.MacroArithmetic.div(vl, __SVE_VQ_BYTES);
}
pub inline fn __sve_vl_from_vq(vq: anytype) @TypeOf(vq * __SVE_VQ_BYTES) {
    _ = &vq;
    return vq * __SVE_VQ_BYTES;
}
pub inline fn __SVE_ZREG_SIZE(vq: anytype) @TypeOf(@import("std").zig.c_translation.cast(__u32, vq) * __SVE_VQ_BYTES) {
    _ = &vq;
    return @import("std").zig.c_translation.cast(__u32, vq) * __SVE_VQ_BYTES;
}
pub inline fn __SVE_PREG_SIZE(vq: anytype) @TypeOf(@import("std").zig.c_translation.cast(__u32, vq) * @import("std").zig.c_translation.MacroArithmetic.div(__SVE_VQ_BYTES, @as(c_int, 8))) {
    _ = &vq;
    return @import("std").zig.c_translation.cast(__u32, vq) * @import("std").zig.c_translation.MacroArithmetic.div(__SVE_VQ_BYTES, @as(c_int, 8));
}
pub inline fn __SVE_FFR_SIZE(vq: anytype) @TypeOf(__SVE_PREG_SIZE(vq)) {
    _ = &vq;
    return __SVE_PREG_SIZE(vq);
}
pub const __SVE_ZREGS_OFFSET = @as(c_int, 0);
pub inline fn __SVE_ZREG_OFFSET(vq: anytype, n: anytype) @TypeOf(__SVE_ZREGS_OFFSET + (__SVE_ZREG_SIZE(vq) * n)) {
    _ = &vq;
    _ = &n;
    return __SVE_ZREGS_OFFSET + (__SVE_ZREG_SIZE(vq) * n);
}
pub inline fn __SVE_ZREGS_SIZE(vq: anytype) @TypeOf(__SVE_ZREG_OFFSET(vq, __SVE_NUM_ZREGS) - __SVE_ZREGS_OFFSET) {
    _ = &vq;
    return __SVE_ZREG_OFFSET(vq, __SVE_NUM_ZREGS) - __SVE_ZREGS_OFFSET;
}
pub inline fn __SVE_PREGS_OFFSET(vq: anytype) @TypeOf(__SVE_ZREGS_OFFSET + __SVE_ZREGS_SIZE(vq)) {
    _ = &vq;
    return __SVE_ZREGS_OFFSET + __SVE_ZREGS_SIZE(vq);
}
pub inline fn __SVE_PREG_OFFSET(vq: anytype, n: anytype) @TypeOf(__SVE_PREGS_OFFSET(vq) + (__SVE_PREG_SIZE(vq) * n)) {
    _ = &vq;
    _ = &n;
    return __SVE_PREGS_OFFSET(vq) + (__SVE_PREG_SIZE(vq) * n);
}
pub inline fn __SVE_PREGS_SIZE(vq: anytype) @TypeOf(__SVE_PREG_OFFSET(vq, __SVE_NUM_PREGS) - __SVE_PREGS_OFFSET(vq)) {
    _ = &vq;
    return __SVE_PREG_OFFSET(vq, __SVE_NUM_PREGS) - __SVE_PREGS_OFFSET(vq);
}
pub inline fn __SVE_FFR_OFFSET(vq: anytype) @TypeOf(__SVE_PREGS_OFFSET(vq) + __SVE_PREGS_SIZE(vq)) {
    _ = &vq;
    return __SVE_PREGS_OFFSET(vq) + __SVE_PREGS_SIZE(vq);
}
pub const SVE_VQ_BYTES = __SVE_VQ_BYTES;
pub const SVE_VQ_MIN = __SVE_VQ_MIN;
pub const SVE_VQ_MAX = __SVE_VQ_MAX;
pub const SVE_VL_MIN = __SVE_VL_MIN;
pub const SVE_VL_MAX = __SVE_VL_MAX;
pub const SVE_NUM_ZREGS = __SVE_NUM_ZREGS;
pub const SVE_NUM_PREGS = __SVE_NUM_PREGS;
pub inline fn sve_vl_valid(vl: anytype) @TypeOf(__sve_vl_valid(vl)) {
    _ = &vl;
    return __sve_vl_valid(vl);
}
pub inline fn sve_vq_from_vl(vl: anytype) @TypeOf(__sve_vq_from_vl(vl)) {
    _ = &vl;
    return __sve_vq_from_vl(vl);
}
pub inline fn sve_vl_from_vq(vq: anytype) @TypeOf(__sve_vl_from_vq(vq)) {
    _ = &vq;
    return __sve_vl_from_vq(vq);
}
pub inline fn SVE_SIG_ZREG_SIZE(vq: anytype) @TypeOf(__SVE_ZREG_SIZE(vq)) {
    _ = &vq;
    return __SVE_ZREG_SIZE(vq);
}
pub inline fn SVE_SIG_PREG_SIZE(vq: anytype) @TypeOf(__SVE_PREG_SIZE(vq)) {
    _ = &vq;
    return __SVE_PREG_SIZE(vq);
}
pub inline fn SVE_SIG_FFR_SIZE(vq: anytype) @TypeOf(__SVE_FFR_SIZE(vq)) {
    _ = &vq;
    return __SVE_FFR_SIZE(vq);
}
pub const SVE_SIG_REGS_OFFSET = @import("std").zig.c_translation.MacroArithmetic.div(@import("std").zig.c_translation.sizeof(struct_sve_context) + (__SVE_VQ_BYTES - @as(c_int, 1)), __SVE_VQ_BYTES) * __SVE_VQ_BYTES;
pub const SVE_SIG_ZREGS_OFFSET = SVE_SIG_REGS_OFFSET + __SVE_ZREGS_OFFSET;
pub inline fn SVE_SIG_ZREG_OFFSET(vq: anytype, n: anytype) @TypeOf(SVE_SIG_REGS_OFFSET + __SVE_ZREG_OFFSET(vq, n)) {
    _ = &vq;
    _ = &n;
    return SVE_SIG_REGS_OFFSET + __SVE_ZREG_OFFSET(vq, n);
}
pub inline fn SVE_SIG_ZREGS_SIZE(vq: anytype) @TypeOf(__SVE_ZREGS_SIZE(vq)) {
    _ = &vq;
    return __SVE_ZREGS_SIZE(vq);
}
pub inline fn SVE_SIG_PREGS_OFFSET(vq: anytype) @TypeOf(SVE_SIG_REGS_OFFSET + __SVE_PREGS_OFFSET(vq)) {
    _ = &vq;
    return SVE_SIG_REGS_OFFSET + __SVE_PREGS_OFFSET(vq);
}
pub inline fn SVE_SIG_PREG_OFFSET(vq: anytype, n: anytype) @TypeOf(SVE_SIG_REGS_OFFSET + __SVE_PREG_OFFSET(vq, n)) {
    _ = &vq;
    _ = &n;
    return SVE_SIG_REGS_OFFSET + __SVE_PREG_OFFSET(vq, n);
}
pub inline fn SVE_SIG_PREGS_SIZE(vq: anytype) @TypeOf(__SVE_PREGS_SIZE(vq)) {
    _ = &vq;
    return __SVE_PREGS_SIZE(vq);
}
pub inline fn SVE_SIG_FFR_OFFSET(vq: anytype) @TypeOf(SVE_SIG_REGS_OFFSET + __SVE_FFR_OFFSET(vq)) {
    _ = &vq;
    return SVE_SIG_REGS_OFFSET + __SVE_FFR_OFFSET(vq);
}
pub inline fn SVE_SIG_REGS_SIZE(vq: anytype) @TypeOf(__SVE_FFR_OFFSET(vq) + __SVE_FFR_SIZE(vq)) {
    _ = &vq;
    return __SVE_FFR_OFFSET(vq) + __SVE_FFR_SIZE(vq);
}
pub inline fn SVE_SIG_CONTEXT_SIZE(vq: anytype) @TypeOf(SVE_SIG_REGS_OFFSET + SVE_SIG_REGS_SIZE(vq)) {
    _ = &vq;
    return SVE_SIG_REGS_OFFSET + SVE_SIG_REGS_SIZE(vq);
}
pub const ZA_SIG_REGS_OFFSET = @import("std").zig.c_translation.MacroArithmetic.div(@import("std").zig.c_translation.sizeof(struct_za_context) + (__SVE_VQ_BYTES - @as(c_int, 1)), __SVE_VQ_BYTES) * __SVE_VQ_BYTES;
pub inline fn ZA_SIG_REGS_SIZE(vq: anytype) @TypeOf((vq * __SVE_VQ_BYTES) * (vq * __SVE_VQ_BYTES)) {
    _ = &vq;
    return (vq * __SVE_VQ_BYTES) * (vq * __SVE_VQ_BYTES);
}
pub inline fn ZA_SIG_ZAV_OFFSET(vq: anytype, n: anytype) @TypeOf(ZA_SIG_REGS_OFFSET + (SVE_SIG_ZREG_SIZE(vq) * n)) {
    _ = &vq;
    _ = &n;
    return ZA_SIG_REGS_OFFSET + (SVE_SIG_ZREG_SIZE(vq) * n);
}
pub inline fn ZA_SIG_CONTEXT_SIZE(vq: anytype) @TypeOf(ZA_SIG_REGS_OFFSET + ZA_SIG_REGS_SIZE(vq)) {
    _ = &vq;
    return ZA_SIG_REGS_OFFSET + ZA_SIG_REGS_SIZE(vq);
}
pub const ZT_SIG_REG_SIZE = @as(c_int, 512);
pub const ZT_SIG_REG_BYTES = @import("std").zig.c_translation.MacroArithmetic.div(ZT_SIG_REG_SIZE, @as(c_int, 8));
pub const ZT_SIG_REGS_OFFSET = @import("std").zig.c_translation.sizeof(struct_zt_context);
pub inline fn ZT_SIG_REGS_SIZE(n: anytype) @TypeOf(ZT_SIG_REG_BYTES * n) {
    _ = &n;
    return ZT_SIG_REG_BYTES * n;
}
pub inline fn ZT_SIG_CONTEXT_SIZE(n: anytype) @TypeOf(@import("std").zig.c_translation.sizeof(struct_zt_context) + ZT_SIG_REGS_SIZE(n)) {
    _ = &n;
    return @import("std").zig.c_translation.sizeof(struct_zt_context) + ZT_SIG_REGS_SIZE(n);
}
pub const __stack_t_defined = @as(c_int, 1);
pub const _SYS_UCONTEXT_H = @as(c_int, 1);
pub inline fn __ctx(fld: anytype) @TypeOf(fld) {
    _ = &fld;
    return fld;
}
pub const _SYS_PROCFS_H = @as(c_int, 1);
pub const _SYS_TIME_H = @as(c_int, 1);
pub inline fn timerisset(tvp: anytype) @TypeOf((tvp.*.tv_sec != 0) or (tvp.*.tv_usec != 0)) {
    _ = &tvp;
    return (tvp.*.tv_sec != 0) or (tvp.*.tv_usec != 0);
}
pub const timerclear = @compileError("unable to translate C expr: expected ')' instead got '='");
// /usr/include/aarch64-linux-gnu/sys/time.h:232:10
pub inline fn timercmp(a: anytype, b: anytype, CMP: anytype) @TypeOf(if (a.*.tv_sec == b.*.tv_sec) a.*.tv_usec ++ CMP(b).*.tv_usec else a.*.tv_sec ++ CMP(b).*.tv_sec) {
    _ = &a;
    _ = &b;
    _ = &CMP;
    return if (a.*.tv_sec == b.*.tv_sec) a.*.tv_usec ++ CMP(b).*.tv_usec else a.*.tv_sec ++ CMP(b).*.tv_sec;
}
pub const timeradd = @compileError("unable to translate C expr: unexpected token 'do'");
// /usr/include/aarch64-linux-gnu/sys/time.h:237:10
pub const timersub = @compileError("unable to translate C expr: unexpected token 'do'");
// /usr/include/aarch64-linux-gnu/sys/time.h:247:10
pub const _SYS_USER_H = @as(c_int, 1);
pub const ELF_NGREG = @import("std").zig.c_translation.MacroArithmetic.div(@import("std").zig.c_translation.sizeof(struct_user_regs_struct), @import("std").zig.c_translation.sizeof(elf_greg_t));
pub const ELF_PRARGSZ = @as(c_int, 80);
pub const _BITS_SIGSTACK_H = @as(c_int, 1);
pub const MINSIGSTKSZ = @as(c_int, 5120);
pub const SIGSTKSZ = @as(c_int, 16384);
pub const _BITS_SS_FLAGS_H = @as(c_int, 1);
pub const __sigstack_defined = @as(c_int, 1);
pub const _BITS_SIGTHREAD_H = @as(c_int, 1);
pub const SIGRTMIN = __libc_current_sigrtmin();
pub const SIGRTMAX = __libc_current_sigrtmax();
pub const NGTCP2_H = "";
pub const __need_wchar_t = "";
pub const _WCHAR_T = "";
pub const _STDLIB_H = @as(c_int, 1);
pub const WNOHANG = @as(c_int, 1);
pub const WUNTRACED = @as(c_int, 2);
pub const WSTOPPED = @as(c_int, 2);
pub const WEXITED = @as(c_int, 4);
pub const WCONTINUED = @as(c_int, 8);
pub const WNOWAIT = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x01000000, .hex);
pub const __WNOTHREAD = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x20000000, .hex);
pub const __WALL = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x40000000, .hex);
pub const __WCLONE = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x80000000, .hex);
pub inline fn __WEXITSTATUS(status: anytype) @TypeOf((status & @import("std").zig.c_translation.promoteIntLiteral(c_int, 0xff00, .hex)) >> @as(c_int, 8)) {
    _ = &status;
    return (status & @import("std").zig.c_translation.promoteIntLiteral(c_int, 0xff00, .hex)) >> @as(c_int, 8);
}
pub inline fn __WTERMSIG(status: anytype) @TypeOf(status & @as(c_int, 0x7f)) {
    _ = &status;
    return status & @as(c_int, 0x7f);
}
pub inline fn __WSTOPSIG(status: anytype) @TypeOf(__WEXITSTATUS(status)) {
    _ = &status;
    return __WEXITSTATUS(status);
}
pub inline fn __WIFEXITED(status: anytype) @TypeOf(__WTERMSIG(status) == @as(c_int, 0)) {
    _ = &status;
    return __WTERMSIG(status) == @as(c_int, 0);
}
pub inline fn __WIFSIGNALED(status: anytype) @TypeOf((@import("std").zig.c_translation.cast(i8, (status & @as(c_int, 0x7f)) + @as(c_int, 1)) >> @as(c_int, 1)) > @as(c_int, 0)) {
    _ = &status;
    return (@import("std").zig.c_translation.cast(i8, (status & @as(c_int, 0x7f)) + @as(c_int, 1)) >> @as(c_int, 1)) > @as(c_int, 0);
}
pub inline fn __WIFSTOPPED(status: anytype) @TypeOf((status & @as(c_int, 0xff)) == @as(c_int, 0x7f)) {
    _ = &status;
    return (status & @as(c_int, 0xff)) == @as(c_int, 0x7f);
}
pub inline fn __WIFCONTINUED(status: anytype) @TypeOf(status == __W_CONTINUED) {
    _ = &status;
    return status == __W_CONTINUED;
}
pub inline fn __WCOREDUMP(status: anytype) @TypeOf(status & __WCOREFLAG) {
    _ = &status;
    return status & __WCOREFLAG;
}
pub inline fn __W_EXITCODE(ret: anytype, sig: anytype) @TypeOf((ret << @as(c_int, 8)) | sig) {
    _ = &ret;
    _ = &sig;
    return (ret << @as(c_int, 8)) | sig;
}
pub inline fn __W_STOPCODE(sig: anytype) @TypeOf((sig << @as(c_int, 8)) | @as(c_int, 0x7f)) {
    _ = &sig;
    return (sig << @as(c_int, 8)) | @as(c_int, 0x7f);
}
pub const __W_CONTINUED = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0xffff, .hex);
pub const __WCOREFLAG = @as(c_int, 0x80);
pub inline fn WEXITSTATUS(status: anytype) @TypeOf(__WEXITSTATUS(status)) {
    _ = &status;
    return __WEXITSTATUS(status);
}
pub inline fn WTERMSIG(status: anytype) @TypeOf(__WTERMSIG(status)) {
    _ = &status;
    return __WTERMSIG(status);
}
pub inline fn WSTOPSIG(status: anytype) @TypeOf(__WSTOPSIG(status)) {
    _ = &status;
    return __WSTOPSIG(status);
}
pub inline fn WIFEXITED(status: anytype) @TypeOf(__WIFEXITED(status)) {
    _ = &status;
    return __WIFEXITED(status);
}
pub inline fn WIFSIGNALED(status: anytype) @TypeOf(__WIFSIGNALED(status)) {
    _ = &status;
    return __WIFSIGNALED(status);
}
pub inline fn WIFSTOPPED(status: anytype) @TypeOf(__WIFSTOPPED(status)) {
    _ = &status;
    return __WIFSTOPPED(status);
}
pub inline fn WIFCONTINUED(status: anytype) @TypeOf(__WIFCONTINUED(status)) {
    _ = &status;
    return __WIFCONTINUED(status);
}
pub const _BITS_FLOATN_H = "";
pub const __HAVE_FLOAT128 = @as(c_int, 1);
pub const __HAVE_DISTINCT_FLOAT128 = @as(c_int, 0);
pub const __HAVE_FLOAT64X = __HAVE_FLOAT128;
pub const __HAVE_FLOAT64X_LONG_DOUBLE = __HAVE_FLOAT128;
pub const __f128 = @import("std").zig.c_translation.Macros.L_SUFFIX;
pub const __CFLOAT128 = @compileError("unable to translate: TODO _Complex");
// /usr/include/aarch64-linux-gnu/bits/floatn.h:69:12
pub const __builtin_huge_valf128 = @compileError("unable to translate macro: undefined identifier `__builtin_huge_vall`");
// /usr/include/aarch64-linux-gnu/bits/floatn.h:85:12
pub const __builtin_inff128 = @compileError("unable to translate macro: undefined identifier `__builtin_infl`");
// /usr/include/aarch64-linux-gnu/bits/floatn.h:86:12
pub const __builtin_nanf128 = @compileError("unable to translate macro: undefined identifier `__builtin_nanl`");
// /usr/include/aarch64-linux-gnu/bits/floatn.h:87:12
pub const __builtin_nansf128 = @compileError("unable to translate macro: undefined identifier `__builtin_nansl`");
// /usr/include/aarch64-linux-gnu/bits/floatn.h:88:12
pub const _BITS_FLOATN_COMMON_H = "";
pub const __HAVE_FLOAT16 = @as(c_int, 0);
pub const __HAVE_FLOAT32 = @as(c_int, 1);
pub const __HAVE_FLOAT64 = @as(c_int, 1);
pub const __HAVE_FLOAT32X = @as(c_int, 1);
pub const __HAVE_FLOAT128X = @as(c_int, 0);
pub const __HAVE_DISTINCT_FLOAT16 = __HAVE_FLOAT16;
pub const __HAVE_DISTINCT_FLOAT32 = @as(c_int, 0);
pub const __HAVE_DISTINCT_FLOAT64 = @as(c_int, 0);
pub const __HAVE_DISTINCT_FLOAT32X = @as(c_int, 0);
pub const __HAVE_DISTINCT_FLOAT64X = @as(c_int, 0);
pub const __HAVE_DISTINCT_FLOAT128X = __HAVE_FLOAT128X;
pub const __HAVE_FLOAT128_UNLIKE_LDBL = (__HAVE_DISTINCT_FLOAT128 != 0) and (__LDBL_MANT_DIG__ != @as(c_int, 113));
pub const __HAVE_FLOATN_NOT_TYPEDEF = @as(c_int, 0);
pub const __f32 = @import("std").zig.c_translation.Macros.F_SUFFIX;
pub inline fn __f64(x: anytype) @TypeOf(x) {
    _ = &x;
    return x;
}
pub inline fn __f32x(x: anytype) @TypeOf(x) {
    _ = &x;
    return x;
}
pub const __f64x = @import("std").zig.c_translation.Macros.L_SUFFIX;
pub const __CFLOAT32 = @compileError("unable to translate: TODO _Complex");
// /usr/include/aarch64-linux-gnu/bits/floatn-common.h:149:12
pub const __CFLOAT64 = @compileError("unable to translate: TODO _Complex");
// /usr/include/aarch64-linux-gnu/bits/floatn-common.h:160:13
pub const __CFLOAT32X = @compileError("unable to translate: TODO _Complex");
// /usr/include/aarch64-linux-gnu/bits/floatn-common.h:169:12
pub const __CFLOAT64X = @compileError("unable to translate: TODO _Complex");
// /usr/include/aarch64-linux-gnu/bits/floatn-common.h:178:13
pub inline fn __builtin_huge_valf32() @TypeOf(__builtin_huge_valf()) {
    return __builtin_huge_valf();
}
pub inline fn __builtin_inff32() @TypeOf(__builtin_inff()) {
    return __builtin_inff();
}
pub inline fn __builtin_nanf32(x: anytype) @TypeOf(__builtin_nanf(x)) {
    _ = &x;
    return __builtin_nanf(x);
}
pub const __builtin_nansf32 = @compileError("unable to translate macro: undefined identifier `__builtin_nansf`");
// /usr/include/aarch64-linux-gnu/bits/floatn-common.h:221:12
pub const __builtin_huge_valf64 = @compileError("unable to translate macro: undefined identifier `__builtin_huge_val`");
// /usr/include/aarch64-linux-gnu/bits/floatn-common.h:255:13
pub const __builtin_inff64 = @compileError("unable to translate macro: undefined identifier `__builtin_inf`");
// /usr/include/aarch64-linux-gnu/bits/floatn-common.h:256:13
pub const __builtin_nanf64 = @compileError("unable to translate macro: undefined identifier `__builtin_nan`");
// /usr/include/aarch64-linux-gnu/bits/floatn-common.h:257:13
pub const __builtin_nansf64 = @compileError("unable to translate macro: undefined identifier `__builtin_nans`");
// /usr/include/aarch64-linux-gnu/bits/floatn-common.h:258:13
pub const __builtin_huge_valf32x = @compileError("unable to translate macro: undefined identifier `__builtin_huge_val`");
// /usr/include/aarch64-linux-gnu/bits/floatn-common.h:272:12
pub const __builtin_inff32x = @compileError("unable to translate macro: undefined identifier `__builtin_inf`");
// /usr/include/aarch64-linux-gnu/bits/floatn-common.h:273:12
pub const __builtin_nanf32x = @compileError("unable to translate macro: undefined identifier `__builtin_nan`");
// /usr/include/aarch64-linux-gnu/bits/floatn-common.h:274:12
pub const __builtin_nansf32x = @compileError("unable to translate macro: undefined identifier `__builtin_nans`");
// /usr/include/aarch64-linux-gnu/bits/floatn-common.h:275:12
pub const __builtin_huge_valf64x = @compileError("unable to translate macro: undefined identifier `__builtin_huge_vall`");
// /usr/include/aarch64-linux-gnu/bits/floatn-common.h:289:13
pub const __builtin_inff64x = @compileError("unable to translate macro: undefined identifier `__builtin_infl`");
// /usr/include/aarch64-linux-gnu/bits/floatn-common.h:290:13
pub const __builtin_nanf64x = @compileError("unable to translate macro: undefined identifier `__builtin_nanl`");
// /usr/include/aarch64-linux-gnu/bits/floatn-common.h:291:13
pub const __builtin_nansf64x = @compileError("unable to translate macro: undefined identifier `__builtin_nansl`");
// /usr/include/aarch64-linux-gnu/bits/floatn-common.h:292:13
pub const __ldiv_t_defined = @as(c_int, 1);
pub const __lldiv_t_defined = @as(c_int, 1);
pub const RAND_MAX = @import("std").zig.c_translation.promoteIntLiteral(c_int, 2147483647, .decimal);
pub const EXIT_FAILURE = @as(c_int, 1);
pub const EXIT_SUCCESS = @as(c_int, 0);
pub const MB_CUR_MAX = __ctype_get_mb_cur_max();
pub const _ALLOCA_H = @as(c_int, 1);
pub const __COMPAR_FN_T = "";
pub const __CLANG_INTTYPES_H = "";
pub const _INTTYPES_H = @as(c_int, 1);
pub const ____gwchar_t_defined = @as(c_int, 1);
pub const __PRI64_PREFIX = "l";
pub const __PRIPTR_PREFIX = "l";
pub const PRId8 = "d";
pub const PRId16 = "d";
pub const PRId32 = "d";
pub const PRId64 = __PRI64_PREFIX ++ "d";
pub const PRIdLEAST8 = "d";
pub const PRIdLEAST16 = "d";
pub const PRIdLEAST32 = "d";
pub const PRIdLEAST64 = __PRI64_PREFIX ++ "d";
pub const PRIdFAST8 = "d";
pub const PRIdFAST16 = __PRIPTR_PREFIX ++ "d";
pub const PRIdFAST32 = __PRIPTR_PREFIX ++ "d";
pub const PRIdFAST64 = __PRI64_PREFIX ++ "d";
pub const PRIi8 = "i";
pub const PRIi16 = "i";
pub const PRIi32 = "i";
pub const PRIi64 = __PRI64_PREFIX ++ "i";
pub const PRIiLEAST8 = "i";
pub const PRIiLEAST16 = "i";
pub const PRIiLEAST32 = "i";
pub const PRIiLEAST64 = __PRI64_PREFIX ++ "i";
pub const PRIiFAST8 = "i";
pub const PRIiFAST16 = __PRIPTR_PREFIX ++ "i";
pub const PRIiFAST32 = __PRIPTR_PREFIX ++ "i";
pub const PRIiFAST64 = __PRI64_PREFIX ++ "i";
pub const PRIo8 = "o";
pub const PRIo16 = "o";
pub const PRIo32 = "o";
pub const PRIo64 = __PRI64_PREFIX ++ "o";
pub const PRIoLEAST8 = "o";
pub const PRIoLEAST16 = "o";
pub const PRIoLEAST32 = "o";
pub const PRIoLEAST64 = __PRI64_PREFIX ++ "o";
pub const PRIoFAST8 = "o";
pub const PRIoFAST16 = __PRIPTR_PREFIX ++ "o";
pub const PRIoFAST32 = __PRIPTR_PREFIX ++ "o";
pub const PRIoFAST64 = __PRI64_PREFIX ++ "o";
pub const PRIu8 = "u";
pub const PRIu16 = "u";
pub const PRIu32 = "u";
pub const PRIu64 = __PRI64_PREFIX ++ "u";
pub const PRIuLEAST8 = "u";
pub const PRIuLEAST16 = "u";
pub const PRIuLEAST32 = "u";
pub const PRIuLEAST64 = __PRI64_PREFIX ++ "u";
pub const PRIuFAST8 = "u";
pub const PRIuFAST16 = __PRIPTR_PREFIX ++ "u";
pub const PRIuFAST32 = __PRIPTR_PREFIX ++ "u";
pub const PRIuFAST64 = __PRI64_PREFIX ++ "u";
pub const PRIx8 = "x";
pub const PRIx16 = "x";
pub const PRIx32 = "x";
pub const PRIx64 = __PRI64_PREFIX ++ "x";
pub const PRIxLEAST8 = "x";
pub const PRIxLEAST16 = "x";
pub const PRIxLEAST32 = "x";
pub const PRIxLEAST64 = __PRI64_PREFIX ++ "x";
pub const PRIxFAST8 = "x";
pub const PRIxFAST16 = __PRIPTR_PREFIX ++ "x";
pub const PRIxFAST32 = __PRIPTR_PREFIX ++ "x";
pub const PRIxFAST64 = __PRI64_PREFIX ++ "x";
pub const PRIX8 = "X";
pub const PRIX16 = "X";
pub const PRIX32 = "X";
pub const PRIX64 = __PRI64_PREFIX ++ "X";
pub const PRIXLEAST8 = "X";
pub const PRIXLEAST16 = "X";
pub const PRIXLEAST32 = "X";
pub const PRIXLEAST64 = __PRI64_PREFIX ++ "X";
pub const PRIXFAST8 = "X";
pub const PRIXFAST16 = __PRIPTR_PREFIX ++ "X";
pub const PRIXFAST32 = __PRIPTR_PREFIX ++ "X";
pub const PRIXFAST64 = __PRI64_PREFIX ++ "X";
pub const PRIdMAX = __PRI64_PREFIX ++ "d";
pub const PRIiMAX = __PRI64_PREFIX ++ "i";
pub const PRIoMAX = __PRI64_PREFIX ++ "o";
pub const PRIuMAX = __PRI64_PREFIX ++ "u";
pub const PRIxMAX = __PRI64_PREFIX ++ "x";
pub const PRIXMAX = __PRI64_PREFIX ++ "X";
pub const PRIdPTR = __PRIPTR_PREFIX ++ "d";
pub const PRIiPTR = __PRIPTR_PREFIX ++ "i";
pub const PRIoPTR = __PRIPTR_PREFIX ++ "o";
pub const PRIuPTR = __PRIPTR_PREFIX ++ "u";
pub const PRIxPTR = __PRIPTR_PREFIX ++ "x";
pub const PRIXPTR = __PRIPTR_PREFIX ++ "X";
pub const SCNd8 = "hhd";
pub const SCNd16 = "hd";
pub const SCNd32 = "d";
pub const SCNd64 = __PRI64_PREFIX ++ "d";
pub const SCNdLEAST8 = "hhd";
pub const SCNdLEAST16 = "hd";
pub const SCNdLEAST32 = "d";
pub const SCNdLEAST64 = __PRI64_PREFIX ++ "d";
pub const SCNdFAST8 = "hhd";
pub const SCNdFAST16 = __PRIPTR_PREFIX ++ "d";
pub const SCNdFAST32 = __PRIPTR_PREFIX ++ "d";
pub const SCNdFAST64 = __PRI64_PREFIX ++ "d";
pub const SCNi8 = "hhi";
pub const SCNi16 = "hi";
pub const SCNi32 = "i";
pub const SCNi64 = __PRI64_PREFIX ++ "i";
pub const SCNiLEAST8 = "hhi";
pub const SCNiLEAST16 = "hi";
pub const SCNiLEAST32 = "i";
pub const SCNiLEAST64 = __PRI64_PREFIX ++ "i";
pub const SCNiFAST8 = "hhi";
pub const SCNiFAST16 = __PRIPTR_PREFIX ++ "i";
pub const SCNiFAST32 = __PRIPTR_PREFIX ++ "i";
pub const SCNiFAST64 = __PRI64_PREFIX ++ "i";
pub const SCNu8 = "hhu";
pub const SCNu16 = "hu";
pub const SCNu32 = "u";
pub const SCNu64 = __PRI64_PREFIX ++ "u";
pub const SCNuLEAST8 = "hhu";
pub const SCNuLEAST16 = "hu";
pub const SCNuLEAST32 = "u";
pub const SCNuLEAST64 = __PRI64_PREFIX ++ "u";
pub const SCNuFAST8 = "hhu";
pub const SCNuFAST16 = __PRIPTR_PREFIX ++ "u";
pub const SCNuFAST32 = __PRIPTR_PREFIX ++ "u";
pub const SCNuFAST64 = __PRI64_PREFIX ++ "u";
pub const SCNo8 = "hho";
pub const SCNo16 = "ho";
pub const SCNo32 = "o";
pub const SCNo64 = __PRI64_PREFIX ++ "o";
pub const SCNoLEAST8 = "hho";
pub const SCNoLEAST16 = "ho";
pub const SCNoLEAST32 = "o";
pub const SCNoLEAST64 = __PRI64_PREFIX ++ "o";
pub const SCNoFAST8 = "hho";
pub const SCNoFAST16 = __PRIPTR_PREFIX ++ "o";
pub const SCNoFAST32 = __PRIPTR_PREFIX ++ "o";
pub const SCNoFAST64 = __PRI64_PREFIX ++ "o";
pub const SCNx8 = "hhx";
pub const SCNx16 = "hx";
pub const SCNx32 = "x";
pub const SCNx64 = __PRI64_PREFIX ++ "x";
pub const SCNxLEAST8 = "hhx";
pub const SCNxLEAST16 = "hx";
pub const SCNxLEAST32 = "x";
pub const SCNxLEAST64 = __PRI64_PREFIX ++ "x";
pub const SCNxFAST8 = "hhx";
pub const SCNxFAST16 = __PRIPTR_PREFIX ++ "x";
pub const SCNxFAST32 = __PRIPTR_PREFIX ++ "x";
pub const SCNxFAST64 = __PRI64_PREFIX ++ "x";
pub const SCNdMAX = __PRI64_PREFIX ++ "d";
pub const SCNiMAX = __PRI64_PREFIX ++ "i";
pub const SCNoMAX = __PRI64_PREFIX ++ "o";
pub const SCNuMAX = __PRI64_PREFIX ++ "u";
pub const SCNxMAX = __PRI64_PREFIX ++ "x";
pub const SCNdPTR = __PRIPTR_PREFIX ++ "d";
pub const SCNiPTR = __PRIPTR_PREFIX ++ "i";
pub const SCNoPTR = __PRIPTR_PREFIX ++ "o";
pub const SCNuPTR = __PRIPTR_PREFIX ++ "u";
pub const SCNxPTR = __PRIPTR_PREFIX ++ "x";
pub const __need___va_list = "";
pub const __need_va_list = "";
pub const __need_va_arg = "";
pub const __need___va_copy = "";
pub const __need_va_copy = "";
pub const __STDARG_H = "";
pub const __GNUC_VA_LIST = "";
pub const _VA_LIST = "";
pub const va_start = @compileError("unable to translate macro: undefined identifier `__builtin_va_start`");
// /workspace/tools/zig-aarch64-linux-0.14.1/lib/include/__stdarg_va_arg.h:17:9
pub const va_end = @compileError("unable to translate macro: undefined identifier `__builtin_va_end`");
// /workspace/tools/zig-aarch64-linux-0.14.1/lib/include/__stdarg_va_arg.h:19:9
pub const va_arg = @compileError("unable to translate C expr: unexpected token 'an identifier'");
// /workspace/tools/zig-aarch64-linux-0.14.1/lib/include/__stdarg_va_arg.h:20:9
pub const __va_copy = @compileError("unable to translate macro: undefined identifier `__builtin_va_copy`");
// /workspace/tools/zig-aarch64-linux-0.14.1/lib/include/__stdarg___va_copy.h:11:9
pub const va_copy = @compileError("unable to translate macro: undefined identifier `__builtin_va_copy`");
// /workspace/tools/zig-aarch64-linux-0.14.1/lib/include/__stdarg_va_copy.h:11:9
pub const __need_ptrdiff_t = "";
pub const __need_max_align_t = "";
pub const __need_offsetof = "";
pub const __STDDEF_H = "";
pub const _PTRDIFF_T = "";
pub const __CLANG_MAX_ALIGN_T_DEFINED = "";
pub const offsetof = @compileError("unable to translate C expr: unexpected token 'an identifier'");
// /workspace/tools/zig-aarch64-linux-0.14.1/lib/include/__stddef_offsetof.h:16:9
pub const NGTCP2_VERSION_H = "";
pub const NGTCP2_VERSION = "1.17.0";
pub const NGTCP2_VERSION_NUM = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x011100, .hex);
pub const NGTCP2_EXTERN = "";
pub const NGTCP2_ALIGN = @compileError("unable to translate macro: undefined identifier `aligned`");
// /workspace/work/deps/include/ngtcp2/ngtcp2.h:86:11
pub const NGTCP2_NANOSECONDS = @import("std").zig.c_translation.cast(ngtcp2_duration, @as(c_ulonglong, 1));
pub const NGTCP2_MICROSECONDS = @import("std").zig.c_translation.cast(ngtcp2_duration, @as(c_ulonglong, 1000) * NGTCP2_NANOSECONDS);
pub const NGTCP2_MILLISECONDS = @import("std").zig.c_translation.cast(ngtcp2_duration, @as(c_ulonglong, 1000) * NGTCP2_MICROSECONDS);
pub const NGTCP2_SECONDS = @import("std").zig.c_translation.cast(ngtcp2_duration, @as(c_ulonglong, 1000) * NGTCP2_MILLISECONDS);
pub const NGTCP2_MINUTES = @import("std").zig.c_translation.cast(ngtcp2_duration, @as(c_ulonglong, 60) * NGTCP2_SECONDS);
pub const NGTCP2_PROTO_VER_V1 = @import("std").zig.c_translation.cast(u32, @as(c_uint, 0x00000001));
pub const NGTCP2_PROTO_VER_V2 = @import("std").zig.c_translation.cast(u32, @import("std").zig.c_translation.promoteIntLiteral(c_uint, 0x6b3343cf, .hex));
pub const NGTCP2_PROTO_VER_MAX = NGTCP2_PROTO_VER_V1;
pub const NGTCP2_PROTO_VER_MIN = NGTCP2_PROTO_VER_V1;
pub const NGTCP2_RESERVED_VERSION_MASK = @import("std").zig.c_translation.promoteIntLiteral(c_uint, 0x0a0a0a0a, .hex);
pub const NGTCP2_MAX_UDP_PAYLOAD_SIZE = @as(c_int, 1200);
pub const NGTCP2_MAX_TX_UDP_PAYLOAD_SIZE = @import("std").zig.c_translation.promoteIntLiteral(c_int, 65527, .decimal);
pub const NGTCP2_MAX_PMTUD_UDP_PAYLOAD_SIZE = @as(c_int, 1452);
pub const NGTCP2_MAX_VARINT = (@as(c_ulonglong, 1) << @as(c_int, 62)) - @as(c_int, 1);
pub const NGTCP2_STATELESS_RESET_TOKENLEN = @as(c_int, 16);
pub const NGTCP2_MIN_STATELESS_RESET_RANDLEN = @as(c_int, 5);
pub const NGTCP2_PATH_CHALLENGE_DATALEN = @as(c_int, 8);
pub const NGTCP2_RETRY_KEY_V1 = "\xbe\x0c\x69\x0b\x9f\x66\x57\x5a\x1d\x76\x6b\x54\xe3\x68\xc8\x4e";
pub const NGTCP2_RETRY_NONCE_V1 = "\x46\x15\x99\xd3\x5d\x63\x2b\xf2\x23\x98\x25\xbb";
pub const NGTCP2_RETRY_KEY_V2 = "\x8f\xb4\xb0\x1b\x56\xac\x48\xe2\x60\xfb\xcb\xce\xad\x7c\xcc\x92";
pub const NGTCP2_RETRY_NONCE_V2 = "\xd8\x69\x69\xbc\x2d\x7c\x6d\x99\x90\xef\xb0\x4a";
pub const NGTCP2_HP_MASKLEN = @as(c_int, 5);
pub const NGTCP2_HP_SAMPLELEN = @as(c_int, 16);
pub const NGTCP2_DEFAULT_INITIAL_RTT = @as(c_int, 333) * NGTCP2_MILLISECONDS;
pub const NGTCP2_MAX_CIDLEN = @as(c_int, 20);
pub const NGTCP2_MIN_CIDLEN = @as(c_int, 1);
pub const NGTCP2_MIN_INITIAL_DCIDLEN = @as(c_int, 8);
pub const NGTCP2_ECN_NOT_ECT = @as(c_int, 0x0);
pub const NGTCP2_ECN_ECT_1 = @as(c_int, 0x1);
pub const NGTCP2_ECN_ECT_0 = @as(c_int, 0x2);
pub const NGTCP2_ECN_CE = @as(c_int, 0x3);
pub const NGTCP2_ECN_MASK = @as(c_int, 0x3);
pub const NGTCP2_PKT_INFO_V1 = @as(c_int, 1);
pub const NGTCP2_PKT_INFO_VERSION = NGTCP2_PKT_INFO_V1;
pub const NGTCP2_ERR_INVALID_ARGUMENT = -@as(c_int, 201);
pub const NGTCP2_ERR_NOBUF = -@as(c_int, 202);
pub const NGTCP2_ERR_PROTO = -@as(c_int, 203);
pub const NGTCP2_ERR_INVALID_STATE = -@as(c_int, 204);
pub const NGTCP2_ERR_ACK_FRAME = -@as(c_int, 205);
pub const NGTCP2_ERR_STREAM_ID_BLOCKED = -@as(c_int, 206);
pub const NGTCP2_ERR_STREAM_IN_USE = -@as(c_int, 207);
pub const NGTCP2_ERR_STREAM_DATA_BLOCKED = -@as(c_int, 208);
pub const NGTCP2_ERR_FLOW_CONTROL = -@as(c_int, 209);
pub const NGTCP2_ERR_CONNECTION_ID_LIMIT = -@as(c_int, 210);
pub const NGTCP2_ERR_STREAM_LIMIT = -@as(c_int, 211);
pub const NGTCP2_ERR_FINAL_SIZE = -@as(c_int, 212);
pub const NGTCP2_ERR_CRYPTO = -@as(c_int, 213);
pub const NGTCP2_ERR_PKT_NUM_EXHAUSTED = -@as(c_int, 214);
pub const NGTCP2_ERR_REQUIRED_TRANSPORT_PARAM = -@as(c_int, 215);
pub const NGTCP2_ERR_MALFORMED_TRANSPORT_PARAM = -@as(c_int, 216);
pub const NGTCP2_ERR_FRAME_ENCODING = -@as(c_int, 217);
pub const NGTCP2_ERR_DECRYPT = -@as(c_int, 218);
pub const NGTCP2_ERR_STREAM_SHUT_WR = -@as(c_int, 219);
pub const NGTCP2_ERR_STREAM_NOT_FOUND = -@as(c_int, 220);
pub const NGTCP2_ERR_STREAM_STATE = -@as(c_int, 221);
pub const NGTCP2_ERR_RECV_VERSION_NEGOTIATION = -@as(c_int, 222);
pub const NGTCP2_ERR_CLOSING = -@as(c_int, 223);
pub const NGTCP2_ERR_DRAINING = -@as(c_int, 224);
pub const NGTCP2_ERR_TRANSPORT_PARAM = -@as(c_int, 225);
pub const NGTCP2_ERR_DISCARD_PKT = -@as(c_int, 226);
pub const NGTCP2_ERR_CONN_ID_BLOCKED = -@as(c_int, 227);
pub const NGTCP2_ERR_INTERNAL = -@as(c_int, 228);
pub const NGTCP2_ERR_CRYPTO_BUFFER_EXCEEDED = -@as(c_int, 229);
pub const NGTCP2_ERR_WRITE_MORE = -@as(c_int, 230);
pub const NGTCP2_ERR_RETRY = -@as(c_int, 231);
pub const NGTCP2_ERR_DROP_CONN = -@as(c_int, 232);
pub const NGTCP2_ERR_AEAD_LIMIT_REACHED = -@as(c_int, 233);
pub const NGTCP2_ERR_NO_VIABLE_PATH = -@as(c_int, 234);
pub const NGTCP2_ERR_VERSION_NEGOTIATION = -@as(c_int, 235);
pub const NGTCP2_ERR_HANDSHAKE_TIMEOUT = -@as(c_int, 236);
pub const NGTCP2_ERR_VERSION_NEGOTIATION_FAILURE = -@as(c_int, 237);
pub const NGTCP2_ERR_IDLE_CLOSE = -@as(c_int, 238);
pub const NGTCP2_ERR_FATAL = -@as(c_int, 500);
pub const NGTCP2_ERR_NOMEM = -@as(c_int, 501);
pub const NGTCP2_ERR_CALLBACK_FAILURE = -@as(c_int, 502);
pub const NGTCP2_PKT_FLAG_NONE = @as(c_uint, 0x00);
pub const NGTCP2_PKT_FLAG_LONG_FORM = @as(c_uint, 0x01);
pub const NGTCP2_PKT_FLAG_FIXED_BIT_CLEAR = @as(c_uint, 0x02);
pub const NGTCP2_PKT_FLAG_KEY_PHASE = @as(c_uint, 0x04);
pub const NGTCP2_NO_ERROR = @as(c_uint, 0x0);
pub const NGTCP2_INTERNAL_ERROR = @as(c_uint, 0x1);
pub const NGTCP2_CONNECTION_REFUSED = @as(c_uint, 0x2);
pub const NGTCP2_FLOW_CONTROL_ERROR = @as(c_uint, 0x3);
pub const NGTCP2_STREAM_LIMIT_ERROR = @as(c_uint, 0x4);
pub const NGTCP2_STREAM_STATE_ERROR = @as(c_uint, 0x5);
pub const NGTCP2_FINAL_SIZE_ERROR = @as(c_uint, 0x6);
pub const NGTCP2_FRAME_ENCODING_ERROR = @as(c_uint, 0x7);
pub const NGTCP2_TRANSPORT_PARAMETER_ERROR = @as(c_uint, 0x8);
pub const NGTCP2_CONNECTION_ID_LIMIT_ERROR = @as(c_uint, 0x9);
pub const NGTCP2_PROTOCOL_VIOLATION = @as(c_uint, 0xa);
pub const NGTCP2_INVALID_TOKEN = @as(c_uint, 0xb);
pub const NGTCP2_APPLICATION_ERROR = @as(c_uint, 0xc);
pub const NGTCP2_CRYPTO_BUFFER_EXCEEDED = @as(c_uint, 0xd);
pub const NGTCP2_KEY_UPDATE_ERROR = @as(c_uint, 0xe);
pub const NGTCP2_AEAD_LIMIT_REACHED = @as(c_uint, 0xf);
pub const NGTCP2_NO_VIABLE_PATH = @as(c_uint, 0x10);
pub const NGTCP2_CRYPTO_ERROR = @as(c_uint, 0x100);
pub const NGTCP2_VERSION_NEGOTIATION_ERROR = @as(c_int, 0x11);
pub const NGTCP2_DEFAULT_MAX_RECV_UDP_PAYLOAD_SIZE = @import("std").zig.c_translation.promoteIntLiteral(c_int, 65527, .decimal);
pub const NGTCP2_DEFAULT_ACK_DELAY_EXPONENT = @as(c_int, 3);
pub const NGTCP2_DEFAULT_MAX_ACK_DELAY = @as(c_int, 25) * NGTCP2_MILLISECONDS;
pub const NGTCP2_DEFAULT_ACTIVE_CONNECTION_ID_LIMIT = @as(c_int, 2);
pub const NGTCP2_TLSEXT_QUIC_TRANSPORT_PARAMETERS_V1 = @as(c_uint, 0x39);
pub const NGTCP2_AF_INET = AF_INET;
pub const NGTCP2_AF_INET6 = AF_INET6;
pub const NGTCP2_TRANSPORT_PARAMS_V1 = @as(c_int, 1);
pub const NGTCP2_TRANSPORT_PARAMS_VERSION = NGTCP2_TRANSPORT_PARAMS_V1;
pub const NGTCP2_CONN_INFO_V1 = @as(c_int, 1);
pub const NGTCP2_CONN_INFO_V2 = @as(c_int, 2);
pub const NGTCP2_CONN_INFO_VERSION = NGTCP2_CONN_INFO_V2;
pub const NGTCP2_QLOG_WRITE_FLAG_NONE = @as(c_uint, 0x00);
pub const NGTCP2_QLOG_WRITE_FLAG_FIN = @as(c_uint, 0x01);
pub const NGTCP2_SETTINGS_V1 = @as(c_int, 1);
pub const NGTCP2_SETTINGS_V2 = @as(c_int, 2);
pub const NGTCP2_SETTINGS_V3 = @as(c_int, 3);
pub const NGTCP2_SETTINGS_VERSION = NGTCP2_SETTINGS_V3;
pub const NGTCP2_STREAM_DATA_FLAG_NONE = @as(c_uint, 0x00);
pub const NGTCP2_STREAM_DATA_FLAG_FIN = @as(c_uint, 0x01);
pub const NGTCP2_STREAM_DATA_FLAG_0RTT = @as(c_uint, 0x02);
pub const NGTCP2_STREAM_CLOSE_FLAG_NONE = @as(c_uint, 0x00);
pub const NGTCP2_STREAM_CLOSE_FLAG_APP_ERROR_CODE_SET = @as(c_uint, 0x01);
pub const NGTCP2_PATH_VALIDATION_FLAG_NONE = @as(c_uint, 0x00);
pub const NGTCP2_PATH_VALIDATION_FLAG_PREFERRED_ADDR = @as(c_uint, 0x01);
pub const NGTCP2_PATH_VALIDATION_FLAG_NEW_TOKEN = @as(c_uint, 0x02);
pub const NGTCP2_DATAGRAM_FLAG_NONE = @as(c_uint, 0x00);
pub const NGTCP2_DATAGRAM_FLAG_0RTT = @as(c_uint, 0x01);
pub const NGTCP2_CALLBACKS_V1 = @as(c_int, 1);
pub const NGTCP2_CALLBACKS_V2 = @as(c_int, 2);
pub const NGTCP2_CALLBACKS_VERSION = NGTCP2_CALLBACKS_V2;
pub const NGTCP2_WRITE_STREAM_FLAG_NONE = @as(c_uint, 0x00);
pub const NGTCP2_WRITE_STREAM_FLAG_MORE = @as(c_uint, 0x01);
pub const NGTCP2_WRITE_STREAM_FLAG_FIN = @as(c_uint, 0x02);
pub const NGTCP2_WRITE_STREAM_FLAG_PADDING = @as(c_uint, 0x04);
pub const NGTCP2_WRITE_DATAGRAM_FLAG_NONE = @as(c_uint, 0x00);
pub const NGTCP2_WRITE_DATAGRAM_FLAG_MORE = @as(c_uint, 0x01);
pub const NGTCP2_WRITE_DATAGRAM_FLAG_PADDING = @as(c_uint, 0x02);
pub const NGTCP2_VERSION_AGE = @as(c_int, 1);
pub inline fn ngtcp2_conn_read_pkt(CONN: anytype, PATH: anytype, PI: anytype, PKT: anytype, PKTLEN: anytype, TS: anytype) @TypeOf(ngtcp2_conn_read_pkt_versioned(CONN, PATH, NGTCP2_PKT_INFO_VERSION, PI, PKT, PKTLEN, TS)) {
    _ = &CONN;
    _ = &PATH;
    _ = &PI;
    _ = &PKT;
    _ = &PKTLEN;
    _ = &TS;
    return ngtcp2_conn_read_pkt_versioned(CONN, PATH, NGTCP2_PKT_INFO_VERSION, PI, PKT, PKTLEN, TS);
}
pub inline fn ngtcp2_conn_write_pkt(CONN: anytype, PATH: anytype, PI: anytype, DEST: anytype, DESTLEN: anytype, TS: anytype) @TypeOf(ngtcp2_conn_write_pkt_versioned(CONN, PATH, NGTCP2_PKT_INFO_VERSION, PI, DEST, DESTLEN, TS)) {
    _ = &CONN;
    _ = &PATH;
    _ = &PI;
    _ = &DEST;
    _ = &DESTLEN;
    _ = &TS;
    return ngtcp2_conn_write_pkt_versioned(CONN, PATH, NGTCP2_PKT_INFO_VERSION, PI, DEST, DESTLEN, TS);
}
pub inline fn ngtcp2_conn_write_stream(CONN: anytype, PATH: anytype, PI: anytype, DEST: anytype, DESTLEN: anytype, PDATALEN: anytype, FLAGS: anytype, STREAM_ID: anytype, DATA: anytype, DATALEN: anytype, TS: anytype) @TypeOf(ngtcp2_conn_write_stream_versioned(CONN, PATH, NGTCP2_PKT_INFO_VERSION, PI, DEST, DESTLEN, PDATALEN, FLAGS, STREAM_ID, DATA, DATALEN, TS)) {
    _ = &CONN;
    _ = &PATH;
    _ = &PI;
    _ = &DEST;
    _ = &DESTLEN;
    _ = &PDATALEN;
    _ = &FLAGS;
    _ = &STREAM_ID;
    _ = &DATA;
    _ = &DATALEN;
    _ = &TS;
    return ngtcp2_conn_write_stream_versioned(CONN, PATH, NGTCP2_PKT_INFO_VERSION, PI, DEST, DESTLEN, PDATALEN, FLAGS, STREAM_ID, DATA, DATALEN, TS);
}
pub inline fn ngtcp2_conn_writev_stream(CONN: anytype, PATH: anytype, PI: anytype, DEST: anytype, DESTLEN: anytype, PDATALEN: anytype, FLAGS: anytype, STREAM_ID: anytype, DATAV: anytype, DATAVCNT: anytype, TS: anytype) @TypeOf(ngtcp2_conn_writev_stream_versioned(CONN, PATH, NGTCP2_PKT_INFO_VERSION, PI, DEST, DESTLEN, PDATALEN, FLAGS, STREAM_ID, DATAV, DATAVCNT, TS)) {
    _ = &CONN;
    _ = &PATH;
    _ = &PI;
    _ = &DEST;
    _ = &DESTLEN;
    _ = &PDATALEN;
    _ = &FLAGS;
    _ = &STREAM_ID;
    _ = &DATAV;
    _ = &DATAVCNT;
    _ = &TS;
    return ngtcp2_conn_writev_stream_versioned(CONN, PATH, NGTCP2_PKT_INFO_VERSION, PI, DEST, DESTLEN, PDATALEN, FLAGS, STREAM_ID, DATAV, DATAVCNT, TS);
}
pub inline fn ngtcp2_conn_write_datagram(CONN: anytype, PATH: anytype, PI: anytype, DEST: anytype, DESTLEN: anytype, PACCEPTED: anytype, FLAGS: anytype, DGRAM_ID: anytype, DATA: anytype, DATALEN: anytype, TS: anytype) @TypeOf(ngtcp2_conn_write_datagram_versioned(CONN, PATH, NGTCP2_PKT_INFO_VERSION, PI, DEST, DESTLEN, PACCEPTED, FLAGS, DGRAM_ID, DATA, DATALEN, TS)) {
    _ = &CONN;
    _ = &PATH;
    _ = &PI;
    _ = &DEST;
    _ = &DESTLEN;
    _ = &PACCEPTED;
    _ = &FLAGS;
    _ = &DGRAM_ID;
    _ = &DATA;
    _ = &DATALEN;
    _ = &TS;
    return ngtcp2_conn_write_datagram_versioned(CONN, PATH, NGTCP2_PKT_INFO_VERSION, PI, DEST, DESTLEN, PACCEPTED, FLAGS, DGRAM_ID, DATA, DATALEN, TS);
}
pub inline fn ngtcp2_conn_writev_datagram(CONN: anytype, PATH: anytype, PI: anytype, DEST: anytype, DESTLEN: anytype, PACCEPTED: anytype, FLAGS: anytype, DGRAM_ID: anytype, DATAV: anytype, DATAVCNT: anytype, TS: anytype) @TypeOf(ngtcp2_conn_writev_datagram_versioned(CONN, PATH, NGTCP2_PKT_INFO_VERSION, PI, DEST, DESTLEN, PACCEPTED, FLAGS, DGRAM_ID, DATAV, DATAVCNT, TS)) {
    _ = &CONN;
    _ = &PATH;
    _ = &PI;
    _ = &DEST;
    _ = &DESTLEN;
    _ = &PACCEPTED;
    _ = &FLAGS;
    _ = &DGRAM_ID;
    _ = &DATAV;
    _ = &DATAVCNT;
    _ = &TS;
    return ngtcp2_conn_writev_datagram_versioned(CONN, PATH, NGTCP2_PKT_INFO_VERSION, PI, DEST, DESTLEN, PACCEPTED, FLAGS, DGRAM_ID, DATAV, DATAVCNT, TS);
}
pub inline fn ngtcp2_conn_write_connection_close(CONN: anytype, PATH: anytype, PI: anytype, DEST: anytype, DESTLEN: anytype, CCERR: anytype, TS: anytype) @TypeOf(ngtcp2_conn_write_connection_close_versioned(CONN, PATH, NGTCP2_PKT_INFO_VERSION, PI, DEST, DESTLEN, CCERR, TS)) {
    _ = &CONN;
    _ = &PATH;
    _ = &PI;
    _ = &DEST;
    _ = &DESTLEN;
    _ = &CCERR;
    _ = &TS;
    return ngtcp2_conn_write_connection_close_versioned(CONN, PATH, NGTCP2_PKT_INFO_VERSION, PI, DEST, DESTLEN, CCERR, TS);
}
pub inline fn ngtcp2_transport_params_encode(DEST: anytype, DESTLEN: anytype, PARAMS: anytype) @TypeOf(ngtcp2_transport_params_encode_versioned(DEST, DESTLEN, NGTCP2_TRANSPORT_PARAMS_VERSION, PARAMS)) {
    _ = &DEST;
    _ = &DESTLEN;
    _ = &PARAMS;
    return ngtcp2_transport_params_encode_versioned(DEST, DESTLEN, NGTCP2_TRANSPORT_PARAMS_VERSION, PARAMS);
}
pub inline fn ngtcp2_transport_params_decode(PARAMS: anytype, DATA: anytype, DATALEN: anytype) @TypeOf(ngtcp2_transport_params_decode_versioned(NGTCP2_TRANSPORT_PARAMS_VERSION, PARAMS, DATA, DATALEN)) {
    _ = &PARAMS;
    _ = &DATA;
    _ = &DATALEN;
    return ngtcp2_transport_params_decode_versioned(NGTCP2_TRANSPORT_PARAMS_VERSION, PARAMS, DATA, DATALEN);
}
pub inline fn ngtcp2_conn_client_new(PCONN: anytype, DCID: anytype, SCID: anytype, PATH: anytype, VERSION: anytype, CALLBACKS: anytype, SETTINGS: anytype, PARAMS: anytype, MEM: anytype, USER_DATA: anytype) @TypeOf(ngtcp2_conn_client_new_versioned(PCONN, DCID, SCID, PATH, VERSION, NGTCP2_CALLBACKS_VERSION, CALLBACKS, NGTCP2_SETTINGS_VERSION, SETTINGS, NGTCP2_TRANSPORT_PARAMS_VERSION, PARAMS, MEM, USER_DATA)) {
    _ = &PCONN;
    _ = &DCID;
    _ = &SCID;
    _ = &PATH;
    _ = &VERSION;
    _ = &CALLBACKS;
    _ = &SETTINGS;
    _ = &PARAMS;
    _ = &MEM;
    _ = &USER_DATA;
    return ngtcp2_conn_client_new_versioned(PCONN, DCID, SCID, PATH, VERSION, NGTCP2_CALLBACKS_VERSION, CALLBACKS, NGTCP2_SETTINGS_VERSION, SETTINGS, NGTCP2_TRANSPORT_PARAMS_VERSION, PARAMS, MEM, USER_DATA);
}
pub inline fn ngtcp2_conn_server_new(PCONN: anytype, DCID: anytype, SCID: anytype, PATH: anytype, VERSION: anytype, CALLBACKS: anytype, SETTINGS: anytype, PARAMS: anytype, MEM: anytype, USER_DATA: anytype) @TypeOf(ngtcp2_conn_server_new_versioned(PCONN, DCID, SCID, PATH, VERSION, NGTCP2_CALLBACKS_VERSION, CALLBACKS, NGTCP2_SETTINGS_VERSION, SETTINGS, NGTCP2_TRANSPORT_PARAMS_VERSION, PARAMS, MEM, USER_DATA)) {
    _ = &PCONN;
    _ = &DCID;
    _ = &SCID;
    _ = &PATH;
    _ = &VERSION;
    _ = &CALLBACKS;
    _ = &SETTINGS;
    _ = &PARAMS;
    _ = &MEM;
    _ = &USER_DATA;
    return ngtcp2_conn_server_new_versioned(PCONN, DCID, SCID, PATH, VERSION, NGTCP2_CALLBACKS_VERSION, CALLBACKS, NGTCP2_SETTINGS_VERSION, SETTINGS, NGTCP2_TRANSPORT_PARAMS_VERSION, PARAMS, MEM, USER_DATA);
}
pub inline fn ngtcp2_conn_set_local_transport_params(CONN: anytype, PARAMS: anytype) @TypeOf(ngtcp2_conn_set_local_transport_params_versioned(CONN, NGTCP2_TRANSPORT_PARAMS_VERSION, PARAMS)) {
    _ = &CONN;
    _ = &PARAMS;
    return ngtcp2_conn_set_local_transport_params_versioned(CONN, NGTCP2_TRANSPORT_PARAMS_VERSION, PARAMS);
}
pub inline fn ngtcp2_transport_params_default(PARAMS: anytype) @TypeOf(ngtcp2_transport_params_default_versioned(NGTCP2_TRANSPORT_PARAMS_VERSION, PARAMS)) {
    _ = &PARAMS;
    return ngtcp2_transport_params_default_versioned(NGTCP2_TRANSPORT_PARAMS_VERSION, PARAMS);
}
pub inline fn ngtcp2_conn_get_conn_info(CONN: anytype, CINFO: anytype) @TypeOf(ngtcp2_conn_get_conn_info_versioned(CONN, NGTCP2_CONN_INFO_VERSION, CINFO)) {
    _ = &CONN;
    _ = &CINFO;
    return ngtcp2_conn_get_conn_info_versioned(CONN, NGTCP2_CONN_INFO_VERSION, CINFO);
}
pub inline fn ngtcp2_conn_write_aggregate_pkt(CONN: anytype, PATH: anytype, PI: anytype, BUF: anytype, BUFLEN: anytype, PGSOLEN: anytype, WRITE_PKT: anytype, TS: anytype) @TypeOf(ngtcp2_conn_write_aggregate_pkt_versioned(CONN, PATH, NGTCP2_PKT_INFO_VERSION, PI, BUF, BUFLEN, PGSOLEN, WRITE_PKT, TS)) {
    _ = &CONN;
    _ = &PATH;
    _ = &PI;
    _ = &BUF;
    _ = &BUFLEN;
    _ = &PGSOLEN;
    _ = &WRITE_PKT;
    _ = &TS;
    return ngtcp2_conn_write_aggregate_pkt_versioned(CONN, PATH, NGTCP2_PKT_INFO_VERSION, PI, BUF, BUFLEN, PGSOLEN, WRITE_PKT, TS);
}
pub inline fn ngtcp2_conn_write_aggregate_pkt2(CONN: anytype, PATH: anytype, PI: anytype, BUF: anytype, BUFLEN: anytype, PGSOLEN: anytype, WRITE_PKT: anytype, NUM_PKTS: anytype, TS: anytype) @TypeOf(ngtcp2_conn_write_aggregate_pkt2_versioned(CONN, PATH, NGTCP2_PKT_INFO_VERSION, PI, BUF, BUFLEN, PGSOLEN, WRITE_PKT, NUM_PKTS, TS)) {
    _ = &CONN;
    _ = &PATH;
    _ = &PI;
    _ = &BUF;
    _ = &BUFLEN;
    _ = &PGSOLEN;
    _ = &WRITE_PKT;
    _ = &NUM_PKTS;
    _ = &TS;
    return ngtcp2_conn_write_aggregate_pkt2_versioned(CONN, PATH, NGTCP2_PKT_INFO_VERSION, PI, BUF, BUFLEN, PGSOLEN, WRITE_PKT, NUM_PKTS, TS);
}
pub inline fn ngtcp2_settings_default(SETTINGS: anytype) @TypeOf(ngtcp2_settings_default_versioned(NGTCP2_SETTINGS_VERSION, SETTINGS)) {
    _ = &SETTINGS;
    return ngtcp2_settings_default_versioned(NGTCP2_SETTINGS_VERSION, SETTINGS);
}
pub const NGTCP2_CRYPTO_H = "";
pub const NGTCP2_CRYPTO_ERR_INTERNAL = -@as(c_int, 201);
pub const NGTCP2_CRYPTO_ERR_UNREADABLE_TOKEN = -@as(c_int, 202);
pub const NGTCP2_CRYPTO_ERR_VERIFY_TOKEN = -@as(c_int, 203);
pub const NGTCP2_CRYPTO_ERR_NOMEM = -@as(c_int, 501);
pub const NGTCP2_CRYPTO_TOKEN_RAND_DATALEN = @as(c_int, 16);
pub const NGTCP2_CRYPTO_TOKEN_MAGIC_RETRY = @as(c_int, 0xb6);
pub const NGTCP2_CRYPTO_TOKEN_MAGIC_RETRY2 = @as(c_int, 0xb7);
pub const NGTCP2_CRYPTO_TOKEN_MAGIC_REGULAR = @as(c_int, 0x36);
pub const NGTCP2_CRYPTO_MAX_RETRY_TOKENLEN = ((((@as(c_int, 1) + @as(c_int, 1)) + NGTCP2_MAX_CIDLEN) + @import("std").zig.c_translation.sizeof(ngtcp2_tstamp)) + @as(c_int, 16)) + NGTCP2_CRYPTO_TOKEN_RAND_DATALEN;
pub const NGTCP2_CRYPTO_MAX_RETRY_TOKENLEN2 = (((((@as(c_int, 1) + @import("std").zig.c_translation.sizeof(ngtcp2_sockaddr_union)) + @as(c_int, 1)) + NGTCP2_MAX_CIDLEN) + @import("std").zig.c_translation.sizeof(ngtcp2_tstamp)) + @as(c_int, 16)) + NGTCP2_CRYPTO_TOKEN_RAND_DATALEN;
pub const NGTCP2_CRYPTO_MAX_REGULAR_TOKENLEN = ((@as(c_int, 1) + @import("std").zig.c_translation.sizeof(ngtcp2_tstamp)) + @as(c_int, 16)) + NGTCP2_CRYPTO_TOKEN_RAND_DATALEN;
pub const iovec = struct_iovec;
pub const timeval = struct_timeval;
pub const timespec = struct_timespec;
pub const __pthread_internal_list = struct___pthread_internal_list;
pub const __pthread_internal_slist = struct___pthread_internal_slist;
pub const __pthread_mutex_s = struct___pthread_mutex_s;
pub const __pthread_rwlock_arch_t = struct___pthread_rwlock_arch_t;
pub const __pthread_cond_s = struct___pthread_cond_s;
pub const __socket_type = enum___socket_type;
pub const sockaddr = struct_sockaddr;
pub const sockaddr_storage = struct_sockaddr_storage;
pub const msghdr = struct_msghdr;
pub const cmsghdr = struct_cmsghdr;
pub const linger = struct_linger;
pub const osockaddr = struct_osockaddr;
pub const winsize = struct_winsize;
pub const termio = struct_termio;
pub const EPOLL_EVENTS = enum_EPOLL_EVENTS;
pub const epoll_data = union_epoll_data;
pub const epoll_event = struct_epoll_event;
pub const epoll_params = struct_epoll_params;
pub const tm = struct_tm;
pub const itimerspec = struct_itimerspec;
pub const sigval = union_sigval;
pub const sigevent = struct_sigevent;
pub const __locale_struct = struct___locale_struct;
pub const in_addr = struct_in_addr;
pub const ip_opts = struct_ip_opts;
pub const in_pktinfo = struct_in_pktinfo;
pub const in6_addr = struct_in6_addr;
pub const sockaddr_in = struct_sockaddr_in;
pub const sockaddr_in6 = struct_sockaddr_in6;
pub const ip_mreq = struct_ip_mreq;
pub const ip_mreqn = struct_ip_mreqn;
pub const ip_mreq_source = struct_ip_mreq_source;
pub const ipv6_mreq = struct_ipv6_mreq;
pub const group_req = struct_group_req;
pub const group_source_req = struct_group_source_req;
pub const ip_msfilter = struct_ip_msfilter;
pub const group_filter = struct_group_filter;
pub const tcphdr = struct_tcphdr;
pub const tcp_ca_state = enum_tcp_ca_state;
pub const tcp_info = struct_tcp_info;
pub const tcp_md5sig = struct_tcp_md5sig;
pub const tcp_repair_opt = struct_tcp_repair_opt;
pub const tcp_cookie_transactions = struct_tcp_cookie_transactions;
pub const tcp_repair_window = struct_tcp_repair_window;
pub const tcp_zerocopy_receive = struct_tcp_zerocopy_receive;
pub const rpcent = struct_rpcent;
pub const netent = struct_netent;
pub const hostent = struct_hostent;
pub const servent = struct_servent;
pub const protoent = struct_protoent;
pub const addrinfo = struct_addrinfo;
pub const flock = struct_flock;
pub const stat = struct_stat;
pub const sigcontext = struct_sigcontext;
pub const _aarch64_ctx = struct__aarch64_ctx;
pub const fpsimd_context = struct_fpsimd_context;
pub const esr_context = struct_esr_context;
pub const poe_context = struct_poe_context;
pub const extra_context = struct_extra_context;
pub const sve_context = struct_sve_context;
pub const tpidr2_context = struct_tpidr2_context;
pub const fpmr_context = struct_fpmr_context;
pub const za_context = struct_za_context;
pub const zt_context = struct_zt_context;
pub const __itimer_which = enum___itimer_which;
pub const itimerval = struct_itimerval;
pub const user_regs_struct = struct_user_regs_struct;
pub const user_fpsimd_struct = struct_user_fpsimd_struct;
pub const elf_siginfo = struct_elf_siginfo;
pub const elf_prstatus = struct_elf_prstatus;
pub const elf_prpsinfo = struct_elf_prpsinfo;
pub const random_data = struct_random_data;
pub const drand48_data = struct_drand48_data;
