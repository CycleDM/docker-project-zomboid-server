#!/bin/bash
work_dir=$(dirname $(dirname $(readlink -f "$0")))

docker pull steamcmd/steamcmd:alpine

docker run -it --rm -v $work_dir/temp:/data steamcmd/steamcmd:alpine steamcmd +force_install_dir /data +login anonymous +app_update 380870 +quit

cp $work_dir/dockerfile/Dockerfile $work_dir/Dockerfile
docker build -t cycledm/project-zomboid-server $work_dir
if [ "$?" = "0" ]; then
    echo "$image_name:$game_version 构建成功"
    rm $work_dir/Dockerfile
    exit 0
else
    echo "$image_name:$game_version 构建失败"
    echo "参数 $1, $2, $3"
    rm $work_dir/Dockerfile
    exit 1
fi