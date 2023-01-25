#!/bin/bash

# 在/test目录下创建一个文件名叫test.txt，并且输入一串文字

# 通过cd命令，记得加上双引号括起来。里面的就是cd老规矩语法
cd "./test/"
# 不过cd到这个文件夹里面了，脚本执行的位置也就在这个文件夹里面了

# touch指令用来改变一个文件的修改日期，如果没有就进行创建
touch test.txt

echo "Fuck you NVIDIA" >>test.txt
