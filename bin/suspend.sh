#!/bin/bash
set -e

$(dirname $(readlink -f $0))/lockscreen.sh&
sleep 5
sudo -n /usr/sbin/pm-suspend
