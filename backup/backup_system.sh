#!/bin/bash
echo "Close all programs and press Enter"
read
rm -rf /home/user/.cache /home/user/.thumbnails /home/user/.macromedia /tmp
sudo apt-get clean
dpkg --get-selections | grep -v "deinstall$"  > /data/backup/system/dpkg.list
sudo tar -cvpf /data/backup/system/boot.tar --one-file-system /boot
sudo tar -cvpf /data/backup/system/system.tar --one-file-system /
sync
