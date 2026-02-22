FROM ubuntu:latest


ENV DEBIAN_FRONTEND=noninteractive


RUN apt update && apt install -y \
    curl \
    net-tools \
    procps \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /.


COPY install_nginx.sh .
COPY index.html .


RUN chmod +x ./install_nginx.sh


CMD ["/bin/bash", "-c", "./install_nginx.sh"]