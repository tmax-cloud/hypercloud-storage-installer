#!/bin/bash
if  [ "$#" -ne 2 ]; then
    echo "usage : $0 {registry endpoint} {inventory name}"
    echo "example : $0 192.168.50.207:5000 test"
    exit 0
fi

registry_endpoint=$1
inventory_name=$2

sed -i 's/{registry_endpoint}/'$registry_endpoint'/g' $inventory_name/cdi/*.yaml
sed -i 's/{registry_endpoint}/'$registry_endpoint'/g' $inventory_name/rook/*.yaml

