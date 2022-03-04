FROM  alpine:3.15.0

ARG VERSION=0.39.1

WORKDIR /

RUN apk --no-cache add curl && \
    apk --no-cache add tar && \
    curl https://github.com/fatedier/frp/releases/download/v${VERSION}/frp_${VERSION}_linux_amd64.tar.gz && \
    tar -xvzf frp_${VERSION}_darwin_amd64.tar.gz && \
    mkdir frp && \
    mv frp_${VERSION}_darwin_amd64 frp && \
    rm frp_${VERSION}_darwin_amd64.tar.gz

WORKDIR /frp

COPY frpc.ini .


# mkdir config log && \
#    mv *.ini config && \
#    ln -s config/frps.ini ./frps.ini && \
#    ln -s config/frpc.ini ./frpc.ini

# VOLUME /frp/config /frp/log

# EXPOSE 80

ENTRYPOINT [ "/frp/frpc", "-c", "/frp/frpc.ini"  ]
