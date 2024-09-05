# !/bin/bash

ovs-ofctl -O OpenFlow13 del-flows s1
ovs-ofctl -O OpenFlow13 del-flows s2
ovs-ofctl -O OpenFlow12 del-flows s3
ovs-ofctl -O OpenFlow12 del-flows s4
ip -s -s neigh flush all
#ip -s -s neigh flush all
#ip -s -s neigh flush all

# delete all TC configurations
ONOS1=
ONOS2=
ONOS3=
ONOS4=
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
Atomix1=
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
# sudo tcdel $ONOS5 --all
# sudo tcdel $ONOS6 --all
# sudo tcdel $ONOS7 --all
# sudo tcdel $ONOS8 --all
# sudo tcdel $ONOS9 --all
# sudo tcdel $ONOS10 --all
# sudo tcdel $ONOS11 --all
# sudo tcdel $ONOS12 --all
# sudo tcdel $ONOS13 --all
# sudo tcdel $ONOS14 --all
# sudo tcdel $ONOS15 --all
# sudo tcdel $ONOS16 --all
sudo tcdel $Atomix1 --all
# sudo tcdel $Atomix2 --all
# sudo tcdel $Atomix3 --all
# sudo tcdel $Atomix4 --all
# sudo tcdel $Atomix5 --all
# sudo tcdel $Atomix6 --all
# sudo tcdel $Atomix7 --all
# sudo tcdel $Atomix8 --all
# sudo tcdel $Atomix9 --all

# Clean VM enviroment for re-starting an ONOS/Atomix architecture
sudo docker ps -a
sudo docker stop $(sudo docker ps -a -q)
sudo docker rm $(sudo docker ps -a -q)
sudo docker network ls
sudo docker network rm onos-cluster-net
sudo rm tmp/cluster-*.json
sudo rm tmp/atomix-*.conf
# sudo cd /tmp
# sudo rm cluster-*.json
# sudo rm atomix-*.conf