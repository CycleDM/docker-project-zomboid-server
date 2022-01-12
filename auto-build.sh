#!/bin/bash
work_dir=$(dirname $(readlink -f "$0"))
build_script=$work_dir/scripts/build-helper.sh
push_script=$work_dir/scripts/push-helper.sh

echo "即将开始构建..."
sh $build_script
if [ "$?" = "0" ]; then
    sh $push_script
fi

echo "自动构建完成，即将清理镜像..."
sleep 10s
docker image prune -f
docker images