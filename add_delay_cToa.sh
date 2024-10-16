set -x
#   \     a1
#   c1    
#   c2    
#   c3     
#   c4      
#   c5       
#   c6     
#   c7     
#   c8    
#   c9     
#   c10   
#   c11  
#   c12  

ONOS1=veth1ccdf12
ONOS2=vethc09e780
ONOS3=veth0f5fa47
ONOS4=vethb2411c0
# ONOS5=
# ONOS6=
# ONOS7=
# ONOS8=
# ONOS9=
# ONOS10=
# ONOS11=
# ONOS12=
# ONOS13=
# ONOS14=
# ONOS15=
# ONOS16=
# Atomix1=veth4ba94f0
Atomix1_ip=172.20.0.2
# ONOS1_ip=172.20.0.3
# ONOS2_ip=172.20.0.4
# ONOS3_ip=172.20.0.5
# ONOS4_ip=172.20.0.6

# C1
sudo tcset $ONOS1 --direction incoming --delay 40ms --network $Atomix1_ip
# sudo tcset $Atomix1 --direction incoming --delay 40ms --network $ONOS1_ip
# C2
sudo tcset $ONOS2 --direction incoming --delay 70ms --network $Atomix1_ip
# sudo tcset $Atomix1 --direction incoming --delay 70ms --network $ONOS2_ip
# C3
sudo tcset $ONOS3 --direction incoming --delay 99ms --network $Atomix1_ip
# sudo tcset $Atomix1 --direction incoming --delay 99ms --network $ONOS3_ip
# C4
sudo tcset $ONOS4 --direction incoming --delay 66ms --network $Atomix1_ip
# sudo tcset $Atomix1 --direction incoming --delay 66ms --network $ONOS4_ip
# outgoing



# # # C1
# sudo tcset $ONOS1 --direction incoming --delay 40ms --network $Atomix1_ip
# # C2
# sudo tcset $ONOS2 --direction incoming --delay 70ms --network $Atomix1_ip
# # C3
# sudo tcset $ONOS3 --direction incoming --delay 99ms --network $Atomix1_ip
# # C4
# sudo tcset $ONOS4 --direction incoming --delay 66ms --network $Atomix1_ip
# # C5
# sudo tcset $ONOS5 --direction incoming --delay 50ms --network $Atomix1_ip
# # C6
# sudo tcset $ONOS6 --direction incoming --delay 22ms --network $Atomix1_ip
# # C7
# sudo tcset $ONOS7 --direction incoming --delay 57ms --network $Atomix1_ip
# # C8
# sudo tcset $ONOS8 --direction incoming --delay 15ms --network $Atomix1_ip



# # C1
# sudo tcset $ONOS1 --direction incoming --delay 40ms --network $Atomix1_ip
# # C2
# sudo tcset $ONOS2 --direction incoming --delay 70ms --network $Atomix1_ip
# # C3
# sudo tcset $ONOS3 --direction incoming --delay 99ms --network $Atomix1_ip
# # C4
# sudo tcset $ONOS4 --direction incoming --delay 66ms --network $Atomix1_ip
# # C5
# sudo tcset $ONOS5 --direction incoming --delay 50ms --network $Atomix1_ip
# # C6
# sudo tcset $ONOS6 --direction incoming --delay 22ms --network $Atomix1_ip
# # C7
# sudo tcset $ONOS7 --direction incoming --delay 57ms --network $Atomix1_ip
# # C8
# sudo tcset $ONOS8 --direction incoming --delay 15ms --network $Atomix1_ip
# # C9
# sudo tcset $ONOS9 --direction incoming --delay 40ms --network $Atomix1_ip
# # C10
# sudo tcset $ONOS10 --direction incoming --delay 70ms --network $Atomix1_ip
# # C11
# sudo tcset $ONOS11 --direction incoming --delay 99ms --network $Atomix1_ip
# # C12
# sudo tcset $ONOS12 --direction incoming --delay 66ms --network $Atomix1_ip
# # C13
# sudo tcset $ONOS13 --direction incoming --delay 50ms --network $Atomix1_ip
# # C14
# sudo tcset $ONOS14 --direction incoming --delay 22ms --network $Atomix1_ip
# # C15
# sudo tcset $ONOS15 --direction incoming --delay 57ms --network $Atomix1_ip
# # C16
# sudo tcset $ONOS16 --direction incoming --delay 15ms --network $Atomix1_ip