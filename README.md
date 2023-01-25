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