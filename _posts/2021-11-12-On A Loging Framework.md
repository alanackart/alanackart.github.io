---
layout:     	post
title:      	On a logging framework
categories: 	[Linux, Bug]
description:    On a logging framework
keywords: 		Linux
topmost: true
---

记cxxx_cffex的日志异常 update@20211118

# 背景介绍

这是我们的一个接口项目所用到的一个日志框架，基于可变参数实现，可传入单个文件

存在的问题

多进程写不同的文件

控制不了文件大小

# Readlist



