#!/usr/bin/env bash

lock=/tmp/.keep_network_alive
exec 200>$lock
flock -n 200
if [ $? -ne 0 ]; then
  echo "another instance is running"
  exit 0
fi

while [ 1 ]; do
  wget -q http://mafreebox.freebox.fr/ -O - > /dev/null
  echo "alive $(date)"
  sleep 5
done
