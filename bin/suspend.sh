#!/bin/bash
set -e

i3lock -e -u -c '#ffa500'
sleep 1
xset dpms force off
sudo -n /usr/sbin/pm-suspend
