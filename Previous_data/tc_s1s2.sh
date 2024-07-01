#!/bin/bash

TC=/sbin/tc

# interface traffic will leave on
#IF=br-3a5cee3d26ca
IF=veth03a5e1e


LIMIT="100mbit"

# the rate each child should start at
onos1_delay="200ms"
onos2_delay="100ms"
atomix1_delay="0ms"
atomix2_delay="5.822948186ms"
atomix3_delay="10.87414195ms"

# atomix-1
DST_Atomix1="172.20.0.2"
# atomix-2
DST_Atomix2="172.20.0.3"
# atomix-3
DST_Atomix3="172.20.0.4"
# onos1
DST_ONOS1="172.20.0.5"
# onos2
DST_ONOS2="172.20.0.6"

# the rate each child should start at
START_RATE="5mbit"

# the max rate each child should get to, if there is bandwidth
# to borrow from the parent.
# e.g. if parent is limited to 100mbits, both children, if transmitting at max at the same time,
# would be limited to 50mbits each.
CHILD_LIMIT="80mbit"

# host 1
DST_CIDR="172.20.0.2"
# host 2
DST_CIDR_2="172.20.0.6"

# filter command -- add ip dst match at the end
U32="$TC filter add dev $IF protocol ip parent 1:0 prio 1 u32"

create () {
  echo "== SHAPING INIT =="
  tc qdisc add dev $IF root handle 1:0 htb
  # 挂载于同一个 qdisc 的 filter 优先级越低越早进行匹配
  # x tc filter add dev $IF parent 1:0 prior 1 protocol ip u32 match ip dst 172.20.0.1/32 match ip src 0.0.0.0/0 match ip dport 57284 0xffff classid 1:1
  tc filter add dev $IF parent 1:0 prior 1 protocol ip u32 match ip dst 0.0.0.0/0 match ip src 172.20.0.1/32 match ip dport 57284 0xffff match ip dport 57284 0xffff classid 1:1
  # x tc filter add dev $IF parent 1:0 prior 1 protocol ip u32 match ip dst 0.0.0.0/0 match ip src 172.20.0.1/32 match ip sport 57284 0xffff classid 1:1
  # x tc filter add dev $IF parent 1:0 prior 1 protocol ip u32 match ip src 172.20.0.1/32 match ip dport 57284 0xffff classid 1:1
  # x tc filter add dev $IF parent 1:0 prior 1 protocol ip u32 match ip dst 172.20.0.1/32 match ip dport 57284 0xffff classid 1:1  
  #tc filter add dev $IF parent 1:0 prior 2 protocol ip u32 match ip dst $DST_ONOS2 classid 1:2
  #tc filter add dev $IF parent 1:0 prior 3 protocol ip u32 match ip dst $DST_Atomix1 classid 1:3
  #tc filter add dev $IF parent 1:0 prior 4 protocol ip u32 match ip dst $DST_Atomix2 classid 1:4
  #tc filter add dev $IF parent 1:0 prior 5 protocol ip u32 match ip dst $DST_Atomix3 classid 1:5 
  tc class add dev $IF parent 1:0 classid 1:1 htb rate 10Mbit
  #tc class add dev $IF parent 1:0 classid 1:2 htb rate 10Mbit
  #tc class add dev $IF parent 1:0 classid 1:3 htb rate 10Mbit
  #tc class add dev $IF parent 1:0 classid 1:4 htb rate 10Mbit
  #tc class add dev $IF parent 1:0 classid 1:5 htb rate 10Mbit
  tc qdisc add dev $IF parent 1:1 handle 2:0 netem delay $onos1_delay
  #tc qdisc add dev $IF parent 1:2 handle 3:0 netem delay $onos2_delay
  #tc qdisc add dev $IF parent 1:3 handle 4:0 netem delay $atomix1_delay
  #tc qdisc add dev $IF parent 1:4 handle 5:0 netem delay $atomix2_delay
  #tc qdisc add dev $IF parent 1:5 handle 6:0 netem delay $atomix3_delay

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
