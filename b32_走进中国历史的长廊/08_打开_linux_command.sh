#!/bin/bash

# grasspy.cn
# 草蟒极速 QQ 交流群：760167264 风里雨里我们在这个QQ群里等你 快来吧,大家一起快乐的聊天吧!
# 来聊聊,中西如何互为借鉴,砥砺前行,中西合璧,走进新时代,实践全球化的命运共同体

# NOTE 多种_运行_方法_下面的每种方法_都是独立进行的
# 02_在本编辑器中_点击鼠标右键_选择_"Run Code"的_菜单选项
# 03_在本编辑器中_按组合键_Alt+Ctrl+N

sudo kill -9 $(sudo lsof -t -i:5000)

# NOTE 启动linux_command的webui
python -m http.server \
    --directory ../c50_resources/b32_html \
    5000

