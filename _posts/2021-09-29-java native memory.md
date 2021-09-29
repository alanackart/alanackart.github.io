---
layout:     	post
title:      	Java Native Memory
categories: 	Java
description:   	记一次java程序系统内存占用太大的处理
keywords: 		Java/memory
---

记一次java程序系统内存占用太大的处理 update@20210928

# 介绍

写文件用的NIO，有缓存，没有设置立即刷新到磁盘，导致系统内存占用太高。

# ReadList

