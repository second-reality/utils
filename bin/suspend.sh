#!/bin/bash
set -e

#$(dirname $(readlink -f $0))/lockscreen.sh
sudo -n /usr/sbin/pm-suspend
