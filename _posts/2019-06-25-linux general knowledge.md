---
layout:     	post
title:      	Linux System Knowledge
categories: 	Linux
description:   	Linux服务端开发与管理总结 
keywords: 		Linux
---

Linux服务器知识及几次生产事故(tragedy)总结

# 进程pid重用

 		由于进程ID是由范围的(1-[pid_max](https://unix.stackexchange.com/questions/16883/what-is-the-maximum-value-of-the-process-id))新产生的进程存在可能恰巧分配到某个已经不存在的进程ID， 程序中需要注意。

# password expired caused cron failure

- 说明：
  - ​	密码过期导致cron job未执行(solaris)
- 解决方案: 
  -    跳过cron的密码检查， see [link](https://hotpotato.tistory.com/685)
  -    better ops on password maintain


# 思考开发环境SERVER挂掉

开发环境由于开发人员的直接开发和误操作问题，可能不太稳定， 但是导致整个server down掉需要物理重启， 理论上生产上也存在发生的可能（即使有备机的存在），还是需要给予关注。

- 使用root权限修改libc.so, 这个问题属于权限控制问题，系统库一般应该不允许任何人的修改
- 程序异常， log写太多导致磁盘空间不足，监控系统需要对（程序，程序日志的大小）做监控
- 程序异常， 进程fork太多导致进程数或内存不足，监控系统需要对（程序，程序数/内存）做监控，对普通用户的进程数， 内存占用做出限制，避免只能物理重启机器

# 关于linux文件系统

- linux中/proc只存在于内存中， 是一种虚拟文件系统， 所以内核参数如mqueue的一些设置想持久化，则需要写入正真的文件中，如开机启动文件中, /etc/rc.d/rc， [阅读 Linux启动流程](http://www.ruanyifeng.com/blog/2013/08/linux_boot_process.html)
- /tmp 目录自动清理, [阅读](https://www.cnblogs.com/kerrycode/p/5759941.html)

# linux 系统概念

## 线程适合于在SMP机器上运行，而进程则可以跨机器迁移。*SMP机器？*

[牛客网](https://www.nowcoder.com/questionTerminal/b0e6c34f0a5f4065b05152ade39ccc97)

[对称多处理器系统-SMP](https://blog.csdn.net/liujiaoyage/article/details/37722649)

SMP是Symmetric Multi Processing的简称，意为**对称多处理系统**，内有许多紧耦合多处理器，这种系统最大的特点就是**共享所有资源**。与之相对立的标准是 MPP（Massively Parallel Processing），意为**大规模并行处理系统**，这样的系统是由许多松耦合处理单元组成的，这里指的是处理单元而不是处理器。每个单元内的CPU都有自己私有的资源，如总线、内存、硬盘灯。在每个单元内都有操作系统和管理   数据库   的实例副本。这种结构最大的特点在于**不共享资源。**     **因而线程更适合在SMP机器上进行，而进程则可以跨机器迁移。**

## Linux的内核模式和用户模式

## 中断和异常

当中断或异常发生时， 运行用户态的CPU会由硬件实现的机制立即进入核心态。

# Readlist

- [Linux用户模式和内核模式](https://blog.csdn.net/xjc200808/article/details/47166821)

