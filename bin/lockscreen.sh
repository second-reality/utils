#!/usr/bin/env bash
set -e

function screen_off()
{
  while [ 1 ]
  do
    sleep 10
    xset dpms force off
  done
}

tmp=/tmp/_lockscreen.png
tmp_blur="$tmp"blur.png
rm -f $tmp $tmp_blur
scrot $tmp
str="LOCKED"
convert -blur 50x15 -fill red -pointsize 80 -gravity center -annotate 0 "$str" $tmp $tmp_blur
#i3lock -e -u -c '#ffa500'
i3lock -e -u -n -i $tmp_blur&
lock_pid=$!
(screen_off)&
off_pid=$!

wait $lock_pid
kill $off_pid
