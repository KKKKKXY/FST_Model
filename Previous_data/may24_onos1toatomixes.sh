#!/bin/bash
TC=/sbin/tc

# veth03a5e1e -> interface of onos1
# IF=br-3a5cee3d26ca -> interface of bridge ("onos-cluster-net" bridge)
IF=veth03a5e1e

# LIMIT="100mbit"
# the rate each child should start at
onos1_delay="111ms"
onos2_delay="233ms"
atomix1_delay="666ms"
atomix2_delay="555ms"
atomix3_delay="888ms"

# atomix-1
DST_Atomix1="172.20.0.2/32"
# atomix-2
DST_Atomix2="172.20.0.3/32"
# atomix-3
DST_Atomix3="172.20.0.4/32"
# onos1
DST_ONOS1="172.20.0.5/32"
# onos2
DST_ONOS2="172.20.0.6/32"

create () {
  echo "== SHAPING INIT =="
  tc qdisc add dev $IF root handle 1:0 htb default 30
  # 可以看这个链接 
  # from onos1 to atomix1/atomix2/atomix3
  tc filter add dev $IF parent 1:0 prior 1 protocol ip u32 match ip dst $DST_Atomix1 classid 1:1
  tc filter add dev $IF parent 1:0 prior 2 protocol ip u32 match ip dst $DST_Atomix2 classid 1:2
  tc filter add dev $IF parent 1:0 prior 3 protocol ip u32 match ip dst $DST_Atomix3 classid 1:3
  # bandwidth
  tc class add dev $IF parent 1:0 classid 1:1 htb rate 10Mbit
  tc class add dev $IF parent 1:0 classid 1:2 htb rate 10Mbit
  tc class add dev $IF parent 1:0 classid 1:3 htb rate 10Mbit
  tc qdisc add dev $IF parent 1:1 handle 2:0 netem delay $atomix1_delay
  tc qdisc add dev $IF parent 1:2 handle 3:0 netem delay $atomix2_delay
  tc qdisc add dev $IF parent 1:3 handle 4:0 netem delay $atomix3_delay

#   tc qdisc add dev vethaa3ae62 root handle 180a: htb default 1
#   tc class add dev vethaa3ae62 parent 180a: classid 180a:1 htb rate 10000000.0kbit
#   tc class add dev vethaa3ae62 parent 180a: classid 180a:85 htb rate 10000000.0Kbit ceil 10000000.0Kbit
#   tc qdisc add dev vethaa3ae62 parent 180a:85 handle 2333: netem delay 100.0ms
#   tc filter add dev vethaa3ae62 protocol ip parent 180a: prio 5 u32 match ip dst 172.20.0.2/32 match ip src 0.0.0.0/0 flowid 180a:85

#   tc qdisc add dev vethaa3ae62 root handle 1: htb default 30
#   tc class add dev vethaa3ae62 parent 1: classid 1:1 htb rate 10000000.0kbit
#   tc class add dev vethaa3ae62 parent 1: classid 1:85 htb rate 10000000.0Kbit ceil 10000000.0Kbit
#   tc qdisc add dev vethaa3ae62 parent 1:85 handle 2333: netem delay 100.0ms
#   tc filter add dev vethaa3ae62 protocol ip parent 1: prio 5 u32 match ip dst 172.20.0.2/32 match ip src 0.0.0.0/0 flowid 1:85

#   /usr/bin/ip link add ifb4966 type ifb
# /usr/bin/ip link set dev ifb4966 up
# /usr/sbin/tc qdisc add dev vethaa3ae62 ingress
# /usr/sbin/tc filter add dev vethaa3ae62 parent ffff: protocol ip u32 match u32 0 0 flowid 1366: action mirred egress redirect dev ifb4966
# /usr/sbin/tc qdisc add dev ifb4966 root handle 1366: htb default 1
# /usr/sbin/tc class add dev ifb4966 parent 1366: classid 1366:1 htb rate 32000000.0kbit
# /usr/sbin/tc class add dev ifb4966 parent 1366: classid 1366:76 htb rate 32000000.0Kbit ceil 32000000.0Kbit
# /usr/sbin/tc qdisc add dev ifb4966 parent 1366:76 handle 2117: netem delay 22.0ms
# /usr/sbin/tc filter add dev ifb4966 protocol ip parent 1366: prio 5 u32 match ip dst 172.20.0.1/32 match ip src 0.0.0.0/0 match ip dport 43790 0xffff flowid 1366:76


# mya@onoscluster:~$ sudo tc qdisc add dev vethae23d09 root handle 1: prio
# mya@onoscluster:~$ sudo tc filter add dev vethae23d09 parent 1:0 protocol ip prio 1 u32 match ip dst 172.20.0.2 flowid 2:1
# mya@onoscluster:~$ sudo tc qdisc add dev vethae23d09 parent 1:1 handle 2: netem delay 100ms
  echo "== SHAPING DONE =="
}

# run clean to ensure existing tc is not configured
clean () {
  echo "== CLEAN INIT =="
  $TC qdisc del dev $IF root
  echo "== CLEAN DONE =="
}
clean
create
