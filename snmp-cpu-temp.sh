#!/bin/bash
if [ "$1" = "-g" ]
then
echo .1.3.6.1.2.1.25.1.8
echo gauge
echo `cat /sys/class/thermal/thermal_zone2/temp | sed 's/\(.\)..$/.\1/'`
fi
exit 0
