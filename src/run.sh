#!/bin/sh

sleep 1s

if [ -f /opt/pem/cert.pem ]; then
    if [ ! -f /usr/local/share/ca-certificates/cert.pem ]; then
        cp /opt/pem/cert.pem /usr/local/share/ca-certificates/cert.pem
        update-ca-certificates
    fi
fi

mkdir -p /opt/work
mkdir -p /opt/conf

if [ ! -f /opt/conf/AdGuardHome.yaml ]; then
    cp /opt/AdGuardHome.yaml /opt/conf/AdGuardHome.yaml
fi

cd /opt/AdGuardHome/
./AdGuardHome -w /opt/work -c /opt/conf/AdGuardHome.yaml
