#!/usr/bin/env bash

set -euo pipefail

die()
{
  echo "FATAL: $@" >&2
  exit 1
}

[ $# -ge 2 ] || die "usage: out_folder pics..."

out_folder=$1
shift
mkdir -p $out_folder

for pic in "$@"; do
  name=$(basename $pic)
  echo convert $pic -resize 50% -quality 80% $out_folder/$name
done | parallel -j$(nproc) --bar || die "error while treating pictures"
