#!/bin/bash

# basic: [command 1] stdout -> stdin [command 2] stdout -> stdin [cammand 3]

# grep更适合单纯的查找或匹配文本，
# sed更适合编辑匹配到的文本，
# awk更适合格式化文本

cat 10.test.txt
echo ""
echo "begin grep"
echo ""
# grep 与 正则表达式，用grep -E 或者 egrep 指令来进行匹配

# *  匹配前面的字符任意次，包括0次，贪婪模式：尽可能长的匹配
grep "g[o]*gle" 10.test.txt

# .*  任意长度的任意字符，不包括0次
grep "g[o].*gle" 10.test.txt

# \?  匹配其前面的字符0 或 1次
grep "g[o]\?gle" 10.test.txt
#
# \+  匹配其前面的字符至少1次

# \{n\}  匹配前面的字符n次
# \{m,n\}  匹配前面的字符至少m 次，至多n次
grep "g[o]\{1,2\}gle" 10.test.txt
# \{,n\}  匹配前面的字符至多n次
# \{n,\}  匹配前面的字符至少n次

# test
grep "[o].*" 10.test.txt

# 一切教程：
# https://www.cnblogs.com/along21/p/10366886.html
