# Configuration on Proxmox Host

## Install snmpd
apt install snmpd

## Configure snmpd
#### Edit /etc/snmp/snmpd.conf <br />
`nano /etc/snmp/snmpd.conf` <br />
#### Add basic configuration <br />
`# Listen on all interfaces IPv4 only`<br />
`agentAddress udp:161`<br />
`# ACCESS CONTROL` <br />
`view   all  included   .1.3.6.1.2.1.1` <br />
`view   all  included   .1.3.6.1.2.1.25.1` <br />
`#Read only snmp v2 with community public` <br /> 
`#Change IP to your used IP` <br />
`rocommunity public 192.168.1.0/24` <br />
`sysLocation    YourCity` <br />
`sysContact     YourName` <br />
`# Run as root` <br />
`agentuser  root` <br />
`# Add commands` <br />
`pass .1.3.6.1.2.1.25.1.8 /bin/sh /root/snmp-cpu-temp.sh`<br />
`pass .1.3.6.1.2.1.25.1.9 /bin/sh /root/snmp-lvm-used.sh`<br />
`pass .1.3.6.1.2.1.25.1.10 /bin/sh /root/snmp-smart-status.sh`<br />
#### Restart SNMPD <br />
`systemctl restart snmpd.service`
