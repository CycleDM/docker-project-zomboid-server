#!/bin/bash
home=/app

trap 'StopServer; exit' TERM

StartServer()
{
    echo "Starting server..."
    cd $home/Server
    screen -S server sh start-server.sh
    while true
    do
        sleep 1s
    done
}

StopServer()
{
    screen -S server -X stuff "quit\015"
}

StartServer