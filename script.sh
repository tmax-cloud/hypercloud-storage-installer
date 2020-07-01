#!/bin/bash
if  [ "$#" -ne 1 ]; then
    echo "usage : $0 {registry endpoint}"
    echo "example : $0 192.168.50.207:5000"
    exit 0
fi

registry_endpoint=$1

sed -i 's/{registry_endpoint}/'$registry_endpoint'/g' cdi/*.yaml
sed -i 's/{registry_endpoint}/'$registry_endpoint'/g' rook/*.yaml

