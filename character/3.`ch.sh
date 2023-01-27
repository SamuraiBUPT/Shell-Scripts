#!/bin/bash

# ``的作用就是$()

# 而$()的作用就是获取指令执行出来的值
whereamii=$(
    cd $(dirname $0)
    pwd
) # dirname的作用是获取当前脚本执行的目录位置(相对directory，而如果要获取绝对directory就要用pwd)
echo $whereamii

# 牢记：获取指令执行的值并且赋值给变量：$()，
# 指令执行的值传给下一条command： |
