# !/bin/bash

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