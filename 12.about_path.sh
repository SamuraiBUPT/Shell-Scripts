#!/bin/bash

# 脚本执行路径，和当前执行路径，有天壤之别

# 脚本所处路径
script_path=$(
    cd $(dirname $0)
    pwd
)

# 当前路径
current_path=$(pwd)
echo $current_path

# 会随之cd吗？
echo $(pwd) # 注意：实际上在外部作用域没有cd，只是在script_path里面进行了cd操作

# dirname是什么
echo $(dirname $0) # dirname是管理：脚本执行时候的路径和脚本本身路径之间的距离，如果就在当前目录，那么会输出‘.’

# 如果以后再碰到类似路径的情况，只需要在脚本里面开一个$()，然后在括号里面cd到指定路径进行操作bash xx.sh即可

# 在Linux中，如果一个路径的开头是/，那么就是绝对路径

#
#
#
# 执行程序的地方，永远在根目录。如果不想惹麻烦，就一定要在根目录进行调试脚本，同时在脚本编程的时候，也要写明白script_path和upper_path等东西，切记！
#
#
#
