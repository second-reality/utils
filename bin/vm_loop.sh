#!/usr/bin/env bash

set -x

vm_game.sh

while true; do
    systemctl suspend
    vm=win10_gaming
    if [ "$(virsh --connect qemu:///system domstate $vm)" == "shut off" ]; then
        exit 0
    fi
    vm_game.sh
done
