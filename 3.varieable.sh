#!/bin/bash

# 查看三个路径
echo $HOME # HOME路径（Windows）：/C/Users/27813

echo $PWD # 当前工作路径

echo $SHELL

# 声明变量(Like python)
# 语法：  变量 = 值
A=5 # 中间不能空格，如果有空格了，就会command not found
# Shell里面变量必须紧贴赋值，中间不能按习惯空格
echo $A # 打印A的值，是用$符号取

# 撤销变量
unset A
echo $A # 撤销之后无法打印

# 设置静态变量，不能unset
readonly B=7
echo $B

# bash中，变量默认类型都是字符串类型，无法直接进行数值运算
# 如果变量的值有空格，需要用双引号括起来
readonly myName="dyz is a boy"
echo $myName

# 全局变量
testText="1!5!"
export testText # 导出，并且在下面执行的这个程序链中，4.sh捕获到全局的testText，将其广播

bash "4.params.sh" 1 2 3 # linux的指令就是shell脚本指令，一回事

# 简单使用一下for循环
for text in C++ Java Python; do
    echo "${text} is the best language." # 花括号只是用来分开变量，如果不分开，系统会将其与后面的东西混在一起
done

# 双引号的优点就是可以在里面通过这种方式使用其他变量，但是单引号就不行
testvar_s1="dyz"
testvar_s2="yxn loves ${testvar_s1}."
echo $testvar_s2

# 获取字符串长度
echo ${#testvar_s2} # 输出14

# 数组与切片
echo ${#testvar_s2[2]} # 0
echo ${testvar_s2:1:5} # xn lo  一个切片
