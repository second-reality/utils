#!/bin/bash
set -e

tmp=/tmp/_lockscreen.png
tmp_blur="$tmp"blur.png
rm -f $tmp $tmp_blur
scrot $tmp
convert -blur 50x15 -fill red -pointsize 50 -gravity center -annotate 0 'LOCKED' $tmp $tmp_blur
#i3lock -e -u -c '#ffa500'
i3lock -e -u -i $tmp_blur&
sleep 1 
xset dpms force off
wait
