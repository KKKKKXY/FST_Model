sudo docker run -dit --name atomix-1 --hostname atomix-1 --net onos-cluster-net --ip 172.20.0.2 atomix/atomix:3.1.5
sudo docker run -dit --name atomix-2 --hostname atomix-2 --net onos-cluster-net --ip 172.20.0.3 atomix/atomix:3.1.5
sudo docker run -dit --name atomix-3 --hostname atomix-3 --net onos-cluster-net --ip 172.20.0.4 atomix/atomix:3.1.5
export OC1=172.20.0.2
export OC2=172.20.0.3
export OC3=172.20.0.4

# ./onos/tools/test/bin/atomix-gen-config 172.20.0.2 /tmp/atomix-1.conf "172.20.0.2","172.20.0.3","172.20.0.4" >/dev/null
cd
./onos/tools/test/bin/atomix-gen-config 172.20.0.2 /tmp/atomix-1.conf 172.20.0.2 172.20.0.3 172.20.0.4
./onos/tools/test/bin/atomix-gen-config 172.20.0.3 /tmp/atomix-2.conf 172.20.0.2 172.20.0.3 172.20.0.4
./onos/tools/test/bin/atomix-gen-config 172.20.0.4 /tmp/atomix-3.conf 172.20.0.2 172.20.0.3 172.20.0.4

sudo docker cp /tmp/atomix-1.conf atomix-1:/opt/atomix/conf/atomix.conf
sudo docker cp /tmp/atomix-2.conf atomix-2:/opt/atomix/conf/atomix.conf
sudo docker cp /tmp/atomix-3.conf atomix-3:/opt/atomix/conf/atomix.conf

# sudo docker container start atomix-1 >/dev/null
sudo docker container start atomix-1
sudo docker container start atomix-2
sudo docker container start atomix-3

# sudo docker run -dit --name onos1 --hostname onos1 --net onos-cluster-net --ip 172.20.0.5 -e ONOS_APPS="drivers,openflow-base,netcfghostprovider,lldpprovider,gui2" onosproject/onos:2.2.2
sudo docker run -dit --name onos1 --hostname onos1 --net onos-cluster-net --ip 172.20.0.5 -e ONOS_APPS="drivers,openflow-base,netcfghostprovider,lldpprovider,gui2" onosproject/onos:2.2.2
sudo docker run -dit --name onos2 --hostname onos2 --net onos-cluster-net --ip 172.20.0.6 -e ONOS_APPS="drivers,openflow-base,netcfghostprovider,lldpprovider,gui2" onosproject/onos:2.2.2
# sudo docker run -dit --name onos3 --hostname onos3 --net onos-cluster-net --ip 172.20.0.7 -e ONOS_APPS="drivers,openflow-base,netcfghostprovider,lldpprovider,gui2" onosproject/onos:2.2.2

sudo docker inspect onos1 | grep -i ipaddress
sudo docker inspect onos2 | grep -i ipaddress
# sudo docker inspect onos3 | grep -i ipaddress

cd
./onos/tools/test/bin/onos-gen-config 172.20.0.5 ~/cluster-1.json -n 172.20.0.2 172.20.0.3 172.20.0.4
./onos/tools/test/bin/onos-gen-config 172.20.0.6 ~/cluster-2.json -n 172.20.0.2 172.20.0.3 172.20.0.4
# ./onos/tools/test/bin/onos-gen-config 172.20.0.7 ~/cluster-3.json -n 172.20.0.2 172.20.0.3 172.20.0.4

sudo docker restart onos1
sudo docker restart onos2
# sudo docker restart onos3
