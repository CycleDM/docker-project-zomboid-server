FROM ubuntu:latest

ARG MAX_RAM=4G

ENV LANG=C.UTF-8

COPY ./temp /data/Server/
RUN sed -i 's/-Xmx8g/-Xmx$MAX_RAM/g' /data/Server/ProjectZomboid64.json && \
    mkdir /data/Zomboid && \
    ln -s /data/Zomboid /root/Zomboid

WORKDIR /data/Server

ENTRYPOINT ["sh","start-server.sh"]