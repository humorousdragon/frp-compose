FROM  alpine:3.15.0

ARG VERSION=0.39.1

WORKDIR /home
RUN wget https://github.com/fatedier/frp/releases/download/v0.39.1/frp_0.39.1_linux_amd64.tar.gz

RUN tar -xvzf frp_0.39.1_linux_amd64.tar.gz
RUN mkdir /tmp/files
# RUN echo "Hello All" >> /tmp/files/file01
RUN mkdir frp
RUN mv frp_0.39.1_linux_amd64/* frp/
RUN rm frp_0.39.1_linux_amd64.tar.gz 
WORKDIR /home/frp
COPY frpc.ini .

# RUN pwd
# RUN cat frpc.ini

# EXPOSE 80
ENTRYPOINT [ "/home/frp/frpc", "-c", "/home/frp/frpc.ini"  ]