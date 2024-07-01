#   NO.     c1a1	c1a2	c1a3	c2a1	c2a2	c2a3	a1a2	a1a3	a2a3
#   1       100     0	    0	    0	    0	    0	    44	    55	    66
#   2       100	    111	    0	    0	    0	    0	    44	    55	    66
#   3       100	    111	    166	    0	    0	    0	    44	    55	    66
#   4       100	    111	    166	    188	    0	    0	    44	    55	    66
#   5       100	    111	    166	    188	    199	    0	    44	    55	    66
#   6       100	    111	    166	    188	    199	    222	    44	    55	    66
#   7       0	    111	    166	    188	    199	    222	    44	    55	    66
#   8       0	    0	    166	    188	    199	    222	    44	    55	    66
#   9       0	    0	    0	    188	    199	    222	    44	    55	    66
#   10      0	    0	    0	    0	    199	    222	    44	    55	    66
#   11      0	    0	    0	    0	    0	    222	    44	    55	    66
#   12      0	    0	    0	    0	    0	    0	    44	    55	    66

ONOS1=vethdb7b316
ONOS2=veth34dbeef
ONOS3=veth3a5e857
ONOS4=vethd46ee61
ONOS5=veth612abbb
ONOS6=veth716a5bc
ONOS7=veth3c68c16
ONOS8=veth4fb18f0
ONOS9=veth1e0d1a7
ONOS10=vethabc8ed8
ONOS11=veth12f2bef
ONOS12=veth0a499cd
ONOS13=vethe5223b9
ONOS14=veth2376831
ONOS15=veth9847572
ONOS16=veth1f77645
Atomix1=vethc6d1461
Atomix2=vethbb417cc
Atomix3=veth6bdee69
Atomix1_ip=172.20.0.2
Atomix2_ip=172.20.0.3
Atomix3_ip=172.20.0.4
S1=
S2=
S3=
S4=
S5=
S6=
S7=
S8=
S9=
S10=
S11=
S12=
S13=
S14=
S15=
S16=

# sudo tcset $Atomix1 --direction incoming --delay 100ms --network $Atomix2_ip
# sudo tcset $Atomix1 --direction incoming --delay 44ms --network $Atomix3_ip
# sudo tcset $Atomix2 --direction incoming --delay 99ms --network $Atomix3_ip

#sudo tcset $ONOS1 --direction incoming --delay 20ms --network 172.20.0.1 --port $S1
#sudo tcset $ONOS2 --direction incoming --delay 30ms --network 172.20.0.1 --port $S1
#sudo tcset $ONOS3 --direction incoming --delay 99ms --network 172.20.0.1 --port $S1
#sudo tcset $ONOS4 --direction incoming --delay 55ms --network 172.20.0.1 --port $S1

#sudo tcset $ONOS1 --direction incoming --delay 99ms --network 172.20.0.1 --port $S2
#sudo tcset $ONOS2 --direction incoming --delay 55ms --network 172.20.0.1 --port $S2
#sudo tcset $ONOS3 --direction incoming --delay 11ms --network 172.20.0.1 --port $S2
#sudo tcset $ONOS4 --direction incoming --delay 44ms --network 172.20.0.1 --port $S2

#sudo tcset $ONOS1 --direction incoming --delay 11ms --network 172.20.0.1 --port $S3
#sudo tcset $ONOS2 --direction incoming --delay 44ms --network 172.20.0.1 --port $S3
#sudo tcset $ONOS3 --direction incoming --delay 88ms --network 172.20.0.1 --port $S3
#sudo tcset $ONOS4 --direction incoming --delay 77ms --network 172.20.0.1 --port $S3

#sudo tcset $ONOS1 --direction incoming --delay 88ms --network 172.20.0.1 --port $S4
#sudo tcset $ONOS2 --direction incoming --delay 77ms --network 172.20.0.1 --port $S4
#sudo tcset $ONOS3 --direction incoming --delay 20ms --network 172.20.0.1 --port $S4
#sudo tcset $ONOS4 --direction incoming --delay 30ms --network 172.20.0.1 --port $S4

#sudo tcset $ONOS1 --direction incoming --delay 20ms --network 172.20.0.1 --port $S5
#sudo tcset $ONOS2 --direction incoming --delay 30ms --network 172.20.0.1 --port $S5
#sudo tcset $ONOS3 --direction incoming --delay 99ms --network 172.20.0.1 --port $S5
#sudo tcset $ONOS4 --direction incoming --delay 55ms --network 172.20.0.1 --port $S5

#sudo tcset $ONOS1 --direction incoming --delay 99ms --network 172.20.0.1 --port $S6
#sudo tcset $ONOS2 --direction incoming --delay 55ms --network 172.20.0.1 --port $S6
#sudo tcset $ONOS3 --direction incoming --delay 11ms --network 172.20.0.1 --port $S6
#sudo tcset $ONOS4 --direction incoming --delay 44ms --network 172.20.0.1 --port $S6

#sudo tcset $ONOS1 --direction incoming --delay 11ms --network 172.20.0.1 --port $S7
#sudo tcset $ONOS2 --direction incoming --delay 44ms --network 172.20.0.1 --port $S7
#sudo tcset $ONOS3 --direction incoming --delay 88ms --network 172.20.0.1 --port $S7
#sudo tcset $ONOS4 --direction incoming --delay 77ms --network 172.20.0.1 --port $S7

#sudo tcset $ONOS1 --direction incoming --delay 88ms --network 172.20.0.1 --port $S8
#sudo tcset $ONOS2 --direction incoming --delay 77ms --network 172.20.0.1 --port $S8
#sudo tcset $ONOS3 --direction incoming --delay 20ms --network 172.20.0.1 --port $S8
#sudo tcset $ONOS4 --direction incoming --delay 30ms --network 172.20.0.1 --port $S8

#sudo tcset $ONOS1 --direction incoming --delay 20ms --network 172.20.0.1 --port $S9
#sudo tcset $ONOS2 --direction incoming --delay 30ms --network 172.20.0.1 --port $S9
#sudo tcset $ONOS3 --direction incoming --delay 99ms --network 172.20.0.1 --port $S9
#sudo tcset $ONOS4 --direction incoming --delay 55ms --network 172.20.0.1 --port $S9

#sudo tcset $ONOS1 --direction incoming --delay 99ms --network 172.20.0.1 --port $S10
#sudo tcset $ONOS2 --direction incoming --delay 55ms --network 172.20.0.1 --port $S10
#sudo tcset $ONOS3 --direction incoming --delay 11ms --network 172.20.0.1 --port $S10
#sudo tcset $ONOS4 --direction incoming --delay 44ms --network 172.20.0.1 --port $S10

#sudo tcset $ONOS1 --direction incoming --delay 11ms --network 172.20.0.1 --port $S11
#sudo tcset $ONOS2 --direction incoming --delay 44ms --network 172.20.0.1 --port $S11
#sudo tcset $ONOS3 --direction incoming --delay 88ms --network 172.20.0.1 --port $S11
#sudo tcset $ONOS4 --direction incoming --delay 77ms --network 172.20.0.1 --port $S11

#sudo tcset $ONOS1 --direction incoming --delay 88ms --network 172.20.0.1 --port $S12
#sudo tcset $ONOS2 --direction incoming --delay 77ms --network 172.20.0.1 --port $S12
#sudo tcset $ONOS3 --direction incoming --delay 20ms --network 172.20.0.1 --port $S12
#sudo tcset $ONOS4 --direction incoming --delay 30ms --network 172.20.0.1 --port $S12

#sudo tcset $ONOS1 --direction incoming --delay 20ms --network 172.20.0.1 --port $S13
#sudo tcset $ONOS2 --direction incoming --delay 30ms --network 172.20.0.1 --port $S13
#sudo tcset $ONOS3 --direction incoming --delay 99ms --network 172.20.0.1 --port $S13
#sudo tcset $ONOS4 --direction incoming --delay 55ms --network 172.20.0.1 --port $S13

#sudo tcset $ONOS1 --direction incoming --delay 99ms --network 172.20.0.1 --port $S14
#sudo tcset $ONOS2 --direction incoming --delay 55ms --network 172.20.0.1 --port $S14
#sudo tcset $ONOS3 --direction incoming --delay 11ms --network 172.20.0.1 --port $S14
#sudo tcset $ONOS4 --direction incoming --delay 44ms --network 172.20.0.1 --port $S14

#sudo tcset $ONOS1 --direction incoming --delay 11ms --network 172.20.0.1 --port $S15
#sudo tcset $ONOS2 --direction incoming --delay 44ms --network 172.20.0.1 --port $S15
#sudo tcset $ONOS3 --direction incoming --delay 88ms --network 172.20.0.1 --port $S15
#sudo tcset $ONOS4 --direction incoming --delay 77ms --network 172.20.0.1 --port $S15

#sudo tcset $ONOS1 --direction incoming --delay 88ms --network 172.20.0.1 --port $S16
#sudo tcset $ONOS2 --direction incoming --delay 77ms --network 172.20.0.1 --port $S16
#sudo tcset $ONOS3 --direction incoming --delay 20ms --network 172.20.0.1 --port $S16
#sudo tcset $ONOS4 --direction incoming --delay 30ms --network 172.20.0.1 --port $S16

# No.1
# C1
#sudo tcset $ONOS1 --direction incoming --delay 40ms --network $Atomix1_ip
#sudo tcset $ONOS1 --direction incoming --delay 50ms --network $Atomix2_ip
#sudo tcset $ONOS1 --direction incoming --delay 130ms --network $Atomix3_ip
# C2
#sudo tcset $ONOS2 --direction incoming --delay 70ms --network $Atomix1_ip
#sudo tcset $ONOS2 --direction incoming --delay 220ms --network $Atomix2_ip
#sudo tcset $ONOS2 --direction incoming --delay 190ms --network $Atomix3_ip
# C3
#sudo tcset $ONOS3 --direction incoming --delay 99ms --network $Atomix1_ip
# C4
#sudo tcset $ONOS4 --direction incoming --delay 66ms --network $Atomix1_ip
# C5
#sudo tcset $ONOS5 --direction incoming --delay 50ms --network $Atomix1_ip
# C6
#sudo tcset $ONOS6 --direction incoming --delay 22ms --network $Atomix1_ip
# C7
#sudo tcset $ONOS7 --direction incoming --delay 57ms --network $Atomix1_ip
# C8
#sudo tcset $ONOS8 --direction incoming --delay 15ms --network $Atomix1_ip
# C9
#sudo tcset $ONOS9 --direction incoming --delay 40ms --network $Atomix1_ip
# C10
#sudo tcset $ONOS10 --direction incoming --delay 70ms --network $Atomix1_ip
# C11
#sudo tcset $ONOS11 --direction incoming --delay 99ms --network $Atomix1_ip
# C12
#sudo tcset $ONOS12 --direction incoming --delay 66ms --network $Atomix1_ip
# C13
#sudo tcset $ONOS13 --direction incoming --delay 50ms --network $Atomix1_ip
# C14
#sudo tcset $ONOS14 --direction incoming --delay 22ms --network $Atomix1_ip
# C15
#sudo tcset $ONOS15 --direction incoming --delay 57ms --network $Atomix1_ip
# C16
#sudo tcset $ONOS16 --direction incoming --delay 15ms --network $Atomix1_ip


# Atomix
#sudo tcset $Atomix1 --direction incoming --delay 33ms --network $Atomix2_ip
#sudo tcset $Atomix1 --direction incoming --delay 11ms --network $Atomix3_ip
#sudo tcset $Atomix2 --direction incoming --delay 88ms --network $Atomix3_ip
#sudo tcset $Atomix2 --direction incoming --delay 400ms --network $Atomix3_ip
#sudo tcset $Atomix2 --direction incoming --delay 400ms --network $Atomix4_ip
#sudo tcset $Atomix3 --direction incoming --delay 400ms --network $Atomix4_ip

# # No.2
# # C1
# sudo tcset $ONOS1 --direction incoming --delay 100ms --network $Atomix1_ip
# sudo tcset $ONOS1 --direction incoming --delay 111ms --network $Atomix2_ip
# # C2
# # Atomix
#sudo tcset $Atomix1 --direction incoming --delay 44ms --network $Atomix2_ip
#sudo tcset $Atomix1 --direction incoming --delay 55ms --network $Atomix3_ip
#sudo tcset $Atomix2 --direction incoming --delay 66ms --network $Atomix3_ip

# # No.3
# # C1
# sudo tcset $ONOS1 --direction incoming --delay 100ms --network $Atomix1_ip
# sudo tcset $ONOS1 --direction incoming --delay 111ms --network $Atomix2_ip
# sudo tcset $ONOS1 --direction incoming --delay 166ms --network $Atomix3_ip
# # C2
# # Atomix
# sudo tcset $Atomix1 --direction incoming --delay 44ms --network $Atomix2_ip
# sudo tcset $Atomix1 --direction incoming --delay 55ms --network $Atomix3_ip
# sudo tcset $Atomix2 --direction incoming --delay 66ms --network $Atomix3_ip

# # No.4
# # C1
# sudo tcset $ONOS1 --direction incoming --delay 100ms --network $Atomix1_ip
# sudo tcset $ONOS1 --direction incoming --delay 111ms --network $Atomix2_ip
# sudo tcset $ONOS1 --direction incoming --delay 166ms --network $Atomix3_ip
# # C2
# sudo tcset $ONOS2 --direction incoming --delay 188ms --network $Atomix1_ip
# # Atomix
# sudo tcset $Atomix1 --direction incoming --delay 44ms --network $Atomix2_ip
# sudo tcset $Atomix1 --direction incoming --delay 55ms --network $Atomix3_ip
# sudo tcset $Atomix2 --direction incoming --delay 66ms --network $Atomix3_ip

# # No.5
# # C1
# sudo tcset $ONOS1 --direction incoming --delay 100ms --network $Atomix1_ip
# sudo tcset $ONOS1 --direction incoming --delay 111ms --network $Atomix2_ip
# sudo tcset $ONOS1 --direction incoming --delay 166ms --network $Atomix3_ip
# # C2
# sudo tcset $ONOS2 --direction incoming --delay 188ms --network $Atomix1_ip
# sudo tcset $ONOS2 --direction incoming --delay 199ms --network $Atomix2_ip
# # Atomix
# sudo tcset $Atomix1 --direction incoming --delay 44ms --network $Atomix2_ip
# sudo tcset $Atomix1 --direction incoming --delay 55ms --network $Atomix3_ip
# sudo tcset $Atomix2 --direction incoming --delay 66ms --network $Atomix3_ip

# # No.6
# # C1
# sudo tcset $ONOS1 --direction incoming --delay 100ms --network $Atomix1_ip
# sudo tcset $ONOS1 --direction incoming --delay 111ms --network $Atomix2_ip
# sudo tcset $ONOS1 --direction incoming --delay 166ms --network $Atomix3_ip
# # C2
# sudo tcset $ONOS2 --direction incoming --delay 188ms --network $Atomix1_ip
# sudo tcset $ONOS2 --direction incoming --delay 199ms --network $Atomix2_ip
# sudo tcset $ONOS2 --direction incoming --delay 222ms --network $Atomix3_ip
# # Atomix
# sudo tcset $Atomix1 --direction incoming --delay 44ms --network $Atomix2_ip
# sudo tcset $Atomix1 --direction incoming --delay 55ms --network $Atomix3_ip
# sudo tcset $Atomix2 --direction incoming --delay 66ms --network $Atomix3_ip

# # No.7
# # C1
# sudo tcset $ONOS1 --direction incoming --delay 111ms --network $Atomix2_ip
# sudo tcset $ONOS1 --direction incoming --delay 166ms --network $Atomix3_ip
# # C2
# sudo tcset $ONOS2 --direction incoming --delay 188ms --network $Atomix1_ip
# sudo tcset $ONOS2 --direction incoming --delay 199ms --network $Atomix2_ip
# sudo tcset $ONOS2 --direction incoming --delay 222ms --network $Atomix3_ip
# # Atomix
# sudo tcset $Atomix1 --direction incoming --delay 44ms --network $Atomix2_ip
# sudo tcset $Atomix1 --direction incoming --delay 55ms --network $Atomix3_ip
# sudo tcset $Atomix2 --direction incoming --delay 66ms --network $Atomix3_ip

# # No.8
# # C1
# sudo tcset $ONOS1 --direction incoming --delay 166ms --network $Atomix3_ip
# # C2
# sudo tcset $ONOS2 --direction incoming --delay 188ms --network $Atomix1_ip
# sudo tcset $ONOS2 --direction incoming --delay 199ms --network $Atomix2_ip
# sudo tcset $ONOS2 --direction incoming --delay 222ms --network $Atomix3_ip
# # Atomix
# sudo tcset $Atomix1 --direction incoming --delay 44ms --network $Atomix2_ip
# sudo tcset $Atomix1 --direction incoming --delay 55ms --network $Atomix3_ip
# sudo tcset $Atomix2 --direction incoming --delay 66ms --network $Atomix3_ip

# # No.9
# # C1
# # C2
# sudo tcset $ONOS2 --direction incoming --delay 188ms --network $Atomix1_ip
# sudo tcset $ONOS2 --direction incoming --delay 199ms --network $Atomix2_ip
# sudo tcset $ONOS2 --direction incoming --delay 222ms --network $Atomix3_ip
# # Atomix
# sudo tcset $Atomix1 --direction incoming --delay 44ms --network $Atomix2_ip
# sudo tcset $Atomix1 --direction incoming --delay 55ms --network $Atomix3_ip
# sudo tcset $Atomix2 --direction incoming --delay 66ms --network $Atomix3_ip

# # No.10
# # C1
# # C2
# sudo tcset $ONOS2 --direction incoming --delay 199ms --network $Atomix2_ip
# sudo tcset $ONOS2 --direction incoming --delay 222ms --network $Atomix3_ip
# # Atomix
# sudo tcset $Atomix1 --direction incoming --delay 44ms --network $Atomix2_ip
# sudo tcset $Atomix1 --direction incoming --delay 55ms --network $Atomix3_ip
# sudo tcset $Atomix2 --direction incoming --delay 66ms --network $Atomix3_ip

# # No.11
# # C1
# # C2
# sudo tcset $ONOS2 --direction incoming --delay 222ms --network $Atomix3_ip
# # Atomix
# sudo tcset $Atomix1 --direction incoming --delay 44ms --network $Atomix2_ip
# sudo tcset $Atomix1 --direction incoming --delay 55ms --network $Atomix3_ip
# sudo tcset $Atomix2 --direction incoming --delay 66ms --network $Atomix3_ip

# # No.12
# # C1
# # C2
# # Atomix
# sudo tcset $Atomix1 --direction incoming --delay 44ms --network $Atomix2_ip
# sudo tcset $Atomix1 --direction incoming --delay 55ms --network $Atomix3_ip
# sudo tcset $Atomix2 --direction incoming --delay 66ms --network $Atomix3_ip
