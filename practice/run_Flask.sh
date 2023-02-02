#!/bin/bash

# INFO
# screen 进程：Flask
# 要进行压缩的压缩包：Flask.zip
# 如果Attached状态，用screen -d Flask进去
# 如果这时候没法弄了，断开连接就完事了
echo "请在/python_project/flask_for_segment运行这份shell script"
echo ""
echo ""
script_path=$(
    cd $(dirname $0)
    pwd
)

# stop screen
screen -S Flask -X quit
sleep 3s

# clean old version
rm Flask.zip
rm -rf Visualization-Flask

# upload & unzip
rz
sleep 20s
unzip Flask.zip
sleep 5s

# restart
cd Visualization-Flask
screen -S Flask
python3 app.py