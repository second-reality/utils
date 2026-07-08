#!/bin/bash
set -e

$(dirname $(readlink -f $0))/lockscreen.sh&

#vm=win10_gaming
#resume_vm=0
#if [ "$(virsh --connect qemu:///system domstate $vm)" == "running" ]
#then
#    virsh --connect qemu:///system dompmsuspend $vm mem
#    #zenity --info --text "VM RUNNING, no suspend" || true
#    resume_vm=1
#    sleep 5
#fi

sleep 1
systemctl suspend
setxkbmap us qwerty-fr

screen_on()
{
    for _ in $(seq 0 10); do
        xset dpms force on
        sleep 1
    done
}

screen_on&
sleep 10
#sleep 1
#if [ "$resume_vm" -eq 1 ]; then
#    virsh --connect qemu:///system dompmwakeup $vm
#fi
