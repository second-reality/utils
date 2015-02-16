#!/bin/bash
set -e

amixer sset Master mute
i3lock -e -u -c '#ffa500'
sleep 1
xset dpms force off
sudo -n /usr/sbin/pm-suspend
