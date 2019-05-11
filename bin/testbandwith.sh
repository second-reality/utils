#!/bin/bash

url=https://cdn.kernel.org/pub/linux/kernel/v5.x/linux-5.1.tar.xz
rm -rf /tmp/testbw*
aria2c -s 10 -x 10 -k 5M -d /tmp -o testbw $url
