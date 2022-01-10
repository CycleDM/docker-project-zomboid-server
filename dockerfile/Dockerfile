FROM steamcmd/steamcmd:ubuntu as builder

ARG DEFAULT_LANGUAGE=CN

RUN apt install -y screen wget && \
    mkdir /data && \
    wget "https://raw.githubusercontent.com/CycleDM/docker-project-zomboid-server/main/scripts/init.sh" && \\
    steamcmd +force_install_dir /data/Runtime +login anonymous +app_update 380870 +quit && \
    cd /data/Runtime && \
    screen -dmS server sh start-server.sh && \
    screen -S server -X stuff "quit\015" && \



FROM ubuntu:latest
ENV LANG=C.UTF-8

COPY --from=builder /data /app/

ENTRYPOINT ["sh","start-server.sh"]