#!/bin/bash

# 1. | 管道符号和命令行参数的使用

echo "管道运算符："
echo "把第一个命令command 1执行的结果作为command 2的输入传给command 2."
echo "eg:"
echo

# -s, file size
# -n, --numeric 根据字符串数值比较
# -r, --reverse 逆序输出排序结果
ls -s | sort -nr
# 该命令列出当前目录中的文档(含size)，并把输出送给sort命令作为输入，sort命令按数字递减的顺序把ls的输出排序。

# 其实sort命令本身就是这么用的，从这里也可以看出来，一个-就是缩写，两个-才是全称
