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
echo "screen named 'Flask' is stopping..."
echo ""
screen -S Flask -X quit
sleep 3s

# clean old version
echo "cleaning old files..."
rm Flask.zip
rm -rf Flask
echo ""
echo "clean finished."
echo ""

# upload & unzip
echo "Please upload Flask.zip"
rz
sleep 15s
echo "unzipping..."
unzip Flask.zip
sleep 10s

echo "已完成配置，请cd至/python_project/flask_for_segment/Visualization-Flask，并新建一个名为Flask的新screen。"
