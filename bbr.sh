#!/bin/bash

# update
apt update && apt full-upgrade -y && apt autoremove -y 
apt install -y wget curl net-tools haveged

# enable haveged
systemctl enable haveged
systemctl restart haveged


# ipv4 precedence
echo "precedence ::ffff:0:0/96  100" >> /etc/gai.conf

# sysctl settings
# refer https://www.starduster.me/2020/03/02/linux-network-tuning-kernel-parameter
cat >> /etc/sysctl.conf << EOF

net.ipv4.tcp_rmem = 16384 262144 8388608
net.ipv4.tcp_wmem = 32768 524288 16777216
net.core.wmem_default = 2097152
net.core.rmem_max = 16777216
net.core.wmem_max = 16777216
net.ipv4.tcp_max_tw_buckets = 8192
net.ipv4.tcp_max_syn_backlog = 40960
net.core.netdev_max_backlog = 20480
net.ipv4.tcp_syn_retries = 3
net.ipv4.tcp_synack_retries = 3
net.ipv4.tcp_keepalive_time = 600
net.ipv4.tcp_syncookies = 1
net.ipv4.tcp_fin_timeout = 10
net.ipv4.tcp_tw_reuse = 1
net.ipv4.tcp_timestamps = 1
net.ipv4.tcp_abort_on_overflow = 1
net.ipv4.tcp_slow_start_after_idle = 0
net.core.somaxconn = 40960
net.core.default_qdisc = fq
net.ipv4.tcp_congestion_control = bbr
net.ipv4.ip_local_port_range = 10240 65535
EOF

sysctl -p


# ulimit
cat >> /etc/security/limits.conf << EOF

* soft nofile 65535
* hard nofile 65535
* soft nproc 65535
* hard nproc 65535
root soft nofile 65535
root hard nofile 65535
root soft nproc 65535
root hard nproc 65535
EOF
