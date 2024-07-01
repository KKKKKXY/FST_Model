# !/bin/bash


# # # Create ONOS controller into another WORKER host in MANAGER side
# ONOS_Postfix=2
# ONOS_Host=03
# echo "Creating onos$ONOS_Postfix"
# # sudo docker service create --name onos$ONOS_Postfix --hostname onos$ONOS_Host --network onos-cluster-net --env ONOS_APPS="drivers,openflow-base,netcfghostprovider,lldpprovider,gui2" --mode global --publish mode=host,published=8080,target=80 xingyuankang/onos_cluster:v4
# sudo docker service create --name onos$ONOS_Postfix --hostname onos$ONOS_Host --network onos-cluster-net --env ONOS_APPS="drivers,openflow-base,netcfghostprovider,lldpprovider,gui2" --publish published=8080,target=80 xingyuankang/onos_cluster:v4
# # sudo docker run -itd --name onos$ONOS_Postfix --hostname onos$ONOS_Postfix --network onos-cluster-net --volume ~/Config:/root/onos/config -e ONOS_APPS="drivers,openflow-base,netcfghostprovider,lldpprovider,gui2" --publish mode=host,published=8080,target=80 xingyuankang/onos_cluster:v4

# sudo docker service create --name onos$ONOS_Postfix --hostname onos$ONOS_Host --network onos-cluster-net --mount source=config,target=/root/onos/config -e ONOS_APPS="drivers,openflow-base,netcfghostprovider,lldpprovider,gui2" --publish mode=host,published=8080,target=80 xingyuankang/onos_cluster:v4
# sudo docker service inspect onos$ONOS_Postfix | grep -i Addr
# ./onos/tools/test/bin/onos-gen-config onos$ONOS_Postfix /tmp/cluster-$ONOS_Postfix.json -n atomix-1
# sudo docker exec $(sudo docker ps -q -f name=onos$ONOS_Postfix) mkdir /root/onos/config
# sudo docker cp /tmp/cluster-$ONOS_Postfix.json onos$ONOS_Postfix:/root/onos/config/cluster.json
# cp /tmp/cluster-$ONOS_Postfix.json Config/cluster.json
# cp /tmp/cluster-$ONOS_Postfix.json config:cluster.json
# sudo docker cp /tmp/cluster-$ONOS_Postfix.json onos2:cluster.json
# sudo docker service restart onos$ONOS_Postfix




sudo docker swarm leave --force
# sudo docker network rm docker_gwbridge
# sudo docker network create \
#     --subnet 10.11.0.0/16 \
#     --opt com.docker.network.bridge.name=docker_gwbridge \
#     --opt com.docker.network.bridge.enable_icc=false \
#     --opt com.docker.network.bridge.enable_ip_masquerade=true \
#     docker_gwbridge
sudo docker swarm init



sudo docker stop $(sudo docker ps -a -q)
sudo docker rm $(sudo docker ps -a -q)
# sudo docker stop onos1
# sudo docker rm onos1
sudo docker network rm onos-cluster-net
sudo docker network create --driver=overlay --attachable onos-cluster-net --subnet 172.20.0.0/16 --gateway 172.20.0.1 --label "creator=onos-cluster-create"

# ATOMIX
# sudo docker pull atomix/atomix:3.1.5
# sudo docker inspect onos-cluster-net | jq -c '.[0].IPAM.Config[0].Subnet' | tr -d '"'
# echo ''
# sudo docker inspect onos-cluster-net | jq -c '.[0].IPAM.Config[0].Gateway' | tr -d '"'
# echo ''
# sudo docker inspect onos-cluster-net | jq -c '.[0].Containers[] | .IPv4Address'

# ATOMIX
# # ATOMIX
# sudo docker create -t --name atomix-1 --hostname atomix-1 --net onos-cluster-net atomix/atomix:3.1.5
# # sudo docker inspect atomix-1 | grep -i ipaddress
# ./onos/tools/test/bin/atomix-gen-config atomix-1 /tmp/atomix-1.conf atomix-1
# sudo docker cp /tmp/atomix-1.conf atomix-1:/opt/atomix/conf/atomix.conf
# sudo docker container start atomix-1
# sudo docker inspect atomix-1 | grep -i ipaddress

# ATOMIX1
# sudo docker create -t --name atomix-1 --hostname atomix-1 --net onos-cluster-net -e STATIC_IP=172.20.0.9 atomix/atomix:3.1.5
sudo docker create -t --name atomix-1 --hostname atomix-1 --net onos-cluster-net atomix/atomix:3.1.5
./onos/tools/test/bin/atomix-gen-config atomix-1 /tmp/atomix-1.conf atomix-1 atomix-2 atomix-3
sudo docker cp /tmp/atomix-1.conf atomix-1:/opt/atomix/conf/atomix.conf
sudo docker container start atomix-1
sudo docker inspect atomix-1 | grep -i ipaddress
# ATOMIX2
sudo docker create -t --name atomix-2 --hostname atomix-2 --net onos-cluster-net atomix/atomix:3.1.5
./onos/tools/test/bin/atomix-gen-config atomix-2 /tmp/atomix-2.conf atomix-1 atomix-2 atomix-3
sudo docker cp /tmp/atomix-2.conf atomix-2:/opt/atomix/conf/atomix.conf
sudo docker container start atomix-2
sudo docker inspect atomix-2 | grep -i ipaddress
# ATOMIX3
sudo docker create -t --name atomix-3 --hostname atomix-3 --net onos-cluster-net atomix/atomix:3.1.5
./onos/tools/test/bin/atomix-gen-config atomix-3 /tmp/atomix-3.conf atomix-1 atomix-2 atomix-3
sudo docker cp /tmp/atomix-3.conf atomix-3:/opt/atomix/conf/atomix.conf
sudo docker container start atomix-3
sudo docker inspect atomix-3 | grep -i ipaddress


# OC1=$(sudo docker inspect atomix-1 | grep -i ipaddress)
# echo "$OC1"


# ONOS
./onos/tools/test/bin/onos-gen-config onos1 /tmp/cluster-1.json -n atomix-1 atomix-2 atomix-3
sudo docker run -t -d --name onos1 --hostname onos1 --net onos-cluster-net -e ONOS_APPS="drivers,openflow-base,netcfghostprovider,lldpprovider,gui2" --publish published=16653,target=6653 -v /tmp/cluster-1.json:/root/onos/config/cluster.json xingyuankang/onos_cluster:v4
# sudo docker run -t -d --name onos1 --hostname onos1 --net onos-cluster-net -e ONOS_APPS="drivers,openflow-base,netcfghostprovider,lldpprovider,gui2" -e STATIC_IP=172.20.0.3 onosproject/onos:2.7.0
# sudo docker run -t -d --name onos1 --net=onos-cluster-net -e $DISPLAY -v /tmp/.X11-unix onosproject/onos:2.7.0
sudo docker inspect onos1 | grep -i ipaddress
# sudo docker exec onos1 mkdir /root/onos/config
# sudo docker cp /tmp/cluster-1.json onos1:/root/onos/config/cluster.json
# sudo docker restart onos1