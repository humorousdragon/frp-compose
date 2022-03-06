FROM  alpine:3.15.0

ARG VERSION=0.39.1

RUN  ls

#     mkdir home 

WORKDIR home

RUN tar --version
RUN apk --no-cache add curl
RUN wget https://github.com/fatedier/frp/releases/download/v0.39.1/frp_0.39.1_linux_amd64.tar.gz
# RUN pwd
RUN apk add --upgrade --no-cache tar
RUN ls
#    apk --no-cache add tar && \
RUN tar -xvzf frp_0.39.1_linux_amd64.tar.gz
RUN mkdir frp
RUN mv frp_0.39.1_linux_amd64/* frp/
RUN rm frp_0.39.1_linux_amd64.tar.gz 

#    mv frp_${VERSION}_darwin_amd64 frp && \
#    rm frp_${VERSION}_darwin_amd64.tar.gz

WORKDIR /frp

COPY frpc.ini .


# mkdir config log && \
#    mv *.ini config && \
#    ln -s config/frps.ini ./frps.ini && \
#    ln -s config/frpc.ini ./frpc.ini

# VOLUME /frp/config /frp/log
# EXPOSE 80
ENTRYPOINT [ "/frp/frpc", "-c", "/frp/frpc.ini"  ]