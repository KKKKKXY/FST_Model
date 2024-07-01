#sudo tc qdisc del dev vethd9993f6 root
#sudo tc qdisc add dev vethd9993f6 root handle 1:0 htb default 2
# 挂载于同一个 qdisc 的 filter 优先级越低越早进行匹配
#sudo tc filter add dev vethd9993f6 parent 1:0 prior 2 protocol ip u32 match ip dst 172.20.0.2/16 classid 1:1  # 发往 10.66.1.1/24 的消息走 10Gbit、100ms 的 qdisc
#sudo tc filter add dev vethd9993f6 parent 1:0 prior 2 protocol ip u32 match ip dst 172.20.0.3/16 classid 1:2  # 发往 10.66.1.1/16 的消息走 20Gbit、50ms 的 qdisc
#sudo tc class add dev vethd9993f6 parent 1:0 classid 1:1 htb rate 10Gbit
#sudo tc class add dev vethd9993f6 parent 1:0 classid 1:2 htb rate 10Gbit
#sudo tc qdisc add dev vethd9993f6 parent 1:1 handle 2:0 netem delay 88ms
#sudo tc qdisc add dev vethd9993f6 parent 1:2 handle 3:0 netem delay 20ms


interface=veth66406ea
onos1=172.20.0.5/16
onos2=172.20.0.6/16
delay1=88ms
delay2=188ms
#sudo tc filter add dev eth0 protocol ip parent 10: prio 1 u32 match \
#  ip dport 6653 0xffff flowid 10:1
sudo tc qdisc del dev $interface root
sudo tc qdisc add dev $interface root handle 1:0 htb default 2
sudo tc filter add dev $interface parent 1:0 prior 2 protocol ip u32 \ 
	match ip dst 172.20.0.5 \

#sudo tc filter add dev $interface parent 1:0 prior 2 protocol ip u32 match ip dst 172.20.0.6:6653 classid 1:2  # 发往 10.66.1.1/16 的消息走 20Gbit、50ms 的 qdisc
#sudo tc class add dev $interface parent 1:0 classid 1:1 htb rate 10Gbit
#sudo tc class add dev $interface parent 1:0 classid 1:2 htb rate 10Gbit
#sudo tc qdisc add dev $interface parent 1:1 handle 2:0 netem delay 88ms
#sudo tc qdisc add dev $interface parent 1:2 handle 3:0 netem delay 20ms


#veth66406ea
#sudo tc qdisc add dev veth66406ea root handle 1:0 htb default 2
# 挂载于同一个 qdisc 的 filter 优先级越低越早进行匹配
#sudo tc filter add dev veth66406ea parent 1:0 prior 2 protocol ip u32 match ip dst 172.20.0.5/16 classid 1:1  # 发往 10.66.1.1/24 的消息走 10Gbit、100ms 的 qdisc
#sudo tc filter add dev veth66406ea parent 1:0 prior 2 protocol ip u32 match ip dst 172.20.0.6/16 classid 1:2  # 发往 10.66.1.1/16 的消息走 20Gbit、50ms 的 qdisc
#sudo tc class add dev veth66406ea parent 1:0 classid 1:1 htb rate 10Gbit
#sudo tc class add dev veth66406ea parent 1:0 classid 1:2 htb rate 10Gbit
#sudo tc qdisc add dev veth66406ea parent 1:1 handle 2:0 netem delay 88ms
#sudo tc qdisc add dev veth66406ea parent 1:2 handle 3:0 netem delay 20ms

#br-a240a28b412a
#sudo tc qdisc add dev veth66406ea root handle 1:0 htb default 2
# 挂载于同一个 qdisc 的 filter 优先级越低越早进行匹配
#sudo tc filter add dev br-a240a28b412a parent 1:0 prior 2 protocol ip u32 match ip dst 172.20.0.5/16 classid 1:1  # 发往 10.66.1.1/24 的消息走 10Gbit、100ms 的 qdisc
#sudo tc filter add dev br-a240a28b412a parent 1:0 prior 2 protocol ip u32 match ip dst 172.20.0.6/16 classid 1:2  # 发往 10.66.1.1/16 的消息走 20Gbit、50ms 的 qdisc
#sudo tc class add dev br-a240a28b412a parent 1:0 classid 1:1 htb rate 10Gbit
#sudo tc class add dev br-a240a28b412a parent 1:0 classid 1:2 htb rate 10Gbit
#sudo tc qdisc add dev br-a240a28b412a parent 1:1 handle 2:0 netem delay 88ms
#sudo tc qdisc add dev br-a240a28b412ia parent 1:2 handle 3:0 netem delay 20ms
