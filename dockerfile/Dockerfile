FROM steamcmd/steamcmd:latest

ARG MAX_RAM=4G
ENV HOME=/app \
    LANG=C.UTF-8
    

COPY ./temp $HOME/Server/
COPY ./scripts/start-helper.sh $HOME/

RUN apt-get update && \
    apt-get install -y --no-install-recommends screen && \
    rm -rf /var/lib/apt/lists/* && \
    sed -i "s/-Xmx8g/-Xmx$MAX_RAM/g" $HOME/Server/ProjectZomboid64.json && \
    #mkdir $HOME/Zomboid && \
    #ln -s $HOME/Zomboid /root/Zomboid && \
    chmod a+x $HOME/Server/start-server.sh $HOME/start-helper.sh

WORKDIR $HOME

ENTRYPOINT ["sh","start-helper.sh"]