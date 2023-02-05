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
