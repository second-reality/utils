#!/bin/bash
echo "--- Close all programs and press Enter"
read
echo "--- clean files"
rm -rf /home/user/.cache /home/user/.thumbnails /home/user/.macromedia /tmp
echo "--- clean apt"
sudo apt-get clean
echo "--- backup packages list"
dpkg --get-selections | grep -v "deinstall$"  > /data/backup/system/dpkg.list
echo "--- backup boot"
sudo tar -cvpf /data/backup/system/boot.tar --one-file-system /boot
echo "--- backup system"
sudo tar -cvpf /data/backup/system/system.tar --exclude=/data/ --one-file-system /
echo "--- sync fs"
sync
echo "--- done"
