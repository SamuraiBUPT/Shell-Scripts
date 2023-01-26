#!/bin/bash

echo "Hello world"
echo "I am a shell script."

chmod 777 "2.sh" # 在shell脚本里面操纵另一个脚本
sh "2.sh"

# 在外面的指令是什么，在shell里面就写什么，这是没问题的。
