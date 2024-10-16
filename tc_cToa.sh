#!/bin/bash
# set -x

TC=/sbin/tc

# interface traffic will leave on
ONOS1=veth82eacc0
ONOS2=vethc42df5d
ONOS3=vethb432ab1
ONOS4=veth99bc6dc

ATOMIX1=veth0a87501
# IF=br-e5b0543c511f

# The parent limit, children can borrow from this amount of bandwidth
# based on what's available.
LIMIT="100mbit"

# the rate each child should start at
onos1_atomix1_delay="40ms"
onos2_atomix1_delay="70ms"
onos3_atomix1_delay="99ms"
onos4_atomix1_delay="66ms"
default="0ms"

# atomix-1
DST_Atomix1="172.20.0.2/16"
# # atomix-2
# DST_Atomix2="172.20.0.3/16"
# # atomix-3
# DST_Atomix3="172.20.0.4/16"
# onos1
DST_ONOS1="172.20.0.3/16"
# onos2
DST_ONOS2="172.20.0.4/16"
# onos3
DST_ONOS3="172.20.0.5/16"
# onos4
DST_ONOS4="172.20.0.6/16"

# the rate each child should start at
START_RATE="5mbit"

# the max rate each child should get to, if there is bandwidth
# to borrow from the parent.
# e.g. if parent is limited to 100mbits, both children, if transmitting at max at the same time,
# would be limited to 50mbits each.
CHILD_LIMIT="80mbit"

# # host 1
# DST_CIDR="172.20.0.2"
# # host 2
# DST_CIDR_2="172.20.0.6"

# filter command -- add ip dst match at the end
# U32="$TC filter add dev $IF protocol ip parent 1:0 prio 1 u32"

create () {
  echo "== SHAPING INIT =="

  tc qdisc add dev $ATOMIX1 root handle 1:0 htb
  tc filter add dev $ATOMIX1 parent 1:0 prior 1 protocol ip u32 match ip dst $DST_ONOS1 classid 1:1
  tc filter add dev $ATOMIX1 parent 1:0 prior 2 protocol ip u32 match ip dst $DST_ONOS2 classid 1:2
  tc filter add dev $ATOMIX1 parent 1:0 prior 3 protocol ip u32 match ip dst $DST_ONOS3 classid 1:3
  tc filter add dev $ATOMIX1 parent 1:0 prior 4 protocol ip u32 match ip dst $DST_ONOS4 classid 1:4
  tc class add dev $ATOMIX1 parent 1:0 classid 1:1 htb rate 10Mbit
  tc class add dev $ATOMIX1 parent 1:0 classid 1:2 htb rate 10Mbit
  tc class add dev $ATOMIX1 parent 1:0 classid 1:3 htb rate 10Mbit
  tc class add dev $ATOMIX1 parent 1:0 classid 1:4 htb rate 10Mbit
  tc qdisc add dev $ATOMIX1 parent 1:1 handle 2:0 netem delay $onos1_atomix1_delay
  tc qdisc add dev $ATOMIX1 parent 1:2 handle 3:0 netem delay $onos2_atomix1_delay
  tc qdisc add dev $ATOMIX1 parent 1:3 handle 4:0 netem delay $onos3_atomix1_delay
  tc qdisc add dev $ATOMIX1 parent 1:4 handle 5:0 netem delay $onos4_atomix1_delay
  
  # tc qdisc add dev $ONOS1 root handle 1:0 htb
  # # 挂载于同一个 qdisc 的 filter 优先级越低越早进行匹配
  # tc filter add dev $ONOS1 parent 1:0 prior 1 protocol ip u32 match ip dst $DST_Atomix1 classid 1:1
  # # tc filter add dev $ONOS1 parent 1:0 prior 2 protocol ip u32 match ip dst $DST_ONOS2 classid 1:2
  # # tc filter add dev $ONOS1 parent 1:0 prior 3 protocol ip u32 match ip dst $DST_ONOS3 classid 1:3
  # # tc filter add dev $ONOS1 parent 1:0 prior 4 protocol ip u32 match ip dst $DST_ONOS4 classid 1:4
  # tc class add dev $ONOS1 parent 1:0 classid 1:1 htb rate 10Mbit
  # # tc class add dev $ONOS1 parent 1:0 classid 1:2 htb rate 10Mbit
  # # tc class add dev $ONOS1 parent 1:0 classid 1:3 htb rate 10Mbit
  # # tc class add dev $ONOS1 parent 1:0 classid 1:4 htb rate 10Mbit
  # tc qdisc add dev $ONOS1 parent 1:1 handle 2:0 netem delay $onos1_atomix1_delay
  # # tc qdisc add dev $ONOS1 parent 1:2 handle 2:0 netem delay $default
  # # tc qdisc add dev $ONOS1 parent 1:3 handle 2:0 netem delay $default
  # # tc qdisc add dev $ONOS1 parent 1:4 handle 2:0 netem delay $default

  # tc qdisc add dev $ONOS2 root handle 3:0 htb
  # tc filter add dev $ONOS2 parent 3:0 prior 1 protocol ip u32 match ip dst $DST_Atomix1 classid 3:1
  # tc class add dev $ONOS2 parent 3:0 classid 3:1 htb rate 10Mbit
  # tc qdisc add dev $ONOS2 parent 3:1 handle 2:0 netem delay $onos2_atomix1_delay

  # tc qdisc add dev $ONOS3 root handle 5:0 htb
  # tc filter add dev $ONOS3 parent 5:0 prior 1 protocol ip u32 match ip dst $DST_Atomix1 classid 5:1
  # tc class add dev $ONOS3 parent 5:0 classid 5:1 htb rate 10Mbit
  # tc qdisc add dev $ONOS3 parent 5:1 handle 2:0 netem delay $onos3_atomix1_delay

  # tc qdisc add dev $ONOS4 root handle 7:0 htb
  # tc filter add dev $ONOS4 parent 7:0 prior 1 protocol ip u32 match ip dst $DST_Atomix1 classid 7:1
  # tc class add dev $ONOS4 parent 7:0 classid 7:1 htb rate 10Mbit
  # tc qdisc add dev $ONOS4 parent 7:1 handle 2:0 netem delay $onos4_atomix1_delay

  # br-a240a28b412a
  # tc qdisc add dev $IF root handle 1:0 htb default 2
  # # 挂载于同一个 qdisc 的 filter 优先级越低越早进行匹配
  # tc filter add dev $IF parent 1:0 prior 2 protocol ip u32 match ip dst $DST_CIDR classid 1:1  # 发往 10.66.1.1/24 的消息走 10Gbit、100ms 的 qdisc
  # tc filter add dev $IF parent 1:0 prior 3 protocol ip u32 match ip dst $DST_CIDR_2 classid 1:2  # 发往 10.66.1.1/16 的消息走 20Gbit、50ms 的 qdisc
  # tc class add dev $IF parent 1:0 classid 1:1 htb rate 10Gbit
  # tc class add dev $IF parent 1:0 classid 1:2 htb rate 20Gbit
  # tc qdisc add dev $IF parent 1:1 handle 2:0 netem delay 100ms
  # tc qdisc add dev $IF parent 1:2 handle 3:0 netem delay 50ms

  echo "== SHAPING DONE =="
}

# run clean to ensure existing tc is not configured
clean () {
  echo "== CLEAN INIT =="
#   $TC qdisc del dev $ONOS1 root
#   $TC qdisc del dev $ONOS2 root
#   $TC qdisc del dev $ONOS3 root
#   $TC qdisc del dev $ONOS4 root
  $TC qdisc del dev $ATOMIX1 root
  echo "== CLEAN DONE =="
}
clean
# create


# #!/bin/bash

# TC=/sbin/tc

# # interface traffic will leave on
# # IF=br-a240a28b412a
# IF=vethe896890
# # IF=ens160

# # The parent limit, children can borrow from this amount of bandwidth
# # based on what's available.
# LIMIT="100mbit"

# # the rate each child should start at
# onos1_delay="20ms"
# onos2_delay="40ms"
# atomix1_delay="88ms"
# atomix2_delay="188ms"
# atomix3_delay="288ms"

# # atomix-1
# DST_Atomix1="172.20.0.2"
# # atomix-2
# DST_Atomix2="172.20.0.3"
# # atomix-3
# DST_Atomix3="172.20.0.4"
# # onos1
# DST_ONOS1="172.20.0.5"
# # onos2
# DST_ONOS2="172.20.0.6"

# # the rate each child should start at
# START_RATE="5mbit"

# # the max rate each child should get to, if there is bandwidth
# # to borrow from the parent.
# # e.g. if parent is limited to 100mbits, both children, if transmitting at max at the same time,
# # would be limited to 50mbits each.
# CHILD_LIMIT="80mbit"

# # host 1
# DST_CIDR="172.20.0.2"
# # host 2
# DST_CIDR_2="172.20.0.6"

# # filter command -- add ip dst match at the end
# U32="$TC filter add dev $IF protocol ip parent 1:0 prio 1 u32"

# create () {
#   echo "== SHAPING INIT =="

#   # # create the root qdisc
#   # $TC qdisc add dev $IF root handle 1:0 htb \
#   #   default 30
#   # # $TC qdisc add dev $IF root handle 2:0 htb \
#   # #   default 30

#   # # create the parent qdisc, children will borrow bandwidth from
#   # $TC class add dev $IF parent 1:0 classid \
#   #   1:1 htb rate $LIMIT
#   # $TC class add dev $IF parent 2:0 classid \
#   #   2:1 htb rate $LIMIT

#   # # create children qdiscs; reference parent
#   # $TC class add dev $IF parent 1:1 classid \
#   #   1:10 htb rate $START_RATE ceil $CHILD_LIMIT
#   # $TC class add dev $IF parent 2:1 classid \
#   #   1:30 htb rate $START_RATE ceil $CHILD_LIMIT

#   # $TC qdisc add dev $IF parent 1:10 handle 2:0 netem delay $onos1_delay
#   # $TC qdisc add dev $IF parent 1:30 handle 3:0 netem delay $onos2_delay

#   # # setup filters to ensure packets are enqueued to the correct
#   # # child based on the dst IP of the packet
#   # $U32 match ip dst $DST_CIDR flowid 1:10
#   # $U32 match ip dst $DST_CIDR_2 flowid 1:30
  
#   tc qdisc add dev $IF root handle 1:0 htb
#   # 挂载于同一个 qdisc 的 filter 优先级越低越早进行匹配
#   tc filter add dev $IF parent 1:0 prior 1 protocol ip u32 match ip dst $DST_ONOS1 classid 1:1
#   tc filter add dev $IF parent 1:0 prior 2 protocol ip u32 match ip dst $DST_ONOS2 classid 1:2
#   tc filter add dev $IF parent 1:0 prior 3 protocol ip u32 match ip dst $DST_Atomix1 classid 1:3
#   tc filter add dev $IF parent 1:0 prior 4 protocol ip u32 match ip dst $DST_Atomix2 classid 1:4
#   tc filter add dev $IF parent 1:0 prior 5 protocol ip u32 match ip dst $DST_Atomix3 classid 1:5 
#   tc class add dev $IF parent 1:0 classid 1:1 htb rate 10Mbit
#   tc class add dev $IF parent 1:0 classid 1:2 htb rate 10Mbit
#   tc class add dev $IF parent 1:0 classid 1:3 htb rate 10Mbit
#   tc class add dev $IF parent 1:0 classid 1:4 htb rate 10Mbit
#   tc class add dev $IF parent 1:0 classid 1:5 htb rate 10Mbit
#   tc qdisc add dev $IF parent 1:1 handle 2:0 netem delay $onos1_delay
#   tc qdisc add dev $IF parent 1:2 handle 3:0 netem delay $onos2_delay
#   tc qdisc add dev $IF parent 1:3 handle 4:0 netem delay $atomix1_delay
#   tc qdisc add dev $IF parent 1:4 handle 5:0 netem delay $atomix2_delay
#   tc qdisc add dev $IF parent 1:5 handle 6:0 netem delay $atomix3_delay

#   # br-a240a28b412a
#   # tc qdisc add dev $IF root handle 1:0 htb default 2
#   # # 挂载于同一个 qdisc 的 filter 优先级越低越早进行匹配
#   # tc filter add dev $IF parent 1:0 prior 2 protocol ip u32 match ip dst $DST_CIDR classid 1:1  # 发往 10.66.1.1/24 的消息走 10Gbit、100ms 的 qdisc
#   # tc filter add dev $IF parent 1:0 prior 3 protocol ip u32 match ip dst $DST_CIDR_2 classid 1:2  # 发往 10.66.1.1/16 的消息走 20Gbit、50ms 的 qdisc
#   # tc class add dev $IF parent 1:0 classid 1:1 htb rate 10Gbit
#   # tc class add dev $IF parent 1:0 classid 1:2 htb rate 20Gbit
#   # tc qdisc add dev $IF parent 1:1 handle 2:0 netem delay 100ms
#   # tc qdisc add dev $IF parent 1:2 handle 3:0 netem delay 50ms

#   echo "== SHAPING DONE =="
# }

# # run clean to ensure existing tc is not configured
# clean () {
#   echo "== CLEAN INIT =="
#   $TC qdisc del dev $IF root
#   echo "== CLEAN DONE =="
# }
# clean
# create