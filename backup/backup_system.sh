#!/bin/bash
echo "--- Close all programs and press Enter"
read
echo "--- clean files"
rm -rf /home/user/.cache /home/user/.thumbnails /home/user/.macromedia
echo "--- create backup dir"
mkdir -p /data/backup/system
echo "--- backup packages list"
dpkg --get-selections | grep -v "deinstall$"  > /data/backup/system/dpkg.list
echo "--- backup user data"
tar -cvpf /data/backup/system/user.tar /home/user
echo "--- sync fs"
sync
echo "--- done"
