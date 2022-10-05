# Tools

+ bbr

```bash
bash <(curl -Ls https://raw.githubusercontent.com/Freddy8358/Tools/main/bbr.sh)

bash <(curl -Ls https://ghproxy.com/https://raw.githubusercontent.com/Freddy8358/Tools/main/bbr.sh)

wget -O /tmp/bbr.sh https://raw.githubusercontent.com/Freddy8358/Tools/main/bbr.sh && bash /tmp/bbr.sh && rm -f /tmp/bbr.sh 
```


+ iptables

```bash
iptables -t nat -A  PREROUTING -p tcp --dport 10000:60000 -j DNAT --to-destination <target host>
iptables -t nat -A  PREROUTING -p udp --dport 10000:60000 -j DNAT --to-destination <target host>
iptables -t nat  -A POSTROUTING -j MASQUERADE
```


+ noip

```bash
mkdir /opt/noip/
wget -O /opt/noip/noip2 https://raw.githubusercontent.com/Freddy8358/Tools/main/noip2
chmod +x /opt/noip/noip2
/opt/noip/noip2 -C

wget -O /lib/systemd/system/noip2.service https://raw.githubusercontent.com/Freddy8358/Tools/main/noip2.service
systemctl enable noip2
systemctl restart noip2
systemctl status noip2
```