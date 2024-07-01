ovs-ofctl -O OpenFlow13 del-flows s1
ovs-ofctl -O OpenFlow13 del-flows s2
ovs-ofctl -O OpenFlow12 del-flows s3
ovs-ofctl -O OpenFlow12 del-flows s4
ip -s -s neigh flush all
#ip -s -s neigh flush all
#ip -s -s neigh flush all
