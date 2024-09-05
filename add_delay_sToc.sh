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

#  ONOS No.     s1    s2    s3    s4
#     c1       20     0       0       0
#     c2       30     444     0       0
#     c3       99     444     666     0
#     c4       55     444     0     345
#     c5       0       0     0       0
#     c6       0       0     0     0
#     c7       0       0     0     0
#     c8       0       0       0     0
#     c9       0       0       0     0
#     c10      0       0       0       0
#     c11      0       0       0       0
#     c12      0       0       0       0
#     c13      0       0       0       0
#     c14      0       0       0       0
#     c15      0       0       0       0
#     c16      0       0       0       0

ONOS1=
ONOS2=
ONOS3=
ONOS4=
S1=
S2=
S3=
S4=


# No.1
# s1c1
sudo tcset $ONOS1 --direction incoming --delay 20ms --network 172.20.0.1 --port $S1
sudo tcset $ONOS2 --direction incoming --delay 30ms --network 172.20.0.1 --port $S1
sudo tcset $ONOS3 --direction incoming --delay 99ms --network 172.20.0.1 --port $S1
sudo tcset $ONOS4 --direction incoming --delay 55ms --network 172.20.0.1 --port $S1

sudo tcset $ONOS1 --direction incoming --delay 99ms --network 172.20.0.1 --port $S2
sudo tcset $ONOS2 --direction incoming --delay 55ms --network 172.20.0.1 --port $S2
sudo tcset $ONOS3 --direction incoming --delay 11ms --network 172.20.0.1 --port $S2
sudo tcset $ONOS4 --direction incoming --delay 44ms --network 172.20.0.1 --port $S2

sudo tcset $ONOS1 --direction incoming --delay 11ms --network 172.20.0.1 --port $S3
sudo tcset $ONOS2 --direction incoming --delay 44ms --network 172.20.0.1 --port $S3
sudo tcset $ONOS3 --direction incoming --delay 88ms --network 172.20.0.1 --port $S3
sudo tcset $ONOS4 --direction incoming --delay 77ms --network 172.20.0.1 --port $S3

sudo tcset $ONOS1 --direction incoming --delay 88ms --network 172.20.0.1 --port $S4
sudo tcset $ONOS2 --direction incoming --delay 77ms --network 172.20.0.1 --port $S4
sudo tcset $ONOS3 --direction incoming --delay 20ms --network 172.20.0.1 --port $S4
sudo tcset $ONOS4 --direction incoming --delay 30ms --network 172.20.0.1 --port $S4
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


# sudo tcset $ONOS1 --direction incoming --delay 20ms --network 172.20.0.1 --port $S1
# sudo tcset $ONOS2 --direction incoming --delay 30ms --network 172.20.0.1 --port $S1
# sudo tcset $ONOS3 --direction incoming --delay 99ms --network 172.20.0.1 --port $S1
# sudo tcset $ONOS4 --direction incoming --delay 55ms --network 172.20.0.1 --port $S1

# sudo tcset $ONOS1 --direction incoming --delay 99ms --network 172.20.0.1 --port $S2
# sudo tcset $ONOS2 --direction incoming --delay 55ms --network 172.20.0.1 --port $S2
# sudo tcset $ONOS3 --direction incoming --delay 11ms --network 172.20.0.1 --port $S2
# sudo tcset $ONOS4 --direction incoming --delay 44ms --network 172.20.0.1 --port $S2

# sudo tcset $ONOS1 --direction incoming --delay 11ms --network 172.20.0.1 --port $S3
# sudo tcset $ONOS2 --direction incoming --delay 44ms --network 172.20.0.1 --port $S3
# sudo tcset $ONOS3 --direction incoming --delay 88ms --network 172.20.0.1 --port $S3
# sudo tcset $ONOS4 --direction incoming --delay 77ms --network 172.20.0.1 --port $S3

# sudo tcset $ONOS1 --direction incoming --delay 88ms --network 172.20.0.1 --port $S4
# sudo tcset $ONOS2 --direction incoming --delay 77ms --network 172.20.0.1 --port $S4
# sudo tcset $ONOS3 --direction incoming --delay 20ms --network 172.20.0.1 --port $S4
# sudo tcset $ONOS4 --direction incoming --delay 30ms --network 172.20.0.1 --port $S4

# sudo tcset $ONOS1 --direction incoming --delay 20ms --network 172.20.0.1 --port $S5
# sudo tcset $ONOS2 --direction incoming --delay 30ms --network 172.20.0.1 --port $S5
# sudo tcset $ONOS3 --direction incoming --delay 99ms --network 172.20.0.1 --port $S5
# sudo tcset $ONOS4 --direction incoming --delay 55ms --network 172.20.0.1 --port $S5

# sudo tcset $ONOS1 --direction incoming --delay 99ms --network 172.20.0.1 --port $S6
# sudo tcset $ONOS2 --direction incoming --delay 55ms --network 172.20.0.1 --port $S6
# sudo tcset $ONOS3 --direction incoming --delay 11ms --network 172.20.0.1 --port $S6
# sudo tcset $ONOS4 --direction incoming --delay 44ms --network 172.20.0.1 --port $S6

# sudo tcset $ONOS1 --direction incoming --delay 11ms --network 172.20.0.1 --port $S7
# sudo tcset $ONOS2 --direction incoming --delay 44ms --network 172.20.0.1 --port $S7
# sudo tcset $ONOS3 --direction incoming --delay 88ms --network 172.20.0.1 --port $S7
# sudo tcset $ONOS4 --direction incoming --delay 77ms --network 172.20.0.1 --port $S7

# sudo tcset $ONOS1 --direction incoming --delay 88ms --network 172.20.0.1 --port $S8
# sudo tcset $ONOS2 --direction incoming --delay 77ms --network 172.20.0.1 --port $S8
# sudo tcset $ONOS3 --direction incoming --delay 20ms --network 172.20.0.1 --port $S8
# sudo tcset $ONOS4 --direction incoming --delay 30ms --network 172.20.0.1 --port $S8






# sudo tcset $ONOS1 --direction incoming --delay 20ms --network 172.20.0.1 --port $S1
# sudo tcset $ONOS2 --direction incoming --delay 30ms --network 172.20.0.1 --port $S1
# sudo tcset $ONOS3 --direction incoming --delay 99ms --network 172.20.0.1 --port $S1
# sudo tcset $ONOS4 --direction incoming --delay 55ms --network 172.20.0.1 --port $S1

# sudo tcset $ONOS1 --direction incoming --delay 99ms --network 172.20.0.1 --port $S2
# sudo tcset $ONOS2 --direction incoming --delay 55ms --network 172.20.0.1 --port $S2
# sudo tcset $ONOS3 --direction incoming --delay 11ms --network 172.20.0.1 --port $S2
# sudo tcset $ONOS4 --direction incoming --delay 44ms --network 172.20.0.1 --port $S2

# sudo tcset $ONOS1 --direction incoming --delay 11ms --network 172.20.0.1 --port $S3
# sudo tcset $ONOS2 --direction incoming --delay 44ms --network 172.20.0.1 --port $S3
# sudo tcset $ONOS3 --direction incoming --delay 88ms --network 172.20.0.1 --port $S3
# sudo tcset $ONOS4 --direction incoming --delay 77ms --network 172.20.0.1 --port $S3

# sudo tcset $ONOS1 --direction incoming --delay 88ms --network 172.20.0.1 --port $S4
# sudo tcset $ONOS2 --direction incoming --delay 77ms --network 172.20.0.1 --port $S4
# sudo tcset $ONOS3 --direction incoming --delay 20ms --network 172.20.0.1 --port $S4
# sudo tcset $ONOS4 --direction incoming --delay 30ms --network 172.20.0.1 --port $S4

# sudo tcset $ONOS1 --direction incoming --delay 20ms --network 172.20.0.1 --port $S5
# sudo tcset $ONOS2 --direction incoming --delay 30ms --network 172.20.0.1 --port $S5
# sudo tcset $ONOS3 --direction incoming --delay 99ms --network 172.20.0.1 --port $S5
# sudo tcset $ONOS4 --direction incoming --delay 55ms --network 172.20.0.1 --port $S5

# sudo tcset $ONOS1 --direction incoming --delay 99ms --network 172.20.0.1 --port $S6
# sudo tcset $ONOS2 --direction incoming --delay 55ms --network 172.20.0.1 --port $S6
# sudo tcset $ONOS3 --direction incoming --delay 11ms --network 172.20.0.1 --port $S6
# sudo tcset $ONOS4 --direction incoming --delay 44ms --network 172.20.0.1 --port $S6

# sudo tcset $ONOS1 --direction incoming --delay 11ms --network 172.20.0.1 --port $S7
# sudo tcset $ONOS2 --direction incoming --delay 44ms --network 172.20.0.1 --port $S7
# sudo tcset $ONOS3 --direction incoming --delay 88ms --network 172.20.0.1 --port $S7
# sudo tcset $ONOS4 --direction incoming --delay 77ms --network 172.20.0.1 --port $S7

# sudo tcset $ONOS1 --direction incoming --delay 88ms --network 172.20.0.1 --port $S8
# sudo tcset $ONOS2 --direction incoming --delay 77ms --network 172.20.0.1 --port $S8
# sudo tcset $ONOS3 --direction incoming --delay 20ms --network 172.20.0.1 --port $S8
# sudo tcset $ONOS4 --direction incoming --delay 30ms --network 172.20.0.1 --port $S8

# sudo tcset $ONOS1 --direction incoming --delay 20ms --network 172.20.0.1 --port $S9
# sudo tcset $ONOS2 --direction incoming --delay 30ms --network 172.20.0.1 --port $S9
# sudo tcset $ONOS3 --direction incoming --delay 99ms --network 172.20.0.1 --port $S9
# sudo tcset $ONOS4 --direction incoming --delay 55ms --network 172.20.0.1 --port $S9

# sudo tcset $ONOS1 --direction incoming --delay 99ms --network 172.20.0.1 --port $S10
# sudo tcset $ONOS2 --direction incoming --delay 55ms --network 172.20.0.1 --port $S10
# sudo tcset $ONOS3 --direction incoming --delay 11ms --network 172.20.0.1 --port $S10
# sudo tcset $ONOS4 --direction incoming --delay 44ms --network 172.20.0.1 --port $S10

# sudo tcset $ONOS1 --direction incoming --delay 11ms --network 172.20.0.1 --port $S11
# sudo tcset $ONOS2 --direction incoming --delay 44ms --network 172.20.0.1 --port $S11
# sudo tcset $ONOS3 --direction incoming --delay 88ms --network 172.20.0.1 --port $S11
# sudo tcset $ONOS4 --direction incoming --delay 77ms --network 172.20.0.1 --port $S11

# sudo tcset $ONOS1 --direction incoming --delay 88ms --network 172.20.0.1 --port $S12
# sudo tcset $ONOS2 --direction incoming --delay 77ms --network 172.20.0.1 --port $S12
# sudo tcset $ONOS3 --direction incoming --delay 20ms --network 172.20.0.1 --port $S12
# sudo tcset $ONOS4 --direction incoming --delay 30ms --network 172.20.0.1 --port $S12

# sudo tcset $ONOS1 --direction incoming --delay 20ms --network 172.20.0.1 --port $S13
# sudo tcset $ONOS2 --direction incoming --delay 30ms --network 172.20.0.1 --port $S13
# sudo tcset $ONOS3 --direction incoming --delay 99ms --network 172.20.0.1 --port $S13
# sudo tcset $ONOS4 --direction incoming --delay 55ms --network 172.20.0.1 --port $S13

# sudo tcset $ONOS1 --direction incoming --delay 99ms --network 172.20.0.1 --port $S14
# sudo tcset $ONOS2 --direction incoming --delay 55ms --network 172.20.0.1 --port $S14
# sudo tcset $ONOS3 --direction incoming --delay 11ms --network 172.20.0.1 --port $S14
# sudo tcset $ONOS4 --direction incoming --delay 44ms --network 172.20.0.1 --port $S14

# sudo tcset $ONOS1 --direction incoming --delay 11ms --network 172.20.0.1 --port $S15
# sudo tcset $ONOS2 --direction incoming --delay 44ms --network 172.20.0.1 --port $S15
# sudo tcset $ONOS3 --direction incoming --delay 88ms --network 172.20.0.1 --port $S15
# sudo tcset $ONOS4 --direction incoming --delay 77ms --network 172.20.0.1 --port $S15

# sudo tcset $ONOS1 --direction incoming --delay 88ms --network 172.20.0.1 --port $S16
# sudo tcset $ONOS2 --direction incoming --delay 77ms --network 172.20.0.1 --port $S16
# sudo tcset $ONOS3 --direction incoming --delay 20ms --network 172.20.0.1 --port $S16
# sudo tcset $ONOS4 --direction incoming --delay 30ms --network 172.20.0.1 --port $S16