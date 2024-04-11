#!/usr/bin/env bash

# 如何使用数组在bash中使用mkdir创建子目录?
# https://www.5axxw.com/questions/content/jxmrgf

# 好吧,如果你接受了一些古怪的答案:

# 使用printf生成comma-delimited数组值列表
# 用大括号包裹{}
# 将mkdir/printf馈送到eval

# declare -a v18_dir_array = ( 1 2 3 4 5);
v18_dir_array=("dir1" "dir2/subdir" "dir3/subdir1/subsubdir")

echo mkdir -p sub{1..3}/{$(printf "%s," "${v18_dir_array[@]}")}

eval mkdir -p sub{1..3}/{$(printf "%s," "${v18_dir_array[@]}")}
