# !/bin/bash

# Startup a swarm (MANAGER side)
sudo docker swarm leave --force
sudo docker network rm docker_gwbridge
sudo docker network create \
    --subnet 10.11.0.0/16 \
    --opt com.docker.network.bridge.name=docker_gwbridge \
    --opt com.docker.network.bridge.enable_icc=false \
    --opt com.docker.network.bridge.enable_ip_masquerade=true \
    docker_gwbridge
sudo docker swarm init

# Create an overlay network for supporting a way workers can join the swarm
sudo docker network create --driver=overlay --attachable onos-cluster-net --subnet 172.20.0.0/16 --gateway 172.20.0.1 --label "creator=onos-cluster-create"

# Create Atomix cluster (3 Atomix nodes in this case)
# ATOMIX1
sudo docker create -t --name atomix-1 --hostname atomix-1 --net onos-cluster-net atomix/atomix:3.1.5
onos/tools/test/bin/atomix-gen-config atomix-1 tmp/atomix-1.conf atomix-1 atomix-2 atomix-3
sudo docker cp tmp/atomix-1.conf atomix-1:/opt/atomix/conf/atomix.conf
sudo docker container start atomix-1
sudo docker inspect atomix-1 | grep -i ipaddress
# ATOMIX2
sudo docker create -t --name atomix-2 --hostname atomix-2 --net onos-cluster-net atomix/atomix:3.1.5
onos/tools/test/bin/atomix-gen-config atomix-2 tmp/atomix-2.conf atomix-1 atomix-2 atomix-3
sudo docker cp tmp/atomix-2.conf atomix-2:/opt/atomix/conf/atomix.conf
sudo docker container start atomix-2
sudo docker inspect atomix-2 | grep -i ipaddress
# ATOMIX3
sudo docker create -t --name atomix-3 --hostname atomix-3 --net onos-cluster-net atomix/atomix:3.1.5
onos/tools/test/bin/atomix-gen-config atomix-3 tmp/atomix-3.conf atomix-1 atomix-2 atomix-3
sudo docker cp tmp/atomix-3.conf atomix-3:/opt/atomix/conf/atomix.conf
sudo docker container start atomix-3
sudo docker inspect atomix-3 | grep -i ipaddress

# Create an ONOS controller by using 'xingyuankang/onos_cluster:v4' custom image (ONOS version: onosproject/onos:2.7.0)
# ONOS1
onos/tools/test/bin/onos-gen-config onos1 tmp/cluster-1.json -n atomix-1 atomix-2 atomix-3
sudo docker run -t -d --name onos1 --hostname onos1 --net onos-cluster-net -e ONOS_APPS="drivers,openflow-base,netcfghostprovider,lldpprovider,gui2" --publish published=16653,target=6653 xingyuankang/onos_cluster:v4
sudo docker inspect onos1 | grep -i ipaddress
# sudo docker exec onos1 mkdir /root/onos/config
sudo docker cp tmp/cluster-1.json onos1:/root/onos/config/cluster.json
sudo docker restart onos1
# # ONOS2
# onos/tools/test/bin/onos-gen-config onos2 tmp/cluster-2.json -n atomix-1 atomix-2 atomix-3
# sudo docker run -t -d --name onos2 --hostname onos2 --net onos-cluster-net -e ONOS_APPS="drivers,openflow-base,netcfghostprovider,lldpprovider,gui2" --publish published=16654,target=6653 xingyuankang/onos_cluster:v4
# sudo docker inspect onos2 | grep -i ipaddress
# sudo docker cp tmp/cluster-2.json onos2:/root/onos/config/cluster.json
# sudo docker restart onos2