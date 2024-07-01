#!/bin/bash

netName="onos-cluster-net"

die() { echo "$1"; exit 1; }

usage() {
  cat <<EOF
    Options:
      -h, --help                  display this help message
      -ip, --atomixIpPostfix      allocated ipaddress for Atomix: e.g. 172.20.0.3
      -id, --id                   the id for Atomix: e.g 1,2,3,4...
      # -ai, --atomixIp           allocated ipaddress of Atomix: e.g. 172.20.0.2
EOF
}

parse_params() {
# Option parsing
  while [ $# -gt 0 ]; do
      case "$1" in
          --*=*)                a="${1#*=}"; o="${1#*=}"; shift; set -- "$a" "$o" "$@" ;;
          -h|--help)            usage; exit 0; shift ;;
          -ip|--atomixIpPostfix)  atomixIpPostfix="$2"; shift 2 ;;
          -id|--id)              id="$2"; shift 2 ;;
          --)                   shift; break ;;
          -*)                   usage; die "Invalid option: $1" ;;
          *)                    break ;;
      esac
  done
  echo "atomix name: atomix$id"
  allocatedAtomixIp="172.20.0.$atomixIpPostfix"
  echo "atomix ip: $allocatedAtomixIp"
}


containsElement () {
  local e match="$1"
  shift
  for e; do [[ $e == "$match" ]] && return 0; done
  return 1
}

add_new_atomix() {
    echo "Starting atomix-$id container with IP: $allocatedAtomixIp"
    
    atomixIp_1="172.20.0.2"
    atomixIp_2="172.20.0.3"
    atomixIp_3="172.20.0.4"
    allocatedAtomixIps+=($atomixIp_1)
    allocatedAtomixIps+=($atomixIp_2)
    allocatedAtomixIps+=($atomixIp_3)
    allocatedAtomixIps+=($allocatedAtomixIp)
    echo "${allocatedAtomixIps[*]}"

    sudo docker create -t \
        --name atomix-$id \
        --hostname atomix-$id \
        --net $netName \
        --ip $allocatedAtomixIp \
        -v /home/mya:/root/testAtomix \
        atomix/atomix:3.1.5 >/dev/null

    export OC$id=$allocatedAtomixIp

    cd
    ./onos/tools/test/bin/atomix-gen-config $allocatedAtomixIp /tmp/atomix-$id.conf ${allocatedAtomixIps[*]} >/dev/null
    sudo docker cp /tmp/atomix-$id.conf atomix-$id:/opt/atomix/conf/atomix.conf
    sudo docker container start atomix-$id >/dev/null
    echo "Starting container atomix-$id"
}

function main() {

    parse_params "$@"
    
    # add_new_atomix

}

# Make it rain
main "$@"
