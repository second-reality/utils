#!/bin/bash
set -e

vm=win10_gaming
if [ "$(virsh --connect qemu:///system domstate $vm)" == "running" ]
then
    zenity --info --text "VM RUNNING, no suspend" || true
    exit 1
fi

$(dirname $(readlink -f $0))/lockscreen.sh&

sleep 2
systemctl suspend
setxkbmap us qwerty-fr
