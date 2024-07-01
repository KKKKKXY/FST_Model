# server: u2
iperf3 -c 172.20.0.5 -p 8080 -t 10 &
# server: u1
iperf3 -c 172.20.0.6 -p 8080 -t 10 &
