#!/usr/bin/env bash
#

cpu=$(LC_ALL=C top -bn1 | grep "Cpu(s)" | sed "s/.*, *\([0-9.]*\)%* id.*/\1/" | awk '{print 100 - $1}')
mem=$(free -m | awk '/Mem:/ { printf("%3.1f", $3/$2*100) }')

echo "CPU: $cpu%, RAM: $mem%"
