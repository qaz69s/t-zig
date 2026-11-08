# tuic-zig

TUIC v5 服务端的 Zig 实现。QUIC 传输层用 ngtcp2（OpenSSL 3.5 原生 QUIC TLS 接口），
QUIC 之上的全部逻辑用 Zig 编写。

## 一键安装

```bash
wget -N https://raw.githubusercontent.com/qaz69s/t-zig/main/install/tuic-zig.sh && bash tuic-zig.sh
```

中文菜单，支持安装、卸载、更新、启停、修改配置和输出分享链接，详见 [install/README.md](install/README.md)。
发布包（x86_64 / aarch64，静态链接 OpenSSL，glibc ≥ 2.17）由 GitHub Actions 在推送 `v*` 标签时自动构建。

## 架构

| 文件 | 内容 |
|---|---|
| `src/server.zig` | epoll 单线程事件循环；QUIC 连接/CID 表；TUIC 鉴权；TCP 中继（Connect）；UDP 中继（native / quic 两种模式、分片与重组）；目标地址守卫；GSO 发送、recvmmsg + UDP GRO 接收 |
| `src/proto.zig` | TUIC v5 编解码（Command / Address / Packet） |
| `src/sendbuf.zig` | 流发送缓冲：64 KiB 定长块，ngtcp2 零拷贝引用直到 ACK，块池复用 |
| `src/resolver.zig` | 4 线程 getaddrinfo + eventfd 回传，域名解析不阻塞事件循环 |
| `src/shim.c` | 约 130 行 C：包装 ngtcp2 的版本宏和 OpenSSL 宏（SSL_CTX、ALPN、导出密钥） |

协议细节与 Itsusinn/tuic（wind-tuic）保持一致：
- 鉴权 token = TLS Exporter(label = UUID 16 字节, context = 密码, 32 字节)，常数时间比较，未知 UUID 也走一次导出（防计时侧信道），失败直接关闭连接。
- 鉴权前到达的 Connect 只解析头部并暂停；鉴权前的 uni stream / datagram 缓存（上限 256），鉴权后恢复。
- 鉴权超时、重复鉴权都关闭连接。
- UDP 回包沿用客户端首包的模式（datagram 或 uni stream），datagram 模式按路径 MTU 分片。
- 默认拒绝回环和私有地址（同 tuic-server `experimental.drop_loopback/drop_private`）。

## 构建

依赖：Zig 0.14.1、OpenSSL ≥ 3.5、ngtcp2 ≥ 1.17（启用 ossl 后端）。

```sh
cmake ngtcp2 -DENABLE_OPENSSL=ON -DENABLE_LIB_ONLY=ON -DENABLE_SHARED_LIB=OFF \
      -DBUILD_TESTING=OFF -DCMAKE_INSTALL_PREFIX=$DEPS && make install
DEPS=$DEPS ./build.sh            # 输出 zig-out/bin/tuic-zig
```

（`build.zig` 也提供，但本机沙箱里 `@cImport` 会卡住，所以 `build.sh` 先用
`zig translate-c` 生成 `src/c_gen.zig`。）

## 配置（JSON）

```json
{
  "server": "[::]:443",
  "users": { "00000000-0000-0000-0000-000000000000": "password" },
  "certificate": "/path/fullchain.pem",
  "private_key": "/path/key.pem",
  "alpn": ["h3"],
  "congestion_control": "bbr",
  "udp_relay_ipv6": true,
  "auth_timeout_ms": 3000,
  "max_idle_time_ms": 30000,
  "drop_loopback": true,
  "drop_private": true,
  "log_level": "warn"
}
```

其余可调项见 `src/config.zig`（流/连接窗口、GSO/GRO、gso_burst 等）。

## 兼容性修复（v4）

- 对端发起的流关闭后调用 `ngtcp2_conn_extend_max_streams_bidi/uni` 回补额度。修复前同一 QUIC 连接第 1025 个 TCP 连接（quic 模式第 1024 个 UDP 包）起全部卡住。回归脚本：`bench/regress.py`、`bench/regress_all.sh`。
- 单向流读够一条命令的字节即处理（`proto.commandLen`），不再等 FIN。
- 发包地址跟随 ngtcp2 的路径（`ngtcp2_conn_get_path` 与写包回调给出的 path），不再按收包源地址直接改写，迁移由 ngtcp2 做路径验证。

## 双栈（v5）

- 默认监听 `[::]:port`（IPV6_V6ONLY=0），同时接受 IPv4 与 IPv6 客户端；内核无 IPv6 时自动退回 `0.0.0.0`。
- 出站 TCP/UDP 支持 IPv4、IPv6 字面地址与域名；UDP 会话用双栈套接字（`udp_relay_ipv6`，默认开）。
- `ip_mode`：`v4first`（默认）| `v6first` | `v4only` | `v6only`。域名解析取全部地址（最多 8 个）按此顺序排列，TCP 连接失败自动换下一个；后面还有候选时设 TCP_SYNCNT=1，静默黑洞约 3 秒放弃。
- 目标守卫对 v4 映射地址（::ffff:a.b.c.d）按 IPv4 规则判断。
- 测试：`bench/dualstack.py`（需在 /etc/hosts 加 dual.test、v6only.test）。

## 与 Rust tuic-server 的已知差异

- 配置为扁平 JSON，不兼容 Rust 版 TOML（users 映射相同）。
- UDP 回包沿用该会话首包的模式；Rust 只要客户端支持 datagram 就用 datagram。
- 仅 TLS 1.3，无自签证书、hostname 等选项；无 task_negotiation_timeout、stream_timeout、每用户连接数限制、geodata。

## 尚未实现

0-RTT（开关已留，未测试）、ACL/路由规则、RESTful 管理接口、ACME、masquerade、多线程（SO_REUSEPORT + CID 路由）。
