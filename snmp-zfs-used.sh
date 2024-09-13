#!/bin/bash
if [ "$1" = "-g" ]
then
echo .1.3.6.1.2.1.25.1.11
echo gauge
zpool list rpool | grep "rpool" | awk '{print $8}' | sed 's/%//g'
fi
exit 0
