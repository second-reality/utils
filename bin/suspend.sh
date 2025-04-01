#!/bin/bash
set -e

$(dirname $(readlink -f $0))/lockscreen.sh&

# stop all vm
get_vm()
{
  sudo virsh list --state-running --name
}

while [ "$(get_vm)" != "" ]; do
  sudo virsh shutdown $(get_vm)
  sleep 1
done

sleep 2
systemctl suspend
