#!/bin/bash
if [ "$1" = "-g" ]
then
echo .1.3.6.1.2.1.25.1.9
echo gauge
lvdisplay -m /dev/pve/data | grep "Allocated pool data" | awk '{print $4}' | sed 's/[.].*$//'
fi
exit 0
