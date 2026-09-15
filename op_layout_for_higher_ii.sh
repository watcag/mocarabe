#!/bin/zsh

set -e

THREADS=1

mkdir -p log
echo "" > log/parallel_test.log

parallel --progress --bar --gnu -j$THREADS --header : \
  '
  echo ""
  echo hls/{b}
  bench=$(basename {b} .c)
  echo "$bench"
  ' \
  ::: i 0 1 \
  ::: b $(find vivad_comparison -maxdepth 1 -type f -name 'int_*' -exec basename {} \;)
