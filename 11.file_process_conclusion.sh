#!/bin/bash

# 需求：根据一个带有空格的字符串进行分割，输出为数组
str="123 ABC ddd"
arr=($str)
echo ${arr[0]}

# 需求：在字符串中间插入东西
str="I  yxn"
str=${str:0:2}"love"${str:2:4}
echo $str
# 总结：直接切片+插入字符即可

# 遍历一个文件夹中的文件名字：
# 不可以直接遍历ls出来的值，可以先通过echo一下，转化为字符串，再通过$()获取这个字符串，中间是由空格分割的，可以被for遍历
tar_path=$(dirname $0)
echo $tar_path
for fileName in $(ls $tar_path); do
    echo $fileName
done
# 总结：
# 但是好像也可以通过这种方式遍历。如果有再有红色报错，直接无视
# 省流：遍历方式： for file in $(ls $path)

# 遍历一份txt中每一行的信息
# for file in $(cat log_list.txt); do
#
# done
# 总结：直接cat就可以，总之要是一份可以被迭代的对象

# 搜索文本中的ERROR关键字所在的那一行并且输出到文本中
# grep ERROR [file name] >>ERROR_INFO.txt

# 删除文件
# rm $file_name
