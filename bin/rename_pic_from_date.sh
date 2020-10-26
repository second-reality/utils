#!/usr/bin/env bash

set -euo pipefail

die()
{
  echo "$@" >&2
  exit 1
}

[ $# -eq 1 ] || die "usage: pic directory"

dir=$1

exiftool -ext jpg '-FileName<CreateDate' -d %Y_%m_%d__%H_%M_%S%%-c.%%e $dir ||
  die "exif tool failed"
