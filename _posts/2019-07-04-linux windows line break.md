---
layout:     	post
title:      	Line Breaks in Unix & Windows
categories: 	Linux
description:   	Linux, Windows 换行 
keywords: 		Linux， Line
---
\r, \n,CR, LF, ^M分别是什么东东

# 一、区别

- windows中的换行符是\r\n
- linux/unix下的换行符是\n。

- 回车符：\r=0x0d  (13)          return； #回车（carriage return，CR）  

- 换行符：\n=0x0a (10)           newline。#换行（newline, LF）
- \r\n dos格式的文件在类Unix下打开，比如vim， 会被展示成^M

# 注意事项

- 类unix系统上运行的Shell脚本文件格式必须为unix风格， 否则可能会运行报错

- 若通过C语言向其他语言的系统传递携带换行符的字符串时，必须考虑`\`的转义问题，如需要变成`\\r\\n`

- 自己的github pages 文档发现在主页上整个都展示出来了， 最后发现是文件格式的问题， 这个以后需要注意。

  

# 参考资料

- [换行符在Linux和Windows下的区别以及将Linux和windows下的文件的互转的Linux命令：unix2dos, dos2unix](https://blog.csdn.net/wzb56_earl/article/details/6860358)

