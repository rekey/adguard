FROM  alpine
LABEL maintainer="Rekey <rekey@me.com>"

WORKDIR /opt/
add ./run.sh /opt/
RUN sed -i "s@dl-cdn.alpinelinux.org/@repo.huaweicloud.com/@g" /etc/apk/repositories && \
    apk update && \
    apk add curl ca-certificates && \
    cd /tmp && \
    wget https://static.adguard.com/adguardhome/release/AdGuardHome_linux_amd64.tar.gz && \
    tar -C /opt/ -zxf AdGuardHome_linux_amd64.tar.gz && \
    rm AdGuardHome_linux_amd64.tar.gz && chmod +x /opt/run.sh

CMD ["./run.sh"]
