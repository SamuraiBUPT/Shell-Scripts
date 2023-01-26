#!/bin/bash

# 普通数组
arr1=(1 2 3 4)
for idx in ${arr1[*]}; do
    echo $idx
done

arr2[0]=11
arr2[1]=22
arr2[2]=33

for idx in ${arr2[*]}; do
    echo $idx
done

# 关联数组
declare -A mapper=(["yxn"]="dyz" ["dyz"]="yxn")
echo ${mapper["yxn"]}
echo ${mapper["dyz"]}
