#!/bin/bash
if [ "$1" = "-g" ]
then
echo .1.3.6.1.2.1.25.1.8
echo gauge
echo `sensors -u | grep temp1_input -m 1 | awk '{print $2}' | sed 's/[0-9][0-9]$//'`
fi
exit 0
