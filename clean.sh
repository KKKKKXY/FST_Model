docker ps -a
docker stop $(sudo docker ps -a -q)
docker rm $(sudo docker ps -a -q)
docker network ls
docker network rm onos-cluster-net
rm tmp/cluster-*.json
rm tmp/atomix-*.conf
cd /tmp
rm cluster-*.json
rm atomix-*.conf
