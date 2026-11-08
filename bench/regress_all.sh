#!/bin/sh
cd "$(dirname "$0")"; R=../results
clean(){ pkill -x tuic-client; pkill -x tuic-zig-v3; pkill -x tuic-zig-v4; pkill -x tuic-server; pkill -x iperf3; pkill -f 'bench/echo.py'; sleep 1; }
clean; python3 regress.py ../bin/tuic-zig-v3 zig native 2500 2000 > $R/regress-v3-native.json 2>/dev/null
clean; python3 regress.py ../bin/tuic-zig-v4 zig native 2500 2000 > $R/regress-v4-native.json 2>/dev/null
clean; python3 regress.py ../bin/tuic-zig-v3 zig quic 300 2000 > $R/regress-v3-quic.json 2>/dev/null
clean; python3 regress.py ../bin/tuic-zig-v4 zig quic 300 2000 > $R/regress-v4-quic.json 2>/dev/null
clean; python3 regress.py ../bin/tuic-server rust quic 300 2000 > $R/regress-rust-quic.json 2>/dev/null
clean; python3 regress.py ../bin/tuic-server rust native 2500 300 > $R/regress-rust-native.json 2>/dev/null
clean
