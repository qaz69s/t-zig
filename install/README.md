# tuic-zig 一键安装管理脚本

参考 [teracoot/zuicity-install](https://github.com/teracoot/zuicity-install) 改写，全中文界面，适配 tuic-zig 与 IPv4 / IPv6 双栈。

## 使用

发布包由 GitHub Actions 在推送 `v*` 标签时自动编译并上传到 Release：
`tuic-zig-linux-x86_64.tar.gz`、`tuic-zig-linux-aarch64.tar.gz`（及同名 `.sha256`）。服务器上运行：

```bash
wget -N https://raw.githubusercontent.com/qaz69s/t-zig/main/install/tuic-zig.sh && bash tuic-zig.sh
```

安装完成后输入 `tuiczig` 打开菜单。也可以直接带子命令：`install`、`uninstall`、`start`、`stop`、`restart`、`status`、`show`、`update`。

## 功能

- 安装 / 卸载 / 更新，systemd 托管，开机自启，崩溃自动重启。
- 证书三选一：自签 www.bing.com（默认）、acme.sh 自动申请（A 或 AAAA 指向本机均可，nginx webroot 优先，80 端口空闲时 standalone，每日自动续期并重启服务）、使用已有证书。
- 端口、密码回车随机，UUID 自动生成；可选拥塞控制（bbr / cubic / new_reno）。
- 双栈：服务端监听 `[::]:端口`，同时接受 IPv4 与 IPv6 客户端；可选出站优先级（IPv4 优先 / IPv6 优先 / 仅 IPv4 / 仅 IPv6）。
- 本机同时有公网 IPv4 和 IPv6 时，分别生成两条分享链接。
- 生成客户端配置：官方 tuic-client（JSON）、mihomo / Clash Meta、sing-box。
- 自动放行防火墙 UDP 端口（ufw / firewalld / iptables + ip6tables），调大 UDP 缓冲。
- 修改端口、UUID、密码、拥塞控制、出站优先级、证书后自动重启并刷新分享链接。

## 二进制来源（按顺序尝试）

1. `TUIC_ZIG_LOCAL_BIN=/path/to/tuic-zig`：使用本地文件。
2. GitHub Release 下载（`TUIC_ZIG_REPO`、`TUIC_ZIG_VERSION`），带 SHA256 校验。
3. 下载失败时询问是否本机编译：拉取源码（`TUIC_ZIG_SRC` 可指定 git 仓库、tar.gz 或本地目录）后运行 `build-release.sh`。

## 发布包构建

`build-release.sh [x86_64|aarch64]` 用 Zig 交叉编译，OpenSSL 3.5 与 ngtcp2 静态链接，glibc 符号锁定在 2.17，产物在 `dist/`。

## 路径

| 项目 | 路径 |
|---|---|
| 程序 | `/usr/local/bin/tuic-zig` |
| 服务端配置 | `/etc/tuic-zig/config.json` |
| 安装参数 | `/etc/tuic-zig/install.env` |
| systemd 服务 | `/etc/systemd/system/tuic-zig.service` |
| 分享链接与客户端配置 | `/root/tuic-zig/` |
| 菜单快捷命令 | `/usr/bin/tuiczig` |

## 系统要求

Debian / Ubuntu / CentOS / RHEL / Rocky / Alma / Fedora，x86_64 或 aarch64，需要 systemd。Alpine（musl）暂不支持。
