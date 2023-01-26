#!/bin/bash

# : 冒号的使用

# 功能1：用来做If else语句中间的占位符，相当于python中的pass

# 功能2：参数扩展
# {str:=expr}
# 如果变量str不为空,${str:=expr}就等于str的值，若str为空，就把expr的值赋值给str。

# ${parameter:-word}    如果parameter没有设置或者为空，替换为word；否则替换为parameter的值
# 没定义，替换为word

# ${parameter:+word}    如果parameter没有设置或者为空，不进行任何替换；否则替换为word。
# 有定义，替换为word

# -XX:+UseG1GC的意思，如果有定义，则替换为UseG1GC

# ${parameter:=word}    如果parameter没有设置或者为空，把word赋值给parameter。实际parameterd的值真的被替换了，这就是=号的意思。不能用这种方式指派位置参数或特殊参数的值。

# ${parameter:?word}    如果parameter没有设置或者为空，把word输出到stderr，否则替换为parameter的值。     -、+、? 实际parameter的值并不被修改，扩展只是临时显示成word的值。准确的讲，扩展实际替换的是参数的显示，而不是参数的定义。只有=，才是替换参数的定义。

# ${parameter:offset}    扩展为parameter中从offset开始的子字符串。

# ${parameter:offset:length}     扩展为parameter中从offset开始的长度不超过length的字符。

mystr="abcdefghijklmnopqrstuvw"
echo ${mystr:5:6} # fghijk
