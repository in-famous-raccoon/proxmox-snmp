#!/bin/bash
if [ "$1" = "-g" ]
then
echo .1.3.6.1.2.1.25.1.8
echo gauge
# when sensors packages is installed, use this:
echo `sensors -u | grep temp1_input -m 1 | awk '{print $2}' | sed 's/[0-9][0-9]$//'`
# otherwise uncomment this and comment out the line above
#echo `cat /sys/class/thermal/thermal_zone2/temp | sed 's/\(.\)..$/.\1/'`
fi
exit 0
