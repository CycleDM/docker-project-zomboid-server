FROM ubuntu:latest
ENV LANG=C.UTF-8

COPY ./temp /data/Server/
RUN mkdir /data/Zomboid && ln -s /data/Zomboid /root/Zomboid

WORKDIR /data/Server

ENTRYPOINT ["sh","start-server.sh"]