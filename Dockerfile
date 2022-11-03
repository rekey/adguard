FROM  adguard/adguardhome
LABEL maintainer="Rekey <rekey@me.com>"

WORKDIR /opt/
add ./src/* /opt/
RUN sed -i "s@dl-cdn.alpinelinux.org/@repo.huaweicloud.com/@g" /etc/apk/repositories && \
    apk update && \
    apk add ca-certificates libcap tzdata && \
    chmod +x /opt/run.sh

CMD ["./run.sh"]
