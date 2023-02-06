#!/bin/bash

# 锁定对应的行
grep 121 Test

# awk也能实现，但是awk是逐行查找
cat Test | awk '/121/'

# 此外awk的$n功能是锁定列
# $1是第一列
cat Test | awk '{print $1}'

# 所以下次就不用去变换数组了，直接用awk即可
var_str="I test your code"
echo $var_str | awk '{print $2}'

# 这里可以认识到：单引号里面的是一个命令环境，可以执行命令，split是awk自带的一个函数，$1的意思是第一列，以.作为分隔符，结果存储到arr里面，这个数组的下标也是从1开始的
first=$(python -V 2>&1 | awk '{print $2}' | awk '{split($1, arr, "."); print arr[1]}')
second=$(python -V 2>&1 | awk '{print $2}' | awk '{split($1, arr, "."); print arr[2]}')
