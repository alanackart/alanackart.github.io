---
layout:     	post
title:      	Searching Bug
categories: 	Life
description:   	总结
keywords: 		总结
topmost: true
---

在事故中总结经验，成长（最后更新于20200724）

# 线上问题

数据库环境切换错误，导致错误的数据更新

主要原因是上游的数据处理范围不对， 而上游调用到我的方法时，我的方法里又有一句实际无用的根据上游数据设置数据库环境的动作， 导致后续处理进入错误的数据环境。 错误已经很久，但是因为代码很多地方缺少验证，导致直到客户报了数据错误更新的问题我们才发现。

# Readlist

- [多租户数据隔离的三种方案](https://blog.csdn.net/u014624241/article/details/95964810)



