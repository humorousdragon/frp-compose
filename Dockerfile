FROM  alpine:3.15.0

ARG VERSION=0.39.1

# RUN  ls

WORKDIR /home

# RUN apk --no-cache add curl
RUN wget https://github.com/fatedier/frp/releases/download/v0.39.1/frp_0.39.1_linux_amd64.tar.gz

RUN tar -xvzf frp_0.39.1_linux_amd64.tar.gz
# RUN ls -l
# RUN mkdir frp
# RUN ls -l

RUN mv ~/home/ubuntu/frp_0.39.1_linux_amd64/* frp/
# RUN ls -l frp/


RUN rm frp_0.39.1_linux_amd64.tar.gz 

WORKDIR /home/frp
RUN ls -l

COPY frpc.ini ./home/frp

RUN pwd
RUN ls -l

# EXPOSE 80
ENTRYPOINT [ "~/frp/frpc", "-c", "~/frp/frpc.ini"  ]