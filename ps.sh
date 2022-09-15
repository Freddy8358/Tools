#!/bin/bash

apt update && apt full-upgrade -y && apt autoremove -y 

apt --purge autoremove -y linux-azure-* linux-cloud-tools-* walinuxagent 
pkill -9 hv_kvp_daemon

apt --purge autoremove *google* -y

echo "net.core.default_qdisc=fq" >> /etc/sysctl.conf
echo "net.ipv4.tcp_congestion_control=bbr" >> /etc/sysctl.conf
echo "net.ipv4.ip_local_port_range = 1024 65535" >> /etc/sysctl.conf
sysctl -p

reboot