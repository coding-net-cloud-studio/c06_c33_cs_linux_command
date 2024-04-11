#!/usr/bin/env bash

# 如何在bash的每个子目录中创建相同的目录？
# https://www.5axxw.com/questions/content/ceacvs

# cp -r /etc .

# dirs=( etc/*/ )
# mkdir -v "${dirs[@]/%/06_子目录}"

# dirs=( example/*/ )创建example（(example/dir1/ example/dir2/ ...)）的所有子目录的数组。
# "${dirs[@]/%/a}"扩展为包含dirs的所有元素的列表，每个元素后面都附加一个a（(example/dir1/a example/dir2/a ...)）。

# 如果有大量子目录，上面代码中的mkdir可能会失败，并出现“参数列表过长”错误。请参阅rm、cp、mv命令的参数列表过长错误。

# NOTE 避免问题的一种方法是将要创建的目录的NUL-terminated列表传递给xargs -0：

# dirs=( etc/*/ )
# printf '%s\0' "${dirs[@]/%/07_名字}" | xargs -0 mkdir -v

# 如果有必要，它将运行多个mkdir命令，每个命令都有一个不超过限制的参数列表。

# NOTE 然而，如果目录的数量如此之多，您可能会因为Bash（不必要但不可避免地）对example/*/生成的列表进行排序而遇到性能问题。在这种情况下，最好使用find。一种方法是：
find etc -maxdepth 1 -mindepth 1 -type d -printf '%p/08_这是我想建立的子目录的名称\0' | xargs -0 mkdir -v

# NOTE find对-exec ... +类xargs行为有built-in支持。然而，在这种情况下使用它有点麻烦。我能马上想出的最好办法是：

# find etc -maxdepth 1 -mindepth 1 -type d    \
#     -exec bash -c 'mkdir -v "${@/%//09_我的名字}"' bash {} +

# 由于它在运行mkdir之前将/a添加到find传递给bash的所有参数中，因此它可能会遇到“参数列表过长”错误。我将把它留在这里，因为它说明了一种sometimes-useful技术，但我建议不要使用它。