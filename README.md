# Tools

+ bbr

```bash
bash <(curl -Ls https://raw.githubusercontent.com/Freddy8358/Tools/main/bbr.sh)

wget -O /tmp/bbr.sh https://raw.githubusercontent.com/Freddy8358/Tools/main/bbr.sh && bash /tmp/bbr.sh && rm -f /tmp/bbr.sh 
```

+ az

```bash
bash <(curl -Ls https://raw.githubusercontent.com/Freddy8358/Tools/main/az.sh)

wget -O /tmp/az.sh https://raw.githubusercontent.com/Freddy8358/Tools/main/az.sh && bash /tmp/az.sh && rm -f /tmp/az.sh 
```

+ ps

```bash
bash <(curl -Ls https://raw.githubusercontent.com/Freddy8358/Tools/main/ps.sh)

bash <(curl -Ls https://ghproxy.com/https://raw.githubusercontent.com/Freddy8358/Tools/main/ps.sh)
```

+ iptables

```bash
iptables -t nat -A  PREROUTING -p tcp --dport 10000:60000 -j DNAT --to-destination <target host>
iptables -t nat -A  PREROUTING -p udp --dport 10000:60000 -j DNAT --to-destination <target host>
iptables -t nat  -A POSTROUTING -j MASQUERADE
```