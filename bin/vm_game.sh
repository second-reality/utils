#!/usr/bin/env bash

set -euo pipefail
set -x

ip=192.168.122.103

udp()
{
    port=$1
    sudo /sbin/iptables -I FORWARD -o virbr0 -p udp -d $ip --dport $port -j ACCEPT
    sudo /sbin/iptables -t nat -I PREROUTING -p udp --dport $port -j DNAT --to $ip:$port
}

tcp()
{
    port=$1
    sudo /sbin/iptables -I FORWARD -o virbr0 -p tcp -d $ip --dport $port -j ACCEPT
    sudo /sbin/iptables -t nat -I PREROUTING -p tcp --dport $port -j DNAT --to $ip:$port
}

save_iptables=/tmp/save.iptables

sudo iptables-save > $save_iptables
udp 47998
udp 47999
udp 48000
tcp 47984
tcp 47989
tcp 48010
trap "sudo iptables-restore < $save_iptables" EXIT

vm=win11
if [ "$(virsh --connect qemu:///system domstate $vm)" == "shut off" ]
then
    virsh --connect qemu:///system start $vm
fi

while [ "$(virsh --connect qemu:///system domstate $vm)" != "shut off" ]
do
    sleep 1
done
