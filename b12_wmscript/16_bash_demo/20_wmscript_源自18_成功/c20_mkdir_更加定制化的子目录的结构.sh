#!/usr/bin/env bash

# 如何使用数组在bash中使用mkdir创建子目录?
# https://www.5axxw.com/questions/content/jxmrgf

# 好吧,如果你接受了一些古怪的答案:

# 使用printf生成comma-delimited数组值列表
# 用大括号包裹{}
# 将mkdir/printf馈送到eval

# Linux系统中mkdir和rm命令用法详解
# https://blog.csdn.net/weixin_44799217/article/details/113781331

# linux下mkdir命令如何使用
# https://www.php.cn/faq/552049.html

# declare -a v20_dir_array = ( 1 2 3 4 5);
v20_dir_array=("dir1/{01_大纲,05_代码,08_练习}" "dir2/subdir/{01_大纲,05_代码,08_练习}" "dir3/subdir1/subsubdir/{01_大纲,05_代码,08_练习}")

echo mkdir -p sub{1..3}/{$(printf "%s," "${v20_dir_array[@]}")}

eval mkdir -p sub{1..3}/{$(printf "%s," "${v20_dir_array[@]}")}
