FROM  alpine:3.15.0

ARG VERSION=0.39.1

WORKDIR /home

RUN wget https://github.com/fatedier/frp/releases/download/v0.39.1/frp_0.39.1_linux_amd64.tar.gz

RUN tar -xvzf frp_0.39.1_linux_amd64.tar.gz
RUN mkdir frp
RUN mv frp_0.39.1_linux_amd64/* frp/
RUN rm frp_0.39.1_linux_amd64.tar.gz 
WORKDIR /home/frp
COPY frpc.ini ./home/frp

RUN pwd
RUN cat frpc.ini

# EXPOSE 80
ENTRYPOINT [ "/frp/frpc", "-c", "/frp/frpc.ini"  ]