#!/bin/sh
# Builds tuic-zig. DEPS = prefix where ngtcp2 (with the ossl crypto backend) is installed.
set -e
DEPS=${DEPS:-/workspace/work/deps}
OPT=${OPT:-ReleaseFast}
cd "$(dirname "$0")"
[ -s src/c_gen.zig ] || zig translate-c -lc -I"$DEPS/include" src/c_all.h > src/c_gen.zig
mkdir -p zig-out/bin
zig build-exe -O"$OPT" -lc -I"$DEPS/include" src/shim.c src/main.zig \
  "$DEPS/lib/libngtcp2_crypto_ossl.a" "$DEPS/lib/libngtcp2.a" \
  -L/usr/lib/$(uname -m)-linux-gnu -lssl -lcrypto \
  --name tuic-zig -femit-bin=zig-out/bin/tuic-zig ${ZIGFLAGS}
