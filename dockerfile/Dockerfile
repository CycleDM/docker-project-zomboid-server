FROM steamcmd/steamcmd:ubuntu as builder

ARG DEFAULT_LANGUAGE=CN
ARG MAX_RAM=4G

RUN mkdir /data && \
    steamcmd +force_install_dir /data/Server +login anonymous +app_update 380870 +quit && \
    #rm -rf `ls | grep -v "options.ini"` && \
    #sed -i 's/language=.*/language=$DEFAULT_LANGUAGE/g' options.ini && \
    sed -i 's/-Xmx8g/-Xmx$MAX_RAM/g' /data/ServerProjectZomboid64.json && \
    ln -s /root/Zomboid /data/Zomboid

FROM ubuntu:latest
ENV LANG=C.UTF-8

COPY --from=builder /data /data/

WORKDIR /data/Server

ENTRYPOINT ["sh","start-server.sh"]