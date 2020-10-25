FROM ubuntu:18.04

MAINTAINER Aaronstar, <jfeldt19@gmail.com>

RUN apt-get -y update \
    && apt-get -y upgrade \
    && apt-get -y install curl openssh-server ca-certificates git tar sqlite fontconfig iproute2 \
    && adduser -h /home/container container

USER        container
ENV         USER=container HOME=/home/container

WORKDIR     /home/container

COPY        ./entrypoint.sh /entrypoint.sh

CMD         ["/bin/bash", "/entrypoint.sh"]