#!/bin/sh

sleep 1s

if [ -f /opt/pem/cert.pem ]; then
    if [ ! -f /usr/local/share/ca-certificates/cert.pem ]; then
        cp /opt/AdGuardHome/data/cert.pem /usr/local/share/ca-certificates/cert.pem
        update-ca-certificates
    fi
fi

cd /opt/AdGuardHome/
./AdGuardHome -w /opt/adguardhome/work -c /opt/adguardhome/conf/AdGuardHome.yaml
