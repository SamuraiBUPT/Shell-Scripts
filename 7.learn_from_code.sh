#!/bin/bash

# 这份脚本直接从source code中学习，可能会比较冗长

# function isdigit()
# {
#     local str=
#     for str in $@
#     do
#         str=$1
#         while [ -n "$str" ]; do
#             echo ${str:0:1} | grep "[-.0-9]" > /dev/null 2>&1
#             [ $? -ne 0 ] && return 27
#             str=`echo ${str:1}`
#         done
#         shift
#     done
#     return 0
# }

# 从if else开始
# 条件表达式要放在方括号之间，并且要有空格，例如: [$a==$b] 是错误的，必须写成 [ $a == $b ]，括号最左最右都要有空格
a=10
b=20
if [[ $a -eq $b ]]; then
    echo "1"
else
    echo "2"
fi
# 句式：if [ ... ];then...else...fi，最后要以fi结尾

# 再来看while
# 句式：while [ ... ];do...done

# 然后是for
# 句式一：迭代遍历：for xx in xx;do
#                      ...
#                  done

# for循环也可以用作文件查找：
whereamii=$(
    cd $(dirname $0)
    pwd
)

echo $whereamii

for file in $(ls $whereamii); do
    echo $file
done
# 遍历的对象，一定是可迭代的，这里与python最大的区别就是他不会自动解析，必须你去设置好一份解析对象才可以
# 比如${whereamii/*}这种，即使是读了变量，也不会有什么结果，因为传到in里面去的始终就只有一个字符串，啥也没有

# $@ 传给脚本或者函數的所有参数的列表
# $* 以一个单字符串显示所有向脚本传递的参数，与位置变量不同，参数可超过9个

# 函数与参数传递
# 对$@打上引号，可以让多个参数通过空格进行分离
function test_for() {
    for str in "$@"; do
        echo $str
    done
    return 0
}

var1=6
var2=7
var3="I love yxn."
test_for $var1 $var2 $var3 # 函数后面跟参数直接跟就行，不用加-

# 函数返回值
# Shell 函数的返回值只能是一个介于 0~255 之间的整数，其中只有 0 表示成功，其它值都表示失败。
# 在函数外部通过$()来捕获变量

# 有关老是提示你打上引号：其实不用管，因为打上引号的作用只有一个：变成字符串。如果不打，就会传入实际意义上的东西，比如路径符号，可能在脚本里会被解读为其他东西
# 也就是说，看使用者在传参的时候想不想参数被自动解读，其实不打引号也并不是一件坏事。
#
#
#
#
#
#
# 在shell中，一切都是指令。
# javaVersion=$("$basicstr" | sed -e 's/"//g' | awk '{print $3}')
# openjdk version "17.0.1" 2021-10-19 LTS: command not found
# 这就说明：他是先会执行指令，后才会变成字符串
# 你可以这样：$(echo $basicstr | sed -e 's/"//g' | awk '{print $3}')

# 重要方案：通过$()包裹，在括号里面用echo进行占位：把指令变成字符串，在命令行中不会输出

# 同理：${javaVersion:=$(echo $basicstr | sed -e 's/"//g' | awk '{print $3}')}，这么一个句子，前面什么都没有，编译器只好把17.0.1当做指令，所以就用echo在前面，前面有了echo，就有了命令，编译器不会去纠缠后面的内容了。
