#!/usr/bin/env bash
# 构建可移植的 tuic-zig 发布包：OpenSSL 3.5 与 ngtcp2 静态链接，
# glibc 符号版本锁定到 2.17，所以同一个二进制能在 CentOS 7 之后的大多数发行版上运行。
#
# 用法：bash build-release.sh [x86_64|aarch64]   （默认本机架构）
# 产物：dist/tuic-zig-linux-<arch>.tar.gz（内含 tuic-zig 可执行文件）
# 依赖：curl、tar、xz、make、perl（OpenSSL 的 Configure 需要）
set -euo pipefail

ARCH=${1:-$(uname -m)}
case "$ARCH" in
    x86_64|amd64) ARCH=x86_64 ;;
    aarch64|arm64) ARCH=aarch64 ;;
    *) echo "不支持的架构：$ARCH" >&2; exit 1 ;;
esac

ZIG_VER=${ZIG_VER:-0.14.1}
OPENSSL_VER=${OPENSSL_VER:-3.5.7}
NGTCP2_VER=${NGTCP2_VER:-1.17.0}
GLIBC=${GLIBC:-2.17}
JOBS=${JOBS:-$(nproc)}

SRC=$(cd "$(dirname "$0")" && pwd)
WORK=${WORK:-$SRC/.release-build/$ARCH}
PREFIX=$WORK/prefix
mkdir -p "$WORK" "$PREFIX" "$SRC/dist"

# 带重试的下载：fetch <输出文件> <url> [备用 url...]
fetch(){
    local out=$1 u; shift
    for u in "$@"; do
        if curl -fL --retry 5 --retry-delay 3 --retry-all-errors -o "$out.part" "$u"; then
            mv -f "$out.part" "$out"; return 0
        fi
        echo "!! 下载失败：$u" >&2
    done
    rm -f "$out.part"; return 1
}

HOST=$(uname -m)
[[ $HOST == arm64 ]] && HOST=aarch64
TARGET="$ARCH-linux-gnu.$GLIBC"

# ---------- Zig ----------
ZIG_DIR=$WORK/../zig-$HOST-linux-$ZIG_VER
if ! command -v zig >/dev/null 2>&1 || [[ $(zig version) != "$ZIG_VER" ]]; then
    if [[ ! -x $ZIG_DIR/zig ]]; then
        echo ">> 下载 Zig $ZIG_VER ($HOST)"
        fetch "$WORK/../zig.tar.xz" "https://ziglang.org/download/$ZIG_VER/zig-$HOST-linux-$ZIG_VER.tar.xz"
        tar -xJf "$WORK/../zig.tar.xz" -C "$WORK/.." && rm -f "$WORK/../zig.tar.xz"
    fi
    export PATH=$ZIG_DIR:$PATH
fi

# zig cc 包装成普通编译器，供 OpenSSL/ngtcp2 的构建系统使用
mkdir -p "$WORK/bin"
cat > "$WORK/bin/cc" <<EOF
#!/bin/sh
exec zig cc -target $TARGET "\$@"
EOF
cat > "$WORK/bin/ar" <<'EOF'
#!/bin/sh
exec zig ar "$@"
EOF
cat > "$WORK/bin/ranlib" <<'EOF'
#!/bin/sh
exec zig ranlib "$@"
EOF
chmod +x "$WORK/bin/"*
export CC=$WORK/bin/cc AR=$WORK/bin/ar RANLIB=$WORK/bin/ranlib

# ---------- OpenSSL（静态）----------
if [[ ! -f $PREFIX/lib/libssl.a ]]; then
    echo ">> 编译 OpenSSL $OPENSSL_VER（静态，$TARGET）"
    cd "$WORK"
    if [[ ! -d openssl-$OPENSSL_VER ]]; then
        fetch openssl.tar.gz \
            "https://github.com/openssl/openssl/releases/download/openssl-$OPENSSL_VER/openssl-$OPENSSL_VER.tar.gz" \
            "https://www.openssl.org/source/openssl-$OPENSSL_VER.tar.gz" \
            "https://codeload.github.com/openssl/openssl/tar.gz/refs/tags/openssl-$OPENSSL_VER"
        tar -xzf openssl.tar.gz && rm -f openssl.tar.gz
        # codeload 源码包解压目录名为 openssl-openssl-<ver>
        [[ -d openssl-openssl-$OPENSSL_VER ]] && mv "openssl-openssl-$OPENSSL_VER" "openssl-$OPENSSL_VER"
    fi
    cd "openssl-$OPENSSL_VER"
    case "$ARCH" in
        x86_64) OSSL_T=linux-x86_64 ;;
        aarch64) OSSL_T=linux-aarch64 ;;
    esac
    ./Configure "$OSSL_T" no-shared no-tests no-docs no-apps no-module no-engine no-dso \
        --prefix="$PREFIX" --libdir=lib >/dev/null
    make -j"$JOBS" build_libs >/dev/null
    make install_dev >/dev/null
fi

# ---------- ngtcp2（静态，ossl 后端）----------
if [[ ! -f $PREFIX/lib/libngtcp2_crypto_ossl.a ]]; then
    echo ">> 编译 ngtcp2 $NGTCP2_VER"
    cd "$WORK"
    if [[ ! -d ngtcp2-$NGTCP2_VER ]]; then
        if fetch ngtcp2.tar.xz "https://github.com/ngtcp2/ngtcp2/releases/download/v$NGTCP2_VER/ngtcp2-$NGTCP2_VER.tar.xz"; then
            tar -xJf ngtcp2.tar.xz && rm -f ngtcp2.tar.xz
        else
            # 备用：git 标签源码包（无 configure，需要 autoreconf）
            fetch ngtcp2.tar.gz "https://codeload.github.com/ngtcp2/ngtcp2/tar.gz/refs/tags/v$NGTCP2_VER"
            tar -xzf ngtcp2.tar.gz && rm -f ngtcp2.tar.gz
        fi
    fi
    cd "ngtcp2-$NGTCP2_VER"
    [[ -x configure ]] || autoreconf -fi >/dev/null
    PKG_CONFIG_PATH=$PREFIX/lib/pkgconfig ./configure --host="$ARCH-linux-gnu" --prefix="$PREFIX" \
        --enable-lib-only --disable-shared --enable-static --with-openssl \
        OPENSSL_CFLAGS="-I$PREFIX/include" OPENSSL_LIBS="-L$PREFIX/lib -lssl -lcrypto" >/dev/null
    make -j"$JOBS" >/dev/null
    make install >/dev/null
fi

# ---------- tuic-zig ----------
echo ">> 编译 tuic-zig ($TARGET)"
cd "$SRC"
OUT=$WORK/out
mkdir -p "$OUT"
# 绑定生成按目标架构重新生成（不同架构的 glibc 结构体布局不同，例如 x86_64 的 epoll_event）
zig translate-c -target "$TARGET" -lc -I"$PREFIX/include" src/c_all.h > "$WORK/c_gen.zig"
cp src/c_gen.zig "$WORK/c_gen.zig.orig" 2>/dev/null || true
cp "$WORK/c_gen.zig" src/c_gen.zig
trap 'cp "$WORK/c_gen.zig.orig" "$SRC/src/c_gen.zig" 2>/dev/null || true' EXIT
zig build-exe -OReleaseFast -target "$TARGET" -lc -I"$PREFIX/include" \
    src/shim.c src/main.zig \
    "$PREFIX/lib/libngtcp2_crypto_ossl.a" "$PREFIX/lib/libngtcp2.a" \
    "$PREFIX/lib/libssl.a" "$PREFIX/lib/libcrypto.a" \
    -fstrip --name tuic-zig -femit-bin="$OUT/tuic-zig"
rm -f "$OUT/tuic-zig.o"

tar -C "$OUT" -czf "$SRC/dist/tuic-zig-linux-$ARCH.tar.gz" tuic-zig
(cd "$SRC/dist" && sha256sum "tuic-zig-linux-$ARCH.tar.gz" > "tuic-zig-linux-$ARCH.tar.gz.sha256")
echo ">> 完成：dist/tuic-zig-linux-$ARCH.tar.gz"
