#!/bin/bash
if [ "$1" = "-g" ]
then
echo .1.3.6.1.2.1.25.1.12
echo gauge
ceph osd df | grep "TOTAL" | awk '{print $14}'
fi
exit 0
