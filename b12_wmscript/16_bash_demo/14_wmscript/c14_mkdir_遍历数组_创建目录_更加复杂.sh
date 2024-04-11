#!/bin/bash

# 定义一个数组,包含要创建的目录名称
directories=("dir1" "dir2/subdir" "dir3/subdir1/subsubdir")

# 遍历数组
for dir in "${directories[@]}"; do
    # 使用mkdir命令创建目录,带上-p参数以递归创建嵌套目录
    mkdir -p "$dir"

    # 可选:检查mkdir命令的退出状态,确保目录创建成功
    if [ $? -eq 0 ]; then
        echo "Directory $dir created successfully."
    else
        echo "Failed to create directory $dir."
    fi
done