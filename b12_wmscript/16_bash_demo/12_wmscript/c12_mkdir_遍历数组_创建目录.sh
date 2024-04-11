#!/bin/bash

# 创建一个数组
dir_array=("dir1" "dir2" "dir3")

# 遍历数组中的每个元素
for dir in "${dir_array[@]}"; do
  # 使用mkdir命令创建对应的目录
  mkdir "$dir"
done