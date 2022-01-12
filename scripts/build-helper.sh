#!/bin/bash
work_dir=$(dirname $(dirname $(readlink -f "$0")))

docker pull steamcmd/steamcmd:alpine

docker run -it --rm -v $work_dir/temp:/data steamcmd/steamcmd:alpine steamcmd +force_install_dir /data +login anonymous +app_update 380870 +quit

cp $work_dir/dockerfile/Dockerfile $work_dir/Dockerfile
docker build -t cycledm/project-zomboid-server $work_dir
rm $work_dir/Dockerfile