---
layout:     	post
title:      	A Bug of A Year Back（sysdate）
categories: 	[Bug]
description:   	A Bug of A Year Back（sysdate）
keywords: 		Bug
topmost: true

---

记录同事的一个Bug, 数据库`sysdate`和to_date('',yyyymmdd)比较上出的问题

# 线上问题

问题是很简单的，但是自己第一眼也没看出来有啥问题， 20191231报出来的问题20201231又出现了（20191231出问题之后，有做修复，但是当时那位同事似乎只看改了一个问题，有**小于**改为了**小于等于**， 但是其实用20201231的date形式和`sysdate`比还是有问题的）

# 反思

- 时刻保持怀疑，不要觉得功能已经修复就不会存在问题，一个Bug可能修了一下没修好，测试也没测出来。。。

# Readlist





