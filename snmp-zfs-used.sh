#!/bin/bash
if [ "$1" = "-g" ]
then
echo .1.3.6.1.2.1.25.1.11
echo gauge
zpool list rpool | grep "rpool" | awk '{print $3}' | sed 's/[A-Z]//g'
fi
exit 0
