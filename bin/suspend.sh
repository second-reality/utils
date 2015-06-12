#!/bin/bash
set -e

/data/work/repository/utils/bin/lockscreen.sh
sudo -n /usr/sbin/pm-suspend
