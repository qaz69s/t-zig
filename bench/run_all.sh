#!/bin/sh
# alternate servers each round; args: zig binary, rounds, tag
ZIG=${1:-../bin/tuic-zig}; R=${2:-2}; TAG=${3:-run}
cd "$(dirname "$0")"
for i in $(seq 1 $R); do
  for w in rust rust-o3 zig; do
    pkill -x tuic-server; pkill -x tuic-server-o3; pkill -x tuic-client; pkill -x "$(basename $ZIG)"; sleep 1
    python3 bench.py $w $ZIG > ../results/$TAG-$w-$i.json 2>/dev/null
  done
done
