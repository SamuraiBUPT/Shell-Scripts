# 查看Java版本
`java -version`

# 卸载java 17
首先是清理主体
`apt remove openjdk-17-jre`  
然后是清理依赖包，他会自动帮你把不用的清理干净
`apt autoremove`

**注意，这两个过程中，都会让你输入y来确认是否卸载，直接输入y就行**

# 安装Java8
`apt install openjdk-8-jre`

同样会在中途输入`y`

# Linux技巧：如何获取外部的路径？
需求：现在我要获取Java路径，并且保证以后都能用到
```
whereis java  # 这是一个命令行，whereis中间不分开，java小写
```

然后 打开/etc/profile ，在末尾添加

```
export JAVA_HOME=/usr/lib/jvm/java-1.8.0-openjdk-1.8.0.191.b12-1.el7_6.x86_64/jre/bin/java
export PATH=$JAVA_HOME/bin:$PATH
export CLASSPATH=.:$JAVA_HOME/lib/dt.jar:$JAVA_HOME/lib/tools.jar
```

# 那么如何得到echo的输出信息？
```
var=$(echo "hello world")
echo $var
#output： hello world
```
就是在echo的时候，就能获取

# 如何在shell中获取java version？
## 获取java版本号
```
$ java -version 2>&1 | sed '1!d' | sed -e 's/"//g' | awk '{print $3}'

1.8.0_222
```
## 获取java类型 和 版本号
```
$ java -version 2>&1 | sed '1!d' | sed -e 's/"//g' -e 's/version//'

openjdk  1.8.0_222
```

在shell中要获取java版本号最基本的思路就是从`java -version`的输出内容中解析出版本号，但是`java -version` 的输出并不是输出到默认的`stdout`，而是`stderr`,所以要想从`java -version` 的输出解析出`java`版本号，就要将`java -version` 的输出重定向，

上面脚本中`2>&1`就是将原本输出到stderr中的内容重定向输出到stdout,这样就可以将java -version的**输出通过管道|输入到sed,awk这些工具去处理了.**

代码中`sed '1!d'`的含义是删除除第一行外的所有内容，在这里就是只保留java -version输出的第一行内容

`java version "1.8.0_111"`


接下来`sed -e 's/"//g'`就简单了，就是删除字符串中的"号，所以上面的第一行内容进一步被处理成openjdk version 1.8.0_222(同理's/version//'是删除字符串中的version)

接下来的`awk '{print $3}'`就是输出空格分隔的第三段，就是最终的版本号`1.8.0_222`
