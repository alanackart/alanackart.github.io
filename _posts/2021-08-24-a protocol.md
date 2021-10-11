---
layout:     	post
title:      	A Protocol
categories: 	C/CPP
description:   	记一次二进制数据网络传输
keywords: 		C/CPP
topmost: true
---

记一次异构架构之间的数据传输, update@20210824

# 介绍

设计了一个如下的消息对象

消息类型

序列化类型

包含所有消息的字节数组

分层放置消息的好处在于外层的消息可用以快速判断

因为需要通过kafka传输，所以实现了value.serializer, value.deserializer, 而实际的业务消息则可以选用不同的序列化器， 只要设置对应的序列化code即可。

# ReadList

