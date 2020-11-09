# Configuration on Proxmox Host

## Install snmpd
apt install snmpd

## Configure snmpd
#### Edit /etc/snmp/snmpd.conf
`nano /etc/snmp/snmpd.conf`
#### Add basic configuration
```
#Listen on all interfaces, IPv4 only
agentAddress udp:161
#ACCESS CONTROL
view   all  included   .1.3.6.1.2.1.1
view   all  included   .1.3.6.1.2.1.25.1
#SNMP v2 (Read only) with community "public" restricted to Network 
#Please change IP 192.168.1.0/24 to your Network.
rocommunity public 192.168.1.0/24
sysLocation    YourCity
sysContact     YourName
#Run as root
agentuser  root
#Add commands
pass .1.3.6.1.2.1.25.1.8 /bin/sh /root/snmp-cpu-temp.sh
pass .1.3.6.1.2.1.25.1.9 /bin/sh /root/snmp-lvm-used.sh
pass .1.3.6.1.2.1.25.1.10 /bin/sh /root/snmp-smart-status.sh
```
#### Restart SNMPD
`systemctl restart snmpd.service`

# Configuration on PRTG WebUI
#### CPU temperature
* Add sensor
* SNMP Custom
* Name = CPU Temp
* OID = .1.3.6.1.2.1.25.1.8
* Channel Name = Temperature
* Unit String = °C

#### LVM used
* Add sensor
* SNMP Custom
* Name = LVM allocated pool data
* OID = .1.3.6.1.2.1.25.1.9
* Channel Name = LVM used
* Unit String = %

#### SMART status
* Add sensor
* SNMP Custom String
* Name = SMART status
* OID = .1.3.6.1.2.1.25.1.10
* Response Must Include (Down Status) = PASSED
* Response Must Include (Warning Status) = PASSED

![PRTG](https://i.postimg.cc/DZNMD74V/PRTG.png)

# Known issues
#### Recently debian added the user "Debian-snmp" to the snmp.service but for SMART/LVM Status we need the root user.
#### edit snmpd.service and replace "Debian-snmp" with "root"
`nano /lib/systemd/system/snmpd.service`
##### From
```
...
ExecStart=/usr/sbin/snmpd -Lsd -Lf /dev/null -u Debian-snmp -g Debian-snmp -I -smux,mteTrigger,mteTriggerConf -f -p /run/snmpd.pid
...
```
##### To
```
...
ExecStart=/usr/sbin/snmpd -Lsd -Lf /dev/null -u root -g Debian-snmp -I -smux,mteTrigger,mteTriggerConf -f -p /run/snmpd.pid
...
```

