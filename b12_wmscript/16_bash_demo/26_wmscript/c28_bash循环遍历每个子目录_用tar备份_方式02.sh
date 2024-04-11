#!/usr/bin/env bash

# Bash循环遍历每个子目录
# https://www.5axxw.com/questions/content/ehy6eg

if [[ -d d20_tar_target ]]; then 
    rm -rf d20_tar_target/
    mkdir -p d20_tar_target/
fi

export v20_backup_dest_dir=/workspace/programming-language-demo/26_wmscript/d20_tar_target

startdir=(
  "d10_src/etc"
  "d10_src/aa"
  "d10_src/bb"
  "d10_src/nothing"
)

for dir in "${startdir[@]}"; do
 (
   #  NOTE 如果数组中发现遇到异常项_立即退出 
   cd "$dir" || exit
   
   for sub_dir in */ ; do
    #   zip -r "${sub_dir%/}.zip" "$sub_dir"
    # NOTE 如下是可以运行的
    # tar cvf /workspace/programming-language-demo/26_wmscript/d20_tar_target/${sub_dir%/}.tar  ${sub_dir}
    
    # echo ${dir}
    # echo ${sub_dir}
    # echo ${dir}_${sub_dir%/}
    # echo $(basename ${dir})_${sub_dir%/}
    # echo ${v20_backup_dest_dir}/$(basename ${dir})

    unset v28_final_dest_dir
    
    export v28_final_dest_dir=${v20_backup_dest_dir}/$(basename ${dir})

    echo $v28_final_dest_dir
    mkdir -p ${v20_backup_dest_dir}/$(basename ${dir})

    tar cvf ${v28_final_dest_dir}/$(basename ${dir})_${sub_dir%/}.tar  ${sub_dir}
   done
 )
done
