#!/bin/sh

if [ -f /opt/AdGuardHome/data/cert.pem ]; then
    if [ ! -f /usr/local/share/ca-certificates/cert.pem ]; then
        cp /opt/AdGuardHome/data/cert.pem /usr/local/share/ca-certificates/cert.pem
        update-ca-certificates
    fi
fi

cd /opt/AdGuardHome/
./AdGuardHome
