Atomix1=veth18818f9
Atomix2=vetha207f10
Atomix3=vethbe8471a
Atomix4=vethcd6d733
Atomix5=vethfb22abe
Atomix6=veth05b2197
Atomix7=vethfb0390d
Atomix8=veth18c7586
Atomix9=vethfebbce4

Atomix1_ip=172.20.0.2
Atomix2_ip=172.20.0.3
Atomix3_ip=172.20.0.4
Atomix4_ip=172.20.0.5
Atomix5_ip=172.20.0.6
Atomix6_ip=172.20.0.7
Atomix7_ip=172.20.0.8
Atomix8_ip=172.20.0.9
Atomix9_ip=172.20.0.10

# a1	0	33	11	11	22	88	77	33	99
# sudo tcset $Atomix1 --direction incoming --delay 0ms --network $Atomix1_ip
sudo tcset $Atomix1 --direction incoming --delay 33ms --network $Atomix2_ip
sudo tcset $Atomix1 --direction incoming --delay 11ms --network $Atomix3_ip
sudo tcset $Atomix1 --direction incoming --delay 11ms --network $Atomix4_ip
sudo tcset $Atomix1 --direction incoming --delay 22ms --network $Atomix5_ip
sudo tcset $Atomix1 --direction incoming --delay 88ms --network $Atomix6_ip
sudo tcset $Atomix1 --direction incoming --delay 77ms --network $Atomix7_ip
sudo tcset $Atomix1 --direction incoming --delay 33ms --network $Atomix8_ip
sudo tcset $Atomix1 --direction incoming --delay 99ms --network $Atomix9_ip

# a2	33	0	88	22	88	77	22	99	11
# sudo tcset $Atomix2 --direction incoming --delay 33ms --network $Atomix1_ip
# sudo tcset $Atomix2 --direction incoming --delay 0ms --network $Atomix2_ip
sudo tcset $Atomix2 --direction incoming --delay 88ms --network $Atomix3_ip
sudo tcset $Atomix2 --direction incoming --delay 22ms --network $Atomix4_ip
sudo tcset $Atomix2 --direction incoming --delay 88ms --network $Atomix5_ip
sudo tcset $Atomix2 --direction incoming --delay 77ms --network $Atomix6_ip
sudo tcset $Atomix2 --direction incoming --delay 22ms --network $Atomix7_ip
sudo tcset $Atomix2 --direction incoming --delay 99ms --network $Atomix8_ip
sudo tcset $Atomix2 --direction incoming --delay 11ms --network $Atomix9_ip

# a3	11	88	0	88	77	33	99	11	22
# sudo tcset $Atomix3 --direction incoming --delay 11ms --network $Atomix1_ip
# sudo tcset $Atomix3 --direction incoming --delay 88ms --network $Atomix2_ip
# sudo tcset $Atomix3 --direction incoming --delay 0ms --network $Atomix3_ip
sudo tcset $Atomix3 --direction incoming --delay 88ms --network $Atomix4_ip
sudo tcset $Atomix3 --direction incoming --delay 77ms --network $Atomix5_ip
sudo tcset $Atomix3 --direction incoming --delay 33ms --network $Atomix6_ip
sudo tcset $Atomix3 --direction incoming --delay 99ms --network $Atomix7_ip
sudo tcset $Atomix3 --direction incoming --delay 11ms --network $Atomix8_ip
sudo tcset $Atomix3 --direction incoming --delay 22ms --network $Atomix9_ip

# # a4	11	22	88	0	33	99	11	22	77
# sudo tcset $Atomix4 --direction incoming --delay 11ms --network $Atomix1_ip
# sudo tcset $Atomix4 --direction incoming --delay 22ms --network $Atomix2_ip
# sudo tcset $Atomix4 --direction incoming --delay 88ms --network $Atomix3_ip
# # sudo tcset $Atomix4 --direction incoming --delay 0ms --network $Atomix4_ip
sudo tcset $Atomix4 --direction incoming --delay 33ms --network $Atomix5_ip
sudo tcset $Atomix4 --direction incoming --delay 99ms --network $Atomix6_ip
sudo tcset $Atomix4 --direction incoming --delay 11ms --network $Atomix7_ip
sudo tcset $Atomix4 --direction incoming --delay 22ms --network $Atomix8_ip
sudo tcset $Atomix4 --direction incoming --delay 77ms --network $Atomix9_ip

# # a5	22	88	77	33	0	11	22	77	99
# sudo tcset $Atomix5 --direction incoming --delay 22ms --network $Atomix1_ip
# sudo tcset $Atomix5 --direction incoming --delay 88ms --network $Atomix2_ip
# sudo tcset $Atomix5 --direction incoming --delay 77ms --network $Atomix3_ip
# sudo tcset $Atomix5 --direction incoming --delay 33ms --network $Atomix4_ip
# # sudo tcset $Atomix5 --direction incoming --delay 0ms --network $Atomix5_ip
sudo tcset $Atomix5 --direction incoming --delay 11ms --network $Atomix6_ip
sudo tcset $Atomix5 --direction incoming --delay 22ms --network $Atomix7_ip
sudo tcset $Atomix5 --direction incoming --delay 77ms --network $Atomix8_ip
sudo tcset $Atomix5 --direction incoming --delay 99ms --network $Atomix9_ip

# # a6	88	77	33	99	11	0	77	99	22
# sudo tcset $Atomix6 --direction incoming --delay 88ms --network $Atomix1_ip
# sudo tcset $Atomix6 --direction incoming --delay 77ms --network $Atomix2_ip
# sudo tcset $Atomix6 --direction incoming --delay 33ms --network $Atomix3_ip
# sudo tcset $Atomix6 --direction incoming --delay 99ms --network $Atomix4_ip
# sudo tcset $Atomix6 --direction incoming --delay 11ms --network $Atomix5_ip
# # sudo tcset $Atomix6 --direction incoming --delay 0ms --network $Atomix6_ip
sudo tcset $Atomix6 --direction incoming --delay 77ms --network $Atomix7_ip
sudo tcset $Atomix6 --direction incoming --delay 99ms --network $Atomix8_ip
sudo tcset $Atomix6 --direction incoming --delay 22ms --network $Atomix9_ip

# # a7	77	22	99	11	22	77	0	77	33
# sudo tcset $Atomix7 --direction incoming --delay 77ms --network $Atomix1_ip
# sudo tcset $Atomix7 --direction incoming --delay 22ms --network $Atomix2_ip
# sudo tcset $Atomix7 --direction incoming --delay 99ms --network $Atomix3_ip
# sudo tcset $Atomix7 --direction incoming --delay 11ms --network $Atomix4_ip
# sudo tcset $Atomix7 --direction incoming --delay 22ms --network $Atomix5_ip
# sudo tcset $Atomix7 --direction incoming --delay 77ms --network $Atomix6_ip
# # sudo tcset $Atomix7 --direction incoming --delay 0ms --network $Atomix7_ip
sudo tcset $Atomix7 --direction incoming --delay 77ms --network $Atomix8_ip
sudo tcset $Atomix7 --direction incoming --delay 33ms --network $Atomix9_ip

# # a8	33	99	11	22	77	99	77	0	55
# sudo tcset $Atomix8 --direction incoming --delay 33ms --network $Atomix1_ip
# sudo tcset $Atomix8 --direction incoming --delay 99ms --network $Atomix2_ip
# sudo tcset $Atomix8 --direction incoming --delay 11ms --network $Atomix3_ip
# sudo tcset $Atomix8 --direction incoming --delay 22ms --network $Atomix4_ip
# sudo tcset $Atomix8 --direction incoming --delay 77ms --network $Atomix5_ip
# sudo tcset $Atomix8 --direction incoming --delay 99ms --network $Atomix6_ip
# sudo tcset $Atomix8 --direction incoming --delay 77ms --network $Atomix7_ip
# # sudo tcset $Atomix8 --direction incoming --delay 0ms --network $Atomix8_ip
sudo tcset $Atomix8 --direction incoming --delay 55ms --network $Atomix9_ip

# # a9	99	11	22	77	99	22	33	55	0
# sudo tcset $Atomix9 --direction incoming --delay 99ms --network $Atomix1_ip
# sudo tcset $Atomix9 --direction incoming --delay 11ms --network $Atomix2_ip
# sudo tcset $Atomix9 --direction incoming --delay 22ms --network $Atomix3_ip
# sudo tcset $Atomix9 --direction incoming --delay 77ms --network $Atomix4_ip
# sudo tcset $Atomix9 --direction incoming --delay 99ms --network $Atomix5_ip
# sudo tcset $Atomix9 --direction incoming --delay 22ms --network $Atomix6_ip
# sudo tcset $Atomix9 --direction incoming --delay 33ms --network $Atomix7_ip
# sudo tcset $Atomix9 --direction incoming --delay 55ms --network $Atomix8_ip
# # sudo tcset $Atomix9 --direction incoming --delay 0ms --network $Atomix9_ip
