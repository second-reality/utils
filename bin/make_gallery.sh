#!/bin/bash

die()
{
  echo "DIE: $@"
  exit 1
}

pictures_dir="/var/www/public/pictures/"

[ $# -ne 2 ] && die "usage: src dest"
src="$1"
dest="$pictures_dir/$2"

[ -d "$dest" ] && die "$dest exists"
mkdir -p "$dest"

rsync -av /var/www/www/PhotoFloat/web/ "$dest/" --exclude cache/ ||
  die "copy gallery failed"
mkdir "$dest/cache"

/var/www/www/PhotoFloat/scanner/main.py "$src" "$dest"/cache ||
  die "gen gallery failed"

echo "gallery available at $dest"
