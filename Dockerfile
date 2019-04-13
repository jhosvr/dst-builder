FROM ubuntu:18.04

ARG cluster_name
ENV HOME=/home/dst

RUN dpkg --add-architecture i386 \
  && apt-get update -y \
  && apt-get install -y libstdc++6:i386 libgcc1:i386 libcurl4-gnutls-dev:i386 wget \
  && useradd dst -m -s /bin/bash

USER dst
WORKDIR $HOME

RUN mkdir $HOME/steamcmd \
  && cd $HOME/steamcmd \
  && wget https://steamcdn-a.akamaihd.net/client/installer/steamcmd_linux.tar.gz \
  && tar -xvzf steamcmd_linux.tar.gz

WORKDIR $HOME/.klei/DoNotStarveTogether/$cluster_name
COPY --chown=dst:dst cluster_token.txt .
COPY --chown=dst:dst cluster.ini .
COPY --chown=dst:dst Master Master
COPY --chown=dst:dst Caves Caves

WORKDIR $HOME
COPY --chown=dst:dst rundst.sh .

EXPOSE 10999
ENTRYPOINT ./rundst.sh
