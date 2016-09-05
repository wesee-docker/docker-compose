echo ifconfig -a|grep inet|grep 10|grep -v 127.0.0.1|grep -v inet6|awk '{print $2}'|tr -d "addr:" > host-ip
