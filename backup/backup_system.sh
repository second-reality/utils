#!/bin/bash
echo "--- Close all programs and press Enter"
read
echo "--- clean files"
rm -rf /home/user/.cache /home/user/.thumbnails /home/user/.macromedia /home/user/.local/share/Trash/
echo "--- create backup dir"
mkdir -p /data/backup/system
echo "--- backup packages list"
dpkg --get-selections | grep -v "deinstall$" | cut -f 1 > /data/backup/system/dpkg.list
echo "--- backup etc"
sudo tar -cvpf /data/backup/system/etc.tar /etc/
echo "--- backup home"
sudo tar -cvpf /data/backup/system/home.tar /home --exclude /home/user/.steam
echo "--- sync fs"
sync
echo "--- done"
