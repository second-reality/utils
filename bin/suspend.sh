#!/bin/bash
set -e

$(dirname $(readlink -f $0))/lockscreen.sh&

vm=win10_gaming
if [ "$(virsh --connect qemu:///system domstate $vm)" == "running" ]
then
    virsh --connect qemu:///system dompmsuspend $vm mem
    #zenity --info --text "VM RUNNING, no suspend" || true
    sleep 5
fi

sleep 1
systemctl suspend
setxkbmap us qwerty-fr
