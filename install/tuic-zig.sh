#!/usr/bin/env bash
#
# tuic-zig 一键安装 / 管理脚本
# 功能：安装、卸载、更新、启停、修改配置、显示分享链接与客户端配置
# 参考：teracoot/zuicity-install
#
# 用法：
#   bash tuic-zig.sh            打开菜单
#   bash tuic-zig.sh install    直接安装（其余子命令见 usage）
# 安装后输入 tuiczig 即可再次打开菜单。

# ======================= 可调整的变量 =======================
# 发布包所在的 GitHub 仓库（Release 资产名：tuic-zig-linux-<x86_64|aarch64>.tar.gz）
TUIC_ZIG_REPO="${TUIC_ZIG_REPO:-qaz69s/t-zig}"
# 指定版本（如 v0.5.0）；留空则取最新 Release
TUIC_ZIG_VERSION="${TUIC_ZIG_VERSION:-}"
# 源码地址（下载失败时用于本机编译）；留空则使用 https://github.com/$TUIC_ZIG_REPO.git
TUIC_ZIG_SRC="${TUIC_ZIG_SRC:-}"
# ===========================================================

BIN_PATH="/usr/local/bin/tuic-zig"
CONF_DIR="/etc/tuic-zig"
CONF_FILE="$CONF_DIR/config.json"
ENV_FILE="$CONF_DIR/install.env"
SERVICE_NAME="tuic-zig"
SERVICE_FILE="/etc/systemd/system/$SERVICE_NAME.service"
OUT_DIR="/root/tuic-zig"
SHORTCUT="/usr/bin/tuiczig"
SCRIPT_URL="https://raw.githubusercontent.com/$TUIC_ZIG_REPO/main/install/tuic-zig.sh"

RED="\033[31m"; GREEN="\033[32m"; YELLOW="\033[33m"; PLAIN="\033[0m"
red(){ echo -e "\033[31m\033[01m$1\033[0m"; }
green(){ echo -e "\033[32m\033[01m$1\033[0m"; }
yellow(){ echo -e "\033[33m\033[01m$1\033[0m"; }

# ----------------------- 环境检测 -----------------------

check_root(){
    [[ $EUID -ne 0 ]] && red "请使用 root 用户运行本脚本" && exit 1
}

detect_os(){
    local regex=("debian" "ubuntu" "centos|red hat|kernel|oracle linux|alma|rocky" "amazon linux" "fedora" "alpine")
    local release=("Debian" "Ubuntu" "CentOS" "CentOS" "Fedora" "Alpine")
    local pkg_update=("apt-get update" "apt-get update" "yum -y makecache" "yum -y makecache" "dnf -y makecache" "apk update")
    local pkg_install=("apt-get -y install" "apt-get -y install" "yum -y install" "yum -y install" "dnf -y install" "apk add")
    local sys i
    for sys in "$(grep -i pretty_name /etc/os-release 2>/dev/null | cut -d \" -f2)" \
               "$(hostnamectl 2>/dev/null | grep -i system | cut -d : -f2)" \
               "$(lsb_release -sd 2>/dev/null)" \
               "$(grep . /etc/redhat-release 2>/dev/null)"; do
        [[ -n $sys ]] && break
    done
    for ((i = 0; i < ${#regex[@]}; i++)); do
        if [[ ${sys,,} =~ ${regex[i]} ]]; then
            SYSTEM=${release[i]}; PKG_UPDATE=${pkg_update[i]}; PKG_INSTALL=${pkg_install[i]}
            break
        fi
    done
    [[ -z $SYSTEM ]] && red "暂不支持当前系统：$sys" && exit 1
    if [[ $SYSTEM == Alpine ]]; then
        red "Alpine 使用 musl，暂不支持（发布包基于 glibc）。" && exit 1
    fi
    if ! command -v systemctl >/dev/null 2>&1; then
        red "未检测到 systemd，本脚本需要 systemd 来管理服务。" && exit 1
    fi
}

ensure_pkg(){
    # ensure_pkg <命令> <apt 包名> [yum 包名]
    local cmd=$1 apt_pkg=$2 yum_pkg=${3:-$2}
    command -v "$cmd" >/dev/null 2>&1 && return 0
    yellow "正在安装依赖：$cmd"
    $PKG_UPDATE >/dev/null 2>&1
    if [[ $SYSTEM == Debian || $SYSTEM == Ubuntu ]]; then
        $PKG_INSTALL "$apt_pkg" >/dev/null 2>&1
    else
        $PKG_INSTALL "$yum_pkg" >/dev/null 2>&1
    fi
    command -v "$cmd" >/dev/null 2>&1 || { red "依赖 $cmd 安装失败，请手动安装后重试"; exit 1; }
}

install_deps(){
    ensure_pkg curl curl
    ensure_pkg tar tar
    ensure_pkg openssl openssl
    ensure_pkg ss iproute2 iproute
    ensure_pkg shuf coreutils
}

arch_affix(){
    case "$(uname -m)" in
        x86_64|amd64) echo x86_64 ;;
        aarch64|arm64) echo aarch64 ;;
        *) red "不支持的 CPU 架构：$(uname -m)" && exit 1 ;;
    esac
}

# ----------------------- 公网地址（双栈）-----------------------

is_private_v4(){
    case "$1" in
        10.*|192.168.*|169.254.*|127.*|0.*|255.255.255.255) return 0 ;;
        172.1[6-9].*|172.2[0-9].*|172.3[01].*) return 0 ;;
        100.6[4-9].*|100.[7-9][0-9].*|100.1[01][0-9].*|100.12[0-7].*) return 0 ;;
    esac
    return 1
}

is_global_v6(){
    local head dec
    head="${1%%:*}"
    [[ -z $head ]] && return 1
    printf -v dec '%d' "0x$head" 2>/dev/null || return 1
    (( dec >= 0x2000 && dec <= 0x3fff ))
}

external_v4(){
    local svc out
    for svc in https://api.ipify.org https://ipv4.icanhazip.com https://v4.ident.me; do
        out=$(curl -4 -fsS --max-time 4 "$svc" 2>/dev/null | tr -d '[:space:]')
        if [[ $out =~ ^([0-9]{1,3}\.){3}[0-9]{1,3}$ ]] && ! is_private_v4 "$out"; then echo "$out"; return 0; fi
    done
    return 1
}

external_v6(){
    local svc out
    for svc in https://api6.ipify.org https://ipv6.icanhazip.com https://v6.ident.me; do
        out=$(curl -6 -fsS --max-time 4 "$svc" 2>/dev/null | tr -d '[:space:]')
        if [[ $out == *:* ]] && is_global_v6 "$out"; then echo "$out"; return 0; fi
    done
    return 1
}

# 结果写入 PUBLIC_V4 / PUBLIC_V6（各取一个，用于生成分享链接；服务本身监听 [::] 双栈）
detect_public_ips(){
    PUBLIC_V4=""; PUBLIC_V6=""
    local addr
    if command -v ip >/dev/null 2>&1; then
        while read -r addr; do
            [[ -n $addr ]] && ! is_private_v4 "$addr" && { PUBLIC_V4=$addr; break; }
        done < <(ip -4 -o addr show scope global 2>/dev/null | awk '{print $4}' | cut -d/ -f1)
        while read -r addr; do
            [[ -n $addr ]] && is_global_v6 "$addr" && { PUBLIC_V6=$addr; break; }
        done < <(ip -6 -o addr show scope global -deprecated -tentative -temporary 2>/dev/null | awk '{print $4}' | cut -d/ -f1)
    fi
    # 网卡上没有公网地址（NAT 机器等）时向外部查询
    [[ -z $PUBLIC_V4 ]] && PUBLIC_V4=$(external_v4)
    [[ -z $PUBLIC_V6 ]] && PUBLIC_V6=$(external_v6)
    if [[ -z $PUBLIC_V4 && -z $PUBLIC_V6 ]]; then
        red "无法获取本机公网 IPv4 或 IPv6 地址"
        read -rp "请手动输入用于分享链接的地址（IP 或域名）：" PUBLIC_V4
        [[ -z $PUBLIC_V4 ]] && exit 1
    fi
}

bracket_host(){
    case "$1" in
        *:*) echo "[$1]" ;;
        *) echo "$1" ;;
    esac
}

urlencode(){
    local s=$1 out="" c i
    for ((i = 0; i < ${#s}; i++)); do
        c=${s:i:1}
        case "$c" in
            [a-zA-Z0-9.~_-]) out+=$c ;;
            *) out+=$(printf '%%%02X' "'$c") ;;
        esac
    done
    echo "$out"
}

# ----------------------- 证书 -----------------------

domain_points_to_server(){
    # 域名的 A 或 AAAA 记录只要有一条指向本机即可（双栈）
    local d=$1 resolved
    resolved=$(getent ahosts "$d" 2>/dev/null | awk '{print $1}' | sort -u)
    [[ -z $resolved ]] && return 1
    { [[ -n $PUBLIC_V4 ]] && grep -Fxq "$PUBLIC_V4" <<< "$resolved"; } || \
    { [[ -n $PUBLIC_V6 ]] && grep -Fxiq "$PUBLIC_V6" <<< "$resolved"; }
}

select_acme_issue_method(){
    ACME_ARGS=(--standalone)
    local webroot="/var/www/acme" token="tuiczig-acme-probe-$(date +%s%N)"
    local dir="$webroot/.well-known/acme-challenge"
    if systemctl is-active --quiet nginx && [[ -d $webroot ]]; then
        mkdir -p "$dir"; echo "$token" > "$dir/$token"
        if [[ $(curl -sS --resolve "$domain:80:127.0.0.1" "http://$domain/.well-known/acme-challenge/$token" --max-time 8 2>/dev/null) == "$token" ]]; then
            rm -f "$dir/$token"
            ACME_ARGS=(-w "$webroot")
            yellow "检测到 nginx 已提供 80 端口，使用 webroot 模式申请证书"
            return
        fi
        rm -f "$dir/$token"
    fi
    if ss -H -tln | awk '{print $4}' | grep -Eq '(^|[^0-9])80$'; then
        red "80 端口被占用，且没有可用的 ACME webroot。请释放 80 端口，或让 nginx 为 $domain 提供 /.well-known/acme-challenge/ 后重试。"
        exit 1
    fi
    if [[ -n $PUBLIC_V6 && -z $PUBLIC_V4 ]]; then
        ACME_ARGS+=(--listen-v6)
    fi
    yellow "80 端口空闲，使用 standalone 模式申请证书"
}

acme_reloadcmd="systemctl restart $SERVICE_NAME >/dev/null 2>&1 || true"

add_acme_cron(){
    sed -i '\|# tuic-zig acme.sh auto-renew$|d' /etc/crontab 2>/dev/null
    echo "0 0 * * * root bash /root/.acme.sh/acme.sh --cron -f >/dev/null 2>&1 # tuic-zig acme.sh auto-renew" >> /etc/crontab
}

inst_cert(){
    green "请选择证书申请方式："
    echo ""
    echo -e " ${GREEN}1.${PLAIN} 自签证书（www.bing.com） ${YELLOW}（默认）${PLAIN}"
    echo -e " ${GREEN}2.${PLAIN} acme.sh 自动申请（需要域名解析到本机）"
    echo -e " ${GREEN}3.${PLAIN} 使用服务器上已有的证书"
    echo ""
    read -rp "请输入选项 [1-3]：" certInput
    case $certInput in
        2)
            cert_path="/root/cert.crt"; key_path="/root/private.key"
            if [[ -s /root/cert.crt && -s /root/private.key && -f /root/ca.log ]]; then
                domain=$(cat /root/ca.log)
                if [[ -x /root/.acme.sh/acme.sh ]]; then
                    bash /root/.acme.sh/acme.sh --install-cert -d "$domain" --key-file "$key_path" --fullchain-file "$cert_path" --reloadcmd "$acme_reloadcmd" --ecc >/dev/null 2>&1 || true
                    add_acme_cron
                fi
                green "检测到已有 $domain 的证书，将直接使用"
            else
                read -rp "请输入解析到本机的域名：" domain
                [[ -z $domain ]] && red "未输入域名，已取消" && exit 1
                green "已输入的域名：$domain"
                if ! domain_points_to_server "$domain"; then
                    red "域名 $domain 没有解析到本机（IPv4：${PUBLIC_V4:-无}，IPv6：${PUBLIC_V6:-无}），已取消" && exit 1
                fi
                ensure_pkg socat socat
                if [[ $SYSTEM == CentOS || $SYSTEM == Fedora ]]; then
                    $PKG_INSTALL cronie >/dev/null 2>&1; systemctl enable --now crond >/dev/null 2>&1
                else
                    $PKG_INSTALL cron >/dev/null 2>&1; systemctl enable --now cron >/dev/null 2>&1
                fi
                if [[ ! -x /root/.acme.sh/acme.sh ]]; then
                    curl -fsSL https://get.acme.sh | sh -s email="$(date +%s%N | md5sum | cut -c 1-16)@gmail.com" >/dev/null 2>&1
                fi
                [[ -x /root/.acme.sh/acme.sh ]] || { red "acme.sh 安装失败"; exit 1; }
                bash /root/.acme.sh/acme.sh --upgrade --auto-upgrade >/dev/null 2>&1
                bash /root/.acme.sh/acme.sh --set-default-ca --server letsencrypt >/dev/null 2>&1
                select_acme_issue_method
                if bash /root/.acme.sh/acme.sh --issue -d "$domain" "${ACME_ARGS[@]}" -k ec-256 --insecure; then
                    bash /root/.acme.sh/acme.sh --install-cert -d "$domain" --key-file "$key_path" --fullchain-file "$cert_path" --reloadcmd "$acme_reloadcmd" --ecc >/dev/null 2>&1
                    if [[ -s $cert_path && -s $key_path ]]; then
                        echo "$domain" > /root/ca.log
                        add_acme_cron
                        green "证书申请成功，已设置自动续期"
                    else
                        red "证书安装失败" && exit 1
                    fi
                else
                    red "证书申请失败，请检查域名解析和 80 端口" && exit 1
                fi
            fi
            sni=$domain; insecure=0
            ;;
        3)
            read -rp "请输入证书（公钥 / fullchain）路径：" cert_path
            read -rp "请输入私钥路径：" key_path
            [[ ! -s $cert_path || ! -s $key_path ]] && red "证书或私钥文件不存在" && exit 1
            read -rp "请输入证书对应的域名：" domain
            [[ -z $domain ]] && red "未输入域名" && exit 1
            sni=$domain
            if openssl verify -verify_hostname "$domain" -untrusted "$cert_path" "$cert_path" >/dev/null 2>&1; then
                insecure=0
            else
                yellow "证书未通过系统信任链校验，分享链接将开启 allow_insecure"
                insecure=1
            fi
            ;;
        *)
            green "将生成 www.bing.com 自签证书"
            mkdir -p "$CONF_DIR"
            cert_path="$CONF_DIR/cert.crt"; key_path="$CONF_DIR/private.key"
            openssl ecparam -genkey -name prime256v1 -out "$key_path" >/dev/null 2>&1
            openssl req -new -x509 -days 36500 -key "$key_path" -out "$cert_path" \
                -subj "/CN=www.bing.com" -addext "subjectAltName=DNS:www.bing.com" >/dev/null 2>&1 || \
            openssl req -new -x509 -days 36500 -key "$key_path" -out "$cert_path" -subj "/CN=www.bing.com" >/dev/null 2>&1
            chmod 644 "$cert_path"; chmod 600 "$key_path"
            sni="www.bing.com"; insecure=1
            ;;
    esac
}

# ----------------------- 交互参数 -----------------------

port_in_use(){
    ss -H -uln 2>/dev/null | awk '{print $4}' | sed 's/.*://' | grep -qx "$1"
}

inst_port(){
    while :; do
        read -rp "设置 UDP 端口 [1-65535]（回车随机）：" port
        [[ -z $port ]] && port=$(shuf -i 2000-65535 -n 1)
        if ! [[ $port =~ ^[0-9]+$ ]] || (( port < 1 || port > 65535 )); then
            yellow "端口无效，请重新输入"; continue
        fi
        if port_in_use "$port"; then
            yellow "端口 $port 已被占用，请换一个"; continue
        fi
        break
    done
    yellow "端口：$port"
}

inst_uuid(){
    read -rp "设置 UUID（回车自动生成）：" uuid
    [[ -z $uuid ]] && uuid=$(cat /proc/sys/kernel/random/uuid)
    if ! [[ $uuid =~ ^[0-9a-fA-F]{8}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{12}$ ]]; then
        red "UUID 格式不正确" && exit 1
    fi
    yellow "UUID：$uuid"
}

inst_pwd(){
    read -rp "设置密码（回车随机）：" passwd
    [[ -z $passwd ]] && passwd=$(openssl rand -hex 8)
    if [[ $passwd == *\"* || $passwd == *\\* ]]; then
        red "密码不能包含双引号或反斜杠" && exit 1
    fi
    yellow "密码：$passwd"
}

inst_cc(){
    green "选择拥塞控制算法："
    echo -e " ${GREEN}1.${PLAIN} bbr ${YELLOW}（默认）${PLAIN}"
    echo -e " ${GREEN}2.${PLAIN} cubic"
    echo -e " ${GREEN}3.${PLAIN} new_reno"
    read -rp "请输入选项 [1-3]：" ccInput
    case $ccInput in
        2) cc=cubic ;;
        3) cc=new_reno ;;
        *) cc=bbr ;;
    esac
    yellow "拥塞控制：$cc"
}

inst_ipmode(){
    green "出站地址优先级（目标为域名时，双栈机器上先连哪一种）："
    echo -e " ${GREEN}1.${PLAIN} IPv4 优先，连不上自动换 IPv6 ${YELLOW}（默认）${PLAIN}"
    echo -e " ${GREEN}2.${PLAIN} IPv6 优先，连不上自动换 IPv4"
    echo -e " ${GREEN}3.${PLAIN} 仅 IPv4"
    echo -e " ${GREEN}4.${PLAIN} 仅 IPv6"
    read -rp "请输入选项 [1-4]：" ipInput
    case $ipInput in
        2) ip_mode=v6first ;;
        3) ip_mode=v4only ;;
        4) ip_mode=v6only ;;
        *) ip_mode=v4first ;;
    esac
    yellow "出站优先级：$ip_mode"
}

# ----------------------- 二进制获取 -----------------------

latest_version(){
    local v
    v=$(curl -fsSL --max-time 10 "https://api.github.com/repos/$TUIC_ZIG_REPO/releases/latest" 2>/dev/null | grep '"tag_name":' | head -n1 | sed -E 's/.*"([^"]+)".*/\1/')
    echo "$v"
}

download_binary(){
    # download_binary <输出目录>；成功返回 0
    local out=$1 ver=$TUIC_ZIG_VERSION arch url
    arch=$(arch_affix)
    [[ -z $ver ]] && ver=$(latest_version)
    if [[ -z $ver ]]; then
        yellow "未能从 $TUIC_ZIG_REPO 获取最新版本号"
        return 1
    fi
    url="https://github.com/$TUIC_ZIG_REPO/releases/download/$ver/tuic-zig-linux-$arch.tar.gz"
    green "下载 tuic-zig $ver（$arch）..."
    curl -fL --retry 2 -o "$out/pkg.tar.gz" "$url" || return 1
    if curl -fsL -o "$out/pkg.tar.gz.sha256" "$url.sha256" 2>/dev/null; then
        local want got
        want=$(awk '{print $1}' "$out/pkg.tar.gz.sha256")
        got=$(sha256sum "$out/pkg.tar.gz" | awk '{print $1}')
        [[ $want != "$got" ]] && { red "SHA256 校验失败"; return 1; }
    fi
    tar -xzf "$out/pkg.tar.gz" -C "$out" || return 1
    [[ -x $out/tuic-zig ]] || return 1
    INSTALLED_VERSION=$ver
}

build_from_source(){
    # build_from_source <输出目录>
    local out=$1 src=${TUIC_ZIG_SRC:-https://github.com/$TUIC_ZIG_REPO.git} dir
    yellow "开始本机编译（会下载 Zig、OpenSSL、ngtcp2 源码，2 核机器约 10～20 分钟）"
    ensure_pkg make make
    ensure_pkg perl perl
    ensure_pkg xz xz-utils xz
    dir=$(mktemp -d)
    if [[ -d $src ]]; then
        cp -r "$src" "$dir/src"
    elif [[ $src == *.tar.gz ]]; then
        mkdir -p "$dir/src"
        if [[ -f $src ]]; then tar -xzf "$src" -C "$dir/src" --strip-components=1
        else curl -fL "$src" | tar -xz -C "$dir/src" --strip-components=1; fi
    else
        ensure_pkg git git
        git clone --depth 1 "$src" "$dir/src" || { rm -rf "$dir"; return 1; }
    fi
    if ! bash "$dir/src/build-release.sh" "$(arch_affix)"; then
        rm -rf "$dir"; return 1
    fi
    tar -xzf "$dir/src/dist/tuic-zig-linux-$(arch_affix).tar.gz" -C "$out" || { rm -rf "$dir"; return 1; }
    rm -rf "$dir"
    INSTALLED_VERSION="source-$(date +%Y%m%d)"
}

fetch_binary(){
    # 依次尝试：本地文件 → Release 下载 → 本机编译
    local tmp
    tmp=$(mktemp -d)
    if [[ -n $TUIC_ZIG_LOCAL_BIN && -x $TUIC_ZIG_LOCAL_BIN ]]; then
        cp -f "$TUIC_ZIG_LOCAL_BIN" "$tmp/tuic-zig"
        INSTALLED_VERSION="local"
    elif ! download_binary "$tmp"; then
        yellow "下载发布包失败"
        read -rp "是否改为本机从源码编译？[Y/n]：" yn
        if [[ ${yn,,} == n ]]; then rm -rf "$tmp"; red "已取消"; exit 1; fi
        build_from_source "$tmp" || { rm -rf "$tmp"; red "编译失败"; exit 1; }
    fi
    if ! "$tmp/tuic-zig" --version >/dev/null 2>&1; then
        rm -rf "$tmp"; red "获取到的 tuic-zig 无法在本机运行" && exit 1
    fi
    install -m 755 "$tmp/tuic-zig" "$BIN_PATH"
    rm -rf "$tmp"
    green "已安装：$("$BIN_PATH" --version)"
}

# ----------------------- 配置与服务 -----------------------

save_env(){
    mkdir -p "$CONF_DIR"
    cat > "$ENV_FILE" <<EOF
port='$port'
uuid='$uuid'
passwd='$passwd'
cert_path='$cert_path'
key_path='$key_path'
sni='$sni'
insecure='$insecure'
cc='$cc'
ip_mode='$ip_mode'
version='$INSTALLED_VERSION'
EOF
    chmod 600 "$ENV_FILE"
}

load_env(){
    [[ -f $ENV_FILE ]] || { red "未安装 tuic-zig" ; exit 1; }
    # shellcheck disable=SC1090
    source "$ENV_FILE"
    INSTALLED_VERSION=$version
}

write_config(){
    mkdir -p "$CONF_DIR"
    cat > "$CONF_FILE" <<EOF
{
    "server": "[::]:$port",
    "users": {
        "$uuid": "$passwd"
    },
    "certificate": "$cert_path",
    "private_key": "$key_path",
    "alpn": ["h3"],
    "congestion_control": "$cc",
    "udp_relay_ipv6": true,
    "ip_mode": "$ip_mode",
    "zero_rtt_handshake": false,
    "auth_timeout_ms": 3000,
    "max_idle_time_ms": 30000,
    "drop_loopback": true,
    "drop_private": true,
    "log_level": "warn"
}
EOF
    chmod 600 "$CONF_FILE"
}

write_service(){
    cat > "$SERVICE_FILE" <<EOF
[Unit]
Description=tuic-zig (TUIC v5 server)
Documentation=https://github.com/$TUIC_ZIG_REPO
After=network-online.target
Wants=network-online.target

[Service]
Type=simple
ExecStart=$BIN_PATH -c $CONF_FILE
Restart=on-failure
RestartSec=3
LimitNOFILE=1048576
AmbientCapabilities=CAP_NET_BIND_SERVICE
NoNewPrivileges=true

[Install]
WantedBy=multi-user.target
EOF
    systemctl daemon-reload
}

tune_sysctl(){
    # 提高 UDP 缓冲上限，QUIC 高吞吐需要（服务端会申请 8 MB 套接字缓冲）
    cat > /etc/sysctl.d/99-tuic-zig.conf <<'EOF'
net.core.rmem_max = 16777216
net.core.wmem_max = 16777216
EOF
    sysctl -p /etc/sysctl.d/99-tuic-zig.conf >/dev/null 2>&1
}

open_firewall(){
    local p=$1
    if command -v ufw >/dev/null 2>&1 && ufw status 2>/dev/null | grep -q "Status: active"; then
        ufw allow "$p"/udp >/dev/null 2>&1 && yellow "已在 ufw 放行 UDP $p"
    elif command -v firewall-cmd >/dev/null 2>&1 && systemctl is-active --quiet firewalld; then
        firewall-cmd --permanent --add-port="$p"/udp >/dev/null 2>&1 && firewall-cmd --reload >/dev/null 2>&1 && yellow "已在 firewalld 放行 UDP $p"
    else
        command -v iptables >/dev/null 2>&1 && ! iptables -C INPUT -p udp --dport "$p" -j ACCEPT 2>/dev/null && \
            iptables -I INPUT -p udp --dport "$p" -j ACCEPT 2>/dev/null
        command -v ip6tables >/dev/null 2>&1 && ! ip6tables -C INPUT -p udp --dport "$p" -j ACCEPT 2>/dev/null && \
            ip6tables -I INPUT -p udp --dport "$p" -j ACCEPT 2>/dev/null
    fi
    yellow "如果使用云服务商的安全组，请记得在控制台放行 UDP $p（IPv4 和 IPv6）"
}

close_firewall(){
    local p=$1
    [[ -z $p ]] && return
    if command -v ufw >/dev/null 2>&1; then ufw delete allow "$p"/udp >/dev/null 2>&1; fi
    if command -v firewall-cmd >/dev/null 2>&1; then firewall-cmd --permanent --remove-port="$p"/udp >/dev/null 2>&1 && firewall-cmd --reload >/dev/null 2>&1; fi
    command -v iptables >/dev/null 2>&1 && iptables -D INPUT -p udp --dport "$p" -j ACCEPT 2>/dev/null
    command -v ip6tables >/dev/null 2>&1 && ip6tables -D INPUT -p udp --dport "$p" -j ACCEPT 2>/dev/null
    return 0
}

service_ok(){
    sleep 1
    systemctl is-active --quiet "$SERVICE_NAME"
}

# ----------------------- 分享链接与客户端配置 -----------------------

gen_client_files(){
    detect_public_ips
    mkdir -p "$OUT_DIR"
    local insecure_q="" pw_enc host_main
    pw_enc=$(urlencode "$passwd")
    [[ $insecure == 1 ]] && insecure_q="&allow_insecure=1"
    : > "$OUT_DIR/url.txt"
    local h tag
    for h in "$PUBLIC_V4" "$PUBLIC_V6"; do
        [[ -z $h ]] && continue
        if [[ $h == *:* ]]; then tag="tuic-zig-v6"; else tag="tuic-zig-v4"; fi
        echo "tuic://$uuid:$pw_enc@$(bracket_host "$h"):$port?congestion_control=$cc&udp_relay_mode=native&alpn=h3&sni=$sni$insecure_q#$tag" >> "$OUT_DIR/url.txt"
    done
    # 客户端配置里的服务器地址：有可信证书时用域名，否则用 IPv4（没有 IPv4 则用 IPv6）
    if [[ $insecure == 0 ]]; then host_main=$sni; else host_main=${PUBLIC_V4:-$PUBLIC_V6}; fi
    local skip_bool=false
    [[ $insecure == 1 ]] && skip_bool=true

    # 官方 tuic-client（Rust）配置
    cat > "$OUT_DIR/tuic-client.json" <<EOF
{
    "relay": {
        "server": "$(bracket_host "$host_main"):$port",
        "uuid": "$uuid",
        "password": "$passwd",
        "sni": "$sni",
        "alpn": ["h3"],
        "udp_relay_mode": "native",
        "congestion_control": "$cc",
        "skip_cert_verify": $skip_bool
    },
    "local": {
        "server": "127.0.0.1:1080"
    },
    "log_level": "warn"
}
EOF

    # mihomo（Clash Meta）
    cat > "$OUT_DIR/clash-meta.yaml" <<EOF
proxies:
  - name: tuic-zig
    type: tuic
    server: $host_main
    port: $port
    uuid: $uuid
    password: "$passwd"
    alpn: [h3]
    sni: $sni
    skip-cert-verify: $skip_bool
    udp-relay-mode: native
    congestion-controller: $cc
    reduce-rtt: false
EOF

    # sing-box 出站
    cat > "$OUT_DIR/sing-box.json" <<EOF
{
    "type": "tuic",
    "tag": "tuic-zig",
    "server": "$host_main",
    "server_port": $port,
    "uuid": "$uuid",
    "password": "$passwd",
    "congestion_control": "$cc",
    "udp_relay_mode": "native",
    "tls": {
        "enabled": true,
        "server_name": "$sni",
        "alpn": ["h3"],
        "insecure": $skip_bool
    }
}
EOF
}

showconf(){
    load_env
    [[ -f $OUT_DIR/url.txt ]] || gen_client_files
    echo ""
    yellow "======== 服务端 ========"
    echo -e " 端口：${GREEN}$port${PLAIN}（UDP，同时监听 IPv4 与 IPv6）"
    echo -e " UUID：${GREEN}$uuid${PLAIN}"
    echo -e " 密码：${GREEN}$passwd${PLAIN}"
    echo -e " SNI ：${GREEN}$sni${PLAIN}  $( [[ $insecure == 1 ]] && echo "${YELLOW}（自签证书，客户端需允许不安全证书）${PLAIN}")"
    echo -e " 拥塞控制：${GREEN}$cc${PLAIN}   出站优先级：${GREEN}$ip_mode${PLAIN}"
    echo ""
    yellow "======== 分享链接（$OUT_DIR/url.txt）========"
    while read -r l; do red "$l"; done < "$OUT_DIR/url.txt"
    echo ""
    yellow "======== mihomo / Clash Meta（$OUT_DIR/clash-meta.yaml）========"
    cat "$OUT_DIR/clash-meta.yaml"
    echo ""
    yellow "其他客户端配置：$OUT_DIR/tuic-client.json、$OUT_DIR/sing-box.json"
    echo ""
}

# ----------------------- 主要操作 -----------------------

install_shortcut(){
    local self
    self=$(readlink -f "$0" 2>/dev/null)
    if [[ -f $self && $self != "$SHORTCUT" ]]; then
        install -m 755 "$self" "$SHORTCUT"
    elif [[ ! -f $SHORTCUT ]]; then
        curl -fsSL -o "$SHORTCUT" "$SCRIPT_URL" 2>/dev/null && chmod +x "$SHORTCUT"
    fi
}

do_install(){
    if [[ -f $SERVICE_FILE ]]; then
        red "tuic-zig 已安装，请在菜单中管理，或先卸载" && exit 1
    fi
    install_deps
    detect_public_ips
    yellow "检测到公网地址：IPv4 ${PUBLIC_V4:-无}，IPv6 ${PUBLIC_V6:-无}"
    inst_cert
    inst_port
    inst_uuid
    inst_pwd
    inst_cc
    inst_ipmode
    fetch_binary
    save_env
    write_config
    write_service
    tune_sysctl
    open_firewall "$port"
    systemctl enable "$SERVICE_NAME" >/dev/null 2>&1
    systemctl restart "$SERVICE_NAME"
    if service_ok; then
        green "tuic-zig 启动成功"
    else
        red "tuic-zig 启动失败，日志如下：" && journalctl -u "$SERVICE_NAME" -n 20 --no-pager && exit 1
    fi
    install_shortcut
    gen_client_files
    showconf
    green "以后输入 tuiczig 即可打开管理菜单"
}

do_uninstall(){
    read -rp "确定卸载 tuic-zig？配置和证书（自签）会一并删除 [y/N]：" yn
    [[ ${yn,,} != y ]] && exit 0
    [[ -f $ENV_FILE ]] && source "$ENV_FILE"
    systemctl disable --now "$SERVICE_NAME" >/dev/null 2>&1
    rm -f "$SERVICE_FILE" /etc/sysctl.d/99-tuic-zig.conf
    systemctl daemon-reload
    close_firewall "$port"
    rm -f "$BIN_PATH"
    rm -rf "$CONF_DIR" "$OUT_DIR"
    sed -i '\|# tuic-zig acme.sh auto-renew$|d' /etc/crontab 2>/dev/null
    rm -f "$SHORTCUT"
    green "tuic-zig 已彻底卸载（acme.sh 申请的 /root/cert.crt 证书保留）"
}

do_start(){ systemctl enable --now "$SERVICE_NAME" >/dev/null 2>&1; service_ok && green "已启动" || red "启动失败，可选菜单 7 查看日志"; }
do_stop(){ systemctl stop "$SERVICE_NAME"; green "已停止"; }
do_restart(){ systemctl restart "$SERVICE_NAME"; service_ok && green "已重启" || red "重启失败，可选菜单 7 查看日志"; }

switch_menu(){
    yellow "请选择操作："
    echo -e " ${GREEN}1.${PLAIN} 启动"
    echo -e " ${GREEN}2.${PLAIN} 停止"
    echo -e " ${GREEN}3.${PLAIN} 重启"
    read -rp "请输入选项 [1-3]：" s
    case $s in
        1) do_start ;;
        2) do_stop ;;
        3) do_restart ;;
        *) exit 1 ;;
    esac
}

changeconf(){
    load_env
    local oldport=$port
    green "修改配置："
    echo -e " ${GREEN}1.${PLAIN} 端口"
    echo -e " ${GREEN}2.${PLAIN} UUID"
    echo -e " ${GREEN}3.${PLAIN} 密码"
    echo -e " ${GREEN}4.${PLAIN} 拥塞控制"
    echo -e " ${GREEN}5.${PLAIN} 出站 IPv4 / IPv6 优先级"
    echo -e " ${GREEN}6.${PLAIN} 更换证书"
    read -rp "请输入选项 [1-6]：" c
    case $c in
        1) inst_port; close_firewall "$oldport"; open_firewall "$port" ;;
        2) inst_uuid ;;
        3) inst_pwd ;;
        4) inst_cc ;;
        5) inst_ipmode ;;
        6) detect_public_ips; inst_cert ;;
        *) exit 1 ;;
    esac
    save_env
    write_config
    do_restart
    gen_client_files
    green "配置已更新，新的分享链接如下"
    showconf
}

do_update(){
    load_env
    local cur
    cur=$("$BIN_PATH" --version 2>/dev/null)
    yellow "当前版本：${cur:-未知}（$INSTALLED_VERSION）"
    fetch_binary
    save_env
    write_service
    do_restart
}

do_status(){
    systemctl status "$SERVICE_NAME" --no-pager -l | head -n 15
    echo ""
    yellow "最近 30 行日志："
    journalctl -u "$SERVICE_NAME" -n 30 --no-pager
}

update_script(){
    if curl -fsSL -o "$SHORTCUT.new" "$SCRIPT_URL"; then
        mv -f "$SHORTCUT.new" "$SHORTCUT" && chmod +x "$SHORTCUT"
        green "脚本已更新，重新输入 tuiczig 打开"
    else
        rm -f "$SHORTCUT.new"; red "脚本更新失败"
    fi
}

status_line(){
    if [[ ! -f $SERVICE_FILE ]]; then
        echo -e "状态：${RED}未安装${PLAIN}"
    elif systemctl is-active --quiet "$SERVICE_NAME"; then
        echo -e "状态：${GREEN}运行中${PLAIN}  $("$BIN_PATH" --version 2>/dev/null)"
    else
        echo -e "状态：${YELLOW}已安装，未运行${PLAIN}"
    fi
}

menu(){
    clear
    echo "#############################################################"
    echo -e "#              ${RED}tuic-zig 一键安装管理脚本${PLAIN}                    #"
    echo -e "#   ${GREEN}TUIC v5 服务端（Zig + ngtcp2），IPv4 / IPv6 双栈${PLAIN}        #"
    echo "#############################################################"
    echo ""
    status_line
    echo ""
    echo -e " ${GREEN}1.${PLAIN} 安装 tuic-zig"
    echo -e " ${GREEN}2.${PLAIN} ${RED}卸载 tuic-zig${PLAIN}"
    echo " -------------"
    echo -e " ${GREEN}3.${PLAIN} 启动 / 停止 / 重启"
    echo -e " ${GREEN}4.${PLAIN} 修改配置"
    echo -e " ${GREEN}5.${PLAIN} 显示配置与分享链接"
    echo " -------------"
    echo -e " ${GREEN}6.${PLAIN} 更新 tuic-zig"
    echo -e " ${GREEN}7.${PLAIN} 查看运行状态与日志"
    echo -e " ${GREEN}8.${PLAIN} 更新本脚本"
    echo " -------------"
    echo -e " ${GREEN}0.${PLAIN} 退出"
    echo ""
    read -rp "请输入选项 [0-8]：" m
    case $m in
        1) do_install ;;
        2) do_uninstall ;;
        3) switch_menu ;;
        4) changeconf ;;
        5) showconf ;;
        6) do_update ;;
        7) do_status ;;
        8) update_script ;;
        *) exit 0 ;;
    esac
}

usage(){
    cat <<EOF
用法：bash $0 [命令]
  install     安装
  uninstall   卸载
  start|stop|restart
  status      运行状态与日志
  show        显示配置与分享链接
  update      更新 tuic-zig 二进制
  （不带参数打开菜单）
环境变量：
  TUIC_ZIG_REPO      发布包仓库（当前：$TUIC_ZIG_REPO）
  TUIC_ZIG_VERSION   指定版本，例如 v0.5.0
  TUIC_ZIG_LOCAL_BIN 使用本地已有的 tuic-zig 二进制
  TUIC_ZIG_SRC       源码地址（git 仓库、tar.gz 或本地目录），下载失败时用于本机编译
EOF
}

main(){
    check_root
    detect_os
    case "${1:-}" in
        install) do_install ;;
        uninstall) do_uninstall ;;
        start) do_start ;;
        stop) do_stop ;;
        restart) do_restart ;;
        status) do_status ;;
        show) showconf ;;
        update) do_update ;;
        -h|--help|help) usage ;;
        "") menu ;;
        *) usage; exit 1 ;;
    esac
}

main "$@"
