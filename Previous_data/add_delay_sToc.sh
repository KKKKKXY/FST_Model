# onos1 -> veth03a5e1e veth03a5e1e
# onos2 -> veth89d419f

# sudo tcset veth03a5e1e --direction incoming --delay 287ms --network 172.20.0.1 --port 41446
# sudo tcset veth03a5e1e --direction incoming --delay 345ms --network 172.20.0.1 --port 41460
# x sudo tcset veth03a5e1e --delay 300ms --network 172.20.0.1 --port 53302
# x sudo tcset s1-eth1 --direction incoming --delay 100ms --network 172.20.0.6
# x sudo tcset s1 --direction incoming --delay 100ms --network 172.20.0.6
# sudo tcset s1-eth2 --delay 50ms
# x sudo tcset s1 --direction incoming --delay 100ms --network 172.20.0.5
# x sudo tcset veth03a5e1e --src-network 172.20.0.1 --port 53302 --delay 300ms
# x sudo tcset veth03a5e1e --dst-network 172.20.0.1 --port 53302 --delay 300ms

#       NO.     s1c1    s1c2    s2c1    s2c2
#       1       287     0       0       0
#       2       287     444     0       0
#       3       287     444     666     0
#       4       287     444     666     345
#       5       0       444     0       0
#       6       0       444     666     0
#       7       0       444     666     345
#       8       0       0       666     0
#       9       0       0       666     345
#       20      0       0       0       345

ONOS1=veth03a5e1e
ONOS2=veth89d419f
S1=
S2=


# No.1
# s1c1
# sudo tcset $ONOS1 --direction incoming --delay 287ms --network 172.20.0.1 --port $S1

# # No.2
# # s1c1
# sudo tcset $ONOS1 --direction incoming --delay 287ms --network 172.20.0.1 --port $S1
# # s1c2
# sudo tcset $ONOS2 --direction incoming --delay 444ms --network 172.20.0.1 --port $S1

# # No.3
# # s1c1
# sudo tcset $ONOS1 --direction incoming --delay 287ms --network 172.20.0.1 --port $S1
# # s1c2
# sudo tcset $ONOS2 --direction incoming --delay 444ms --network 172.20.0.1 --port $S1
# # s2c1
# sudo tcset $ONOS1 --direction incoming --delay 666ms --network 172.20.0.1 --port $S2

# # No.4
# # s1c1
# sudo tcset $ONOS1 --direction incoming --delay 287ms --network 172.20.0.1 --port $S1
# # s1c2
# bsudo tcset $ONOS2 --direction incoming --delay 444ms --network 172.20.0.1 --port $S1
# # s2c1
# sudo tcset $ONOS1 --direction incoming --delay 666ms --network 172.20.0.1 --port $S2
# # s2c2
# sudo tcset $ONOS2 --direction incoming --delay 345ms --network 172.20.0.1 --port $S2

# # No.5
# # s1c2
# sudo tcset $ONOS2 --direction incoming --delay 444ms --network 172.20.0.1 --port $S1

# # No.6
# # s1c2
# sudo tcset $ONOS2 --direction incoming --delay 444ms --network 172.20.0.1 --port $S1
# # s2c1
# sudo tcset $ONOS1 --direction incoming --delay 666ms --network 172.20.0.1 --port $S2

# # No.7
# # s1c2
# sudo tcset $ONOS2 --direction incoming --delay 444ms --network 172.20.0.1 --port $S1
# # s2c1
# sudo tcset $ONOS1 --direction incoming --delay 666ms --network 172.20.0.1 --port $S2
# # s2c2
# sudo tcset $ONOS2 --direction incoming --delay 345ms --network 172.20.0.1 --port $S2

# # No.8
# # s2c1
# sudo tcset $ONOS1 --direction incoming --delay 666ms --network 172.20.0.1 --port $S2

# # No.9
# # s2c1
# sudo tcset $ONOS1 --direction incoming --delay 666ms --network 172.20.0.1 --port $S2
# # s2c2
# sudo tcset $ONOS2 --direction incoming --delay 345ms --network 172.20.0.1 --port $S2

# # No.10
# # s2c2
# sudo tcset $ONOS2 --direction incoming --delay 345ms --network 172.20.0.1 --port $S2
