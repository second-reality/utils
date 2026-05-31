#!/bin/bash
set -e

# stop all vm
get_vm()
{
  sudo virsh list --state-running --name
}

$(dirname $(readlink -f $0))/lockscreen.sh&

sudo virsh dompmsuspend win10_gaming mem

#if [ "$(get_vm)" != "" ]; then
#    zenity --info --text "VM RUNNING, no suspend" || true
#    exit 1
#fi

#while [ "$(get_vm)" != "" ]; do
#  sudo virsh shutdown $(get_vm)
#  sleep 1
#done

sleep 10
systemctl suspend
setxkbmap us qwerty-fr
