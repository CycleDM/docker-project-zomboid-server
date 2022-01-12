#!/bin/bash
work_dir=$(dirname $(dirname $(readlink -f "$0")))
image_name="cycledm/project-zomboid-server:latest"

########################################################################################
unset result
docker push $image_name
result=$?
if [ "$result" = "0" ]; then
    echo "$image_name 推送成功"
else
    echo "$image_name 推送失败"
    echo "参数 $1, $2"
    exit 1
fi
########################################################################################