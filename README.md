# FST Model
Flow Setup Time (FST) model for measuring the reaction time of master controller received by switch in ONOS/Atomix architecture (onos ver. 2.7.0)

## Environment Initialization
Before setting up an ONOS/Atomix architecture on one or more virtual machines (VMs) or across multiple domains, you should ensure that Docker and Mininet are installed on your VMs. You can check if Docker is installed by following these steps:
```bash
sudo systemctl status docker
```
If you got error such as: `Unit docker.service could not be found.`, that means this VM has not installed Docker, then you can install Docker by implementing the following commands:
### `1. Docker Installation`
```bash
sudo apt update
sudo apt install apt-transport-https ca-certificates curl software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
echo "deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt update
sudo apt install docker-ce
sudo systemctl enable docker
sudo systemctl start docker
sudo systemctl status docker
```
### `2. Mininet Installation`
```bash
sudo apt install mininet
git clone https://github.com/openvswitch/ovs.git
cd ovs
git checkout v2.7.0
cd ..
git clone https://github.com/mininet/mininet
mininet/util/install.sh -w
```
### `3. X11Forwarding Configuration`
Refer -> https://aws.amazon.com/blogs/compute/how-to-enable-x11-forwarding-from-red-hat-enterprise-linux-rhel-amazon-linux-suse-linux-ubuntu-server-to-support-gui-based-installations-from-amazon-ec2/
```bash
sudo cat /etc/ssh/sshd_config |grep -i X11Forwarding
sudo vi /etc/ssh/sshd_config
sudo service ssh status
sudo service ssh restart
xauth list
export DISPLAY=localhost:10.0
xterm
env|grep DISPLAY
DISPLAY=localhost:10.0
xauth list | grep unix`echo $DISPLAY | cut -c10-12` > /tmp/xauth
sudo apt install x11-apps
sudo apt install xterm
```
## Startup ONOS/Atomix architecture
### ONOS/Atomix architecture in single VM
Automatically generate an ONOS cluster within a single VM using the `create_cluster` bash script. In this script, `-o` specifies the version of the ONOS controller, `-a` specifies the version of the Atomix node, `-i` indicates the number of Atomix nodes needed, and `-j` indicates the number of ONOS controllers needed. For example, to create a cluster with 2 Atomix nodes of version 3.1.5 and 2 ONOS controllers of version 2.7.0, you would use the following command:
```bash
./create_cluster.sh -o 2.7.0 -a 3.1.5 -i 2 -j 2
```
Then you can use the following command for creating virtual network devices (switches, hosts) and connecting them to ONOS controllers:
```bash
cd Previous_data/topos/
XAUTHORITY=~/.Xauthority sudo mn --custom h1h2_2_topo.py --topo=mytopo -x
```
### ONOS/Atomix architecture acorss multiple VMs
If you want to distribute ONOS controllers across multiple VMs, you need to use `Overlay` network to connect all ONOS controllers to make an ONOS cluster. To set up the overlay network, you first need to designate one VM as the `Manager` node and initialize a swarm on this node. This will generate a token that other `Worker` nodes can use to join the swarm. Then, you can use this token on the `Worker` side to add their ONOS controllers to the ONOS cluster.
#### `1. Manager side (swarm init)`
```bash
sudo docker swarm leave --force
sudo docker swarm init
# Create an overlay network for supporting a way workers can join the swarm
sudo docker network create --driver=overlay --attachable onos-cluster-net --subnet 172.20.0.0/16 --gateway 172.20.0.1 --label "creator=onos-cluster-create"
```
Then setup Atomix cluster before create ONOS controller, in this example, use 3 Atomix nodes (To ensure the performance of ONOS/Atomix, it is crucial to understand the minimum requirements for an Atomix node) and 1 ONOS controller in Manager side. You can run `create_cluster_multi` bash script to achieve above context:
```bash
./create_cluster_multi.sh
```
#### `2. Worker side`
First, you have to let this Worker join to Manager side by overlay network (using the token you got):
```bash
sudo docker swarm join --token [TOKEN] [IP_of_Manager_side]:[Port_of_Manager_side]
```
Then you can use following command to create ONOS controlelr, these controlelrs will automatically join to ONOS cluster:
* _Define `$ONOS_NAME` be the name of this controller, let's say it is `onos2`; `$i` could be `2`; The line 2, after '-n' you should be noticed (in this case has 3 Atomix nodes with name atomix-1, atomix-2, and atomix-3, separately); `$PUB_PORT` is for receiving traffic from other node (Manager or other Workers), you can define it as you want, do not repeat with other controller's;_
```bash
# Create an ONOS controller by using 'xingyuankang/onos_cluster:v4' custom image (ONOS version: onosproject/onos:2.7.0)
mkdir tmp
onos/tools/test/bin/onos-gen-config $ONOS_NAME tmp/cluster-$i.json -n atomix-1 atomix-2 atomix-3
sudo docker run -t -d --name $ONOS_NAME --hostname $ONOS_NAME --net onos-cluster-net -e ONOS_APPS="drivers,openflow-base,netcfghostprovider,lldpprovider,gui2" --publish published=$PUB_PORT,target=6653 xingyuankang/onos_cluster:v4
sudo docker inspect $ONOS_NAME | grep -i ipaddress
sudo docker cp tmp/cluster-$i.json $ONOS_NAME:/root/onos/config/cluster.json
sudo docker restart $ONOS_NAME
```
