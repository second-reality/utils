#!/bin/bash

set -u
clear

die()
{
	echo "ERROR: $@"
	exit 1
}

[[ $# -lt 2 ]] && die "usage: src dest [rsync_opt]"

src="$1"
shift
dest="$1"
shift
rsync_opt=(-a -h --delete "$@")

# check if param is not empty
[[ "$src" == "" ]] && die "src is empty"
[[ "$dest" == "" ]] && die "dest is empty"

# append / to avoid jokes
src="$src"/
dest="$dest"/

# check if folders exist
[[ ! -d "$src" ]] && die "src $src does not exist"
[[ ! -d "$dest" ]] && die "dest $dest does not exist"
# check if src is not empty (may delete all files in dest)
[[ "$(ls -A "$src")" == "" ]] && die "src $src is empty"
# check if dst is not empty (may be useless copy)
[[ "$(ls -A "$dest")" == "" ]] && die "dest $dest is empty"

echo "----------------------------------------------"
echo "backup $src to $dest"

echo "----------------------------------------------"
tmp_file=/tmp/backup$$
echo "call rsync to get stats"
# run rsync in dry run to get stats of what will change
rsync "${rsync_opt[@]}" -n --info=stats2 "$src" "$dest" > $tmp_file || die "rsync failed with code $?"
# echo stats
grep "Number" $tmp_file
grep "Total.*file"  $tmp_file
rm $tmp_file

echo "----------------------------------------------"
# ask to user if it is ok
read -p "shall we backup [y/n]?" answer
case $answer in
	[yY] ) ;;
	[nN] ) die "aborted by user" ;;
	* ) die "please answer y or n" ;;
esac

echo "----------------------------------------------"
echo "running rsync"
rsync $rsync_opt --info=progress2 ${rsync_user_opt[@]}"$src" "$dest" || die "rsync failed with code $?"

echo "----------------------------------------------"
echo "sync fs"
sync

echo "----------------------------------------------"
echo "backup complete: $src to $dest"
exit 0
