#!/bin/bash
delay=10s
timer=120
screen -dmS demo sh /data/ServerFiles/start-server.sh
sleep 10s
for((i=0;i<$timer;i++));
do
    if screen -list | grep -q "demo"; then
        screen -S demo -X stuff "quit"
        screen -S demo -X stuff $'\n'
        sleep 1s
        continue
    else
        exit
    fi
    exit 0
done
