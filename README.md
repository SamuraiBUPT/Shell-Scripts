# Run Shell Script (.sh) On VSCode
+ 设置环境变量（`Git/bin`）设置进Path里
+ VSC安装相关插件
+ 在`Terminal`输入bash进入shell环境
+ 输入`sh xx.sh`即可运行shell脚本，**注意文件运行的位置！避免文件找不到的情况**
+ 输入`cmd`退出bash环境。

# #!/bin/bash
shell的开头一般都用这个作为起手，因为这并不仅仅是注释，而是在指定一个shell脚本**解析器**

# 入门知识

    + SHELL是一个命令行解释器，负责接收应用程序/用户指令，然后调用操作系统内核
    + SHELL同时也是一门脚本语言
    + 硬件（手机屏幕）<--操控-- Linux内核 <-- Shell 调用 -- 外层应用层序

    + Linux具有的Shell解释器：sh, bash, nologin, dash, tcsh, csh，
    + 如果不指定用谁来解析，就会用bash来解析

    + 使用Xshell rz就可以上传，默认上传到最外层
    + 按ls查看上传到哪了
    + 然后直接：“sh ./1.sh”  输文件名字，就可以执行
    + “rm -f 1.sh”就可以完成文件的删除，再用ls查看的时候就已经没有了

# touch命令
用于修改文件或者目录的时间属性，包括存取时间和更改时间

# 查看有哪些文件夹：
`list directory contents`就是ls，命令用于显示指定工作目录下之内容（列出目前工作目录所含之文件及子目录)。

如果ls后面不跟路径，得到的就会是看当前路径下的东西。

# 系统变量
`$HOME`

可以直接使用`echo $HOME` 查看这是什么

输出结果：`/c/Users/27813`

`echo $PWD`:print work directory ,打印当前工作目录

# 系统讲解$符号和#符号
## $
`$`用来作为变量的引用

`echo $variable`就是在引用这个变量

引用只有在取值的时候会用到，如果我们是对变量进行操作：

```
A=5
export A
```
等等，对内存进行移动、地址移动的时候，不会用到美元符号

**在这里可以把美元符号理解为：取** ，取（变量、传过来的参数）的东西

## '#'
`echo "一共有${#}个参数"  `
从这里可以看出来，首先`#`表示的是取长度，而不是取其他东西

# 遍历数组
```
for idx in ${arr1[*]}; do
    echo $idx
done
```

`for..in`要求in后面的必须是可迭代的东西，像这样就已经可以了

Linux默认换行为一句话结束，如果一行想多写语句，必须用`;`隔开

# 获取指令执行的结果 与 后续处理
## 赋值给变量

```
whereamii=$(
    cd $(dirname $0)
    pwd
)
```

## 传入下一条command
`java -version 2>&1 | sed 1!d`

# Code Experience
记得在调试脚本的时候，要在根目录进行调试，

**因为很多命令都是会在脚本执行时环境进行io操作的**，

如果仅仅是在脚本当前环境进行调试，可能会导致脚本无法运行/io失败。

在写脚本的时候，一定要在前面把script_path写好，便于后面运用。

`script_path`：脚本所处的环境

```
script_path=$(
    cd $(dirname $0)
    pwd
)
```

`upper_script_path`：脚本所处的环境

```
upper_script_path=$(
    cd $(dirname $0)
    cd ..
    pwd
)
```

`dirname $0`是**脚本所处位置**和**执行脚本的位置**之间的相对路径，用好`$(dirname $0)`是用好shell的基础