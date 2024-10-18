# !/bin/bash

# sudo ovs-ofctl -O OpenFlow13 del-flows s1
# sudo ovs-ofctl -O OpenFlow13 del-flows s2
# sudo ovs-ofctl -O OpenFlow12 del-flows s3
# sudo ovs-ofctl -O OpenFlow12 del-flows s4
# sudo ovs-ofctl -O OpenFlow13 del-flows s5
# sudo ovs-ofctl -O OpenFlow13 del-flows s6
# sudo ovs-ofctl -O OpenFlow12 del-flows s7
# sudo ovs-ofctl -O OpenFlow12 del-flows s8
sudo ip -s -s neigh flush all

# delete all TC configurations
ONOS1=veth709aa8f
ONOS2=vethf2ab0eb
ONOS3=veth337d521
ONOS4=veth2813c4f
ONOS5=veth88d5b26
ONOS6=vethc6295b8
ONOS7=veth9f1b0e8
ONOS8=veth04e031a
# ONOS9=
# ONOS10=
# ONOS11=
# ONOS12=
# ONOS13=
# ONOS14=
# ONOS15=
# ONOS16=
# Atomix1=
# Atomix2=
# Atomix3=
# Atomix4=
# Atomix5=
# Atomix6=
# Atomix7=
# Atomix8=
# Atomix9=
sudo tcdel $ONOS1 --all
sudo tcdel $ONOS2 --all
sudo tcdel $ONOS3 --all
sudo tcdel $ONOS4 --all
sudo tcdel $ONOS5 --all
sudo tcdel $ONOS6 --all
sudo tcdel $ONOS7 --all
sudo tcdel $ONOS8 --all
# sudo tcdel $ONOS9 --all
# sudo tcdel $ONOS10 --all
# sudo tcdel $ONOS11 --all
# sudo tcdel $ONOS12 --all
# sudo tcdel $ONOS13 --all
# sudo tcdel $ONOS14 --all
# sudo tcdel $ONOS15 --all
# sudo tcdel $ONOS16 --all
# sudo tcdel $Atomix1 --all
# sudo tcdel $Atomix2 --all
# sudo tcdel $Atomix3 --all
# sudo tcdel $Atomix4 --all
# sudo tcdel $Atomix5 --all
# sudo tcdel $Atomix6 --all
# sudo tcdel $Atomix7 --all
# sudo tcdel $Atomix8 --all
# sudo tcdel $Atomix9 --all

# sudo ifconfig $ONOS1 down
# sudo ifconfig $ONOS2 down
# sudo ifconfig $ONOS3 down
# sudo ifconfig $ONOS4 down
# sudo ifconfig $ONOS5 down
# sudo ifconfig $ONOS6 down
# sudo ifconfig $ONOS7 down
# sudo ifconfig $ONOS8 down
# sudo ifconfig $ONOS9 down
# sudo ifconfig $ONOS10 down
# sudo ifconfig $ONOS11 down
# sudo ifconfig $ONOS12 down
# sudo ifconfig $ONOS13 down
# sudo ifconfig $ONOS14 down
# sudo ifconfig $ONOS15 down
# sudo ifconfig $ONOS16 down
# sudo ifconfig $Atomix1 down
# sudo ifconfig $Atomix2 down
# sudo ifconfig $Atomix3 down

# sudo ifconfig $ONOS1 up
# sudo ifconfig $ONOS2 up
# sudo ifconfig $ONOS3 up
# sudo ifconfig $ONOS4 up
# sudo ifconfig $ONOS5 up
# sudo ifconfig $ONOS6 up
# sudo ifconfig $ONOS7 up
# sudo ifconfig $ONOS8 up
# sudo ifconfig $ONOS9 up
# sudo ifconfig $ONOS10 up
# sudo ifconfig $ONOS11 up
# sudo ifconfig $ONOS12 up
# sudo ifconfig $ONOS13 up
# sudo ifconfig $ONOS14 up
# sudo ifconfig $ONOS15 up
# sudo ifconfig $ONOS16 up
# sudo ifconfig $Atomix1 up
# sudo ifconfig $Atomix2 up
# sudo ifconfig $Atomix3 up
#sudo ip neigh flush 172.20.0.2
#sudo ip neigh flush 172.20.0.3
#sudo ip neigh flush 172.20.0.4
#sudo ip neigh flush 172.20.0.5
#sudo ip neigh flush 172.20.0.6


# # Clean VM enviroment for re-starting an ONOS/Atomix architecture
# sudo docker ps -a
# sudo docker stop $(sudo docker ps -a -q)
# sudo docker rm $(sudo docker ps -a -q)
# sudo docker network ls
# sudo docker network rm onos-cluster-net
# sudo rm tmp/cluster-*.json
# sudo rm tmp/atomix-*.conf
# # sudo cd /tmp
# # sudo rm cluster-*.json
# # sudo rm atomix-*.conf