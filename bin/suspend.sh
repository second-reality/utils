#!/bin/bash
set -e

# stop all vm
get_vm()
{
  sudo virsh list --state-running --name
}

if [ "$(get_vm)" != "" ]; then
    zenity --info --text "VM RUNNING, no suspend" || true
    exit 1
fi

$(dirname $(readlink -f $0))/lockscreen.sh&

while [ "$(get_vm)" != "" ]; do
  sudo virsh shutdown $(get_vm)
  sleep 1
done

sleep 2
systemctl suspend
