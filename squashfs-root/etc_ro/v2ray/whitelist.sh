#!/bin/sh
ipset -R < /etc_ro/v2ray/chnroute_ipset.conf

# ipset -N chnroute iphash

# for ip in $(cat '/etc_ro/v2ray/chnroute.txt'); do
#  ipset -A chnroute $ip
# done

iptables -t nat -N V2RAY
#iptables -t mangle -N V2RAY

# ֱ�������� IP
#iptables -t nat -A V2RAY -d 123.123.123.123 -j RETURN

# �������ӱ�����ַ
iptables -t nat -A V2RAY -d 0.0.0.0/8 -j RETURN
iptables -t nat -A V2RAY -d 10.0.0.0/8 -j RETURN
iptables -t nat -A V2RAY -d 127.0.0.0/8 -j RETURN
iptables -t nat -A V2RAY -d 169.254.0.0/16 -j RETURN
iptables -t nat -A V2RAY -d 172.16.0.0/12 -j RETURN
iptables -t nat -A V2RAY -d 192.168.0.0/16 -j RETURN
iptables -t nat -A V2RAY -d 224.0.0.0/4 -j RETURN
iptables -t nat -A V2RAY -d 240.0.0.0/4 -j RETURN

# �й�IP���ߴ���
iptables -t nat -A V2RAY -p tcp -m set --match-set chnroute dst -j RETURN
#iptables -t nat -A V2RAY -p icmp -m set --match-set chnroute dst -j RETURN

# ����ת����12345�˿�
#iptables -t nat -A V2RAY -p tcp -j REDIRECT --to-ports 12345
iptables -t nat -A V2RAY -p tcp --dport 22:500 -j REDIRECT --to-ports 12345
#iptables -t nat -A V2RAY -p tcp --dport 22 -j REDIRECT --to-ports 12345
#iptables -t nat -A V2RAY -p tcp --dport 80 -j REDIRECT --to-ports 12345
#iptables -t nat -A V2RAY -p tcp --dport 443 -j REDIRECT --to-ports 12345

#���UDP����
#ip route add local default dev lo table 100
#ip rule add fwmark 1 lookup 100
#iptables -t mangle -A V2RAY -p udp --dport 53 -j TPROXY --on-port 12345 --tproxy-mark 0x01/0x01
#iptables -t mangle -A V2RAY_MARK -p udp --dport 53 -j MARK --set-mark 1

# ת��·��
iptables -t nat -A PREROUTING -p tcp -j V2RAY
#iptables -t nat -A OUTPUT -p tcp -j V2RAY
#iptables -t mangle -A PREROUTING -j V2RAY
#iptables -t mangle -A OUTPUT -j V2RAY_MARK

sleep 2

pid=$(ps | awk '/[v]2ray --config/{print $1}')

if [ "$pid" == "" ]; then
    echo "started"
else
    echo "restarted"
    kill $pid
fi

cd /etc_ro/v2ray/

SSL_CERT_FILE=./cacert.pem ./v2ray --config=config2.json &