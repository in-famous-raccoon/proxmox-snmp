#!/bin/bash
if [ "$1" = "-g" ]
then
echo .1.3.6.1.2.1.25.1.10
echo STRING
if 
smartctl -H /dev/sda | grep "PASSED" | nawk '{print $6}' && smartctl -H /dev/nvme0n1p3 | grep "PASSED" | nawk '{print $6}'
fi
exit 0
