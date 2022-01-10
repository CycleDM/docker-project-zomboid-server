FROM steamcmd/steamcmd:ubuntu as builder

ARG DEFAULT_LANGUAGE=CN
ARG MAX_RAM=4G

RUN apt update && \
    apt install -y wget screen && \
    mkdir /data && \
    cd /data && \
    wget "https://raw.githubusercontent.com/CycleDM/docker-project-zomboid-server/master/scripts/build-helper.sh" && \
    steamcmd +force_install_dir /data/ServerFiles +login anonymous +app_update 380870 +quit && \
    #echo "#\!/bin/bash" > build-helper.sh && \
    #echo "delay=10s" >> build-helper.sh && \
    #echo "timer=120" >> build-helper.sh && \
    #echo "screen -dmS demo sh /data/ServerFiles/start-server.sh" >> build-helper.sh && \
    #echo "sleep 10s" >> build-helper.sh && \
    #echo "for((i=0;i<\$timer;i++));" >> build-helper.sh && \
    #echo "do" >> build-helper.sh && \
    #echo "    if screen -list | grep -q \"demo\"; then" >> build-helper.sh && \
    #echo "        screen -S demo -X stuff \"quit\"" >> build-helper.sh && \
    #echo "        screen -S demo -X stuff \$'\\\n'" >> build-helper.sh && \
    #echo "        sleep 1s" >> build-helper.sh && \
    #echo "        continue" >> build-helper.sh && \
    #echo "    else" >> build-helper.sh && \
    #echo "        exit" >> build-helper.sh && \
    #echo "    fi" >> build-helper.sh && \
    #echo "    exit 0" >> build-helper.sh && \
    #echo "done" >> build-helper.sh && \
    chmod a+x build-helper.sh && \
    sh build-helper.sh && \
    rm build-helper.sh && \
    ln -s /root/Zomboid /data/Zomboid && \
    cd /data/Zomboid && \
    rm -rf `ls | grep -v "options.ini"` && \
    sed -i 's/language=.*/language=$DEFAULT_LANGUAGE/g' options.ini && \
    cd /data/ServerFiles && \
    sed -i 's/-Xmx8g/-Xmx$MAX_RAM/g' ProjectZomboid64.json

FROM ubuntu:latest
ENV LANG=C.UTF-8

COPY --from=builder /data /data/

WORKDIR /data/ServerFiles

ENTRYPOINT ["sh","start-server.sh"]