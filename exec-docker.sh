#!/bin/bash

# 检查是否提供了命令行参数
if [ $# -eq 0 ]; then
    # 如果没有提供参数，提示用户输入搜索关键词
    read -p "请输入搜索的Docker镜像关键字: " keyword
else
    # 如果提供了参数，使用第一个参数作为搜索关键词
    keyword=$1
fi

# 查找匹配关键词的容器
containers=$(docker ps --format "{{.ID}} {{.Image}} {{.Names}}" | grep "$keyword")

# 检查是否找到匹配的容器
if [ -z "$containers" ]; then
    echo "没有找到匹配的容器"
    exit 1
fi

# 获取匹配的容器数量
container_count=$(echo "$containers" | wc -l)

if [ "$container_count" -eq 1 ]; then
    # 只有一个匹配的容器，直接进入
    container_id=$(echo "$containers" | awk '{print $1}')
    echo "找到一个匹配的容器，直接进入: $container_id"
    docker exec -it $container_id /bin/bash
else
    # 显示匹配的容器列表
    echo "找到以下匹配的容器:"
    echo "$containers"

    # 提示用户选择一个容器ID
    read -p "请输入要进入的容器ID: " container_id

    # 进入选定的容器
    docker exec -it $container_id /bin/bash
fi
