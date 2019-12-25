---
layout:     	post
title:      	A Project of Adding Heartbeat to DB Middleware
categories: 	C/CPP
description:   	C/CPP 线程
keywords: 		C/CPP, 工程/project
---

哈哈，C渣渣Java渣渣跟着大佬一起做项目

# 需求背景

公司的一个新项目被部署到了一个应用服务器到DB(oracle)服务器之间存在防火墙(firewall)的环境中， 防火墙规则不允许长连接， 所以我们需要在公司现有的DB中间件（基于oci）加一个能够保持连接的机制。

# 技术方案

boss之前给我们建议的方案是按照中间件现有的逻辑定时去请求一个`select 1 from dual`， 但是后来我在差一个问题时偶然看到了心跳heartbeat，于是就google了下， 最终在熟悉oci库的同事的帮助下查找到了oci提供的`OciPing`函数，于是我们就一致决定调用ping函数比做查询是个更为有效的方法。

# 记载实现中遇到的一些坑

- 调用函数最开始连返回值都没检查，后来还是决定检查下比较稳妥，结果检查后发现调用竟然是失败的，**后续检查发现自己传入的service指针竟然都是空的**。
- 最终同事帮忙找到了（😂，主要是太困了，就下班回去补觉了）问题是**头文件中的static变量每一个文件都是自己独有的一份**。
- mutex = PTHREAD_MUTEX_INITIALIZER;报错
- 重定义问题

# 查问题时google到的一些链接

- [Why won't extern link to a static variable?](https://stackoverflow.com/questions/2841762/why-wont-extern-link-to-a-static-variable)
- [C pthread mutex: Expected expression before `{'](https://stackoverflow.com/questions/17864095/c-pthread-mutex-expected-expression-before)
- [symbol is multiply defined](https://stackoverflow.com/questions/14870423/symbol-is-multiply-defined)

# 写在最后

最近很少写c了， 语法上的东西很多都忘了。不过，不管编程语言时是什么，查问题的思路和方法都比较类似， 平时有空可以多实践，通过用来倒逼自己学习，虽然可能会走一些弯路，但也总比总是纸上谈兵的好。

想大佬致敬

