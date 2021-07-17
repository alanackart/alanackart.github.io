---
layout:     	post
title:      	Data Recovery
categories: 	Database
description:   	
keywords: 		Database
topmost: true
---

 记载一次数据丢失，数据恢复(update@20210717)

# 事件概述

​		事情的起源是因为修数脚本在测试环境和uat环境执行顺序的不同(测试环境是逐天包板，uat环境是一个时间段内升级一次，升级时按照提交文件的名称决定升级的顺序)， 在升级前一周，经过跟运维同事的交涉，提供了调整步骤，但是由于后续运维同事的疏忽，没有执行调整步骤，导致数据被不可逆的错误更新。

# 事件总结

​	  数据被错误更新是连续一连串的凑巧，失误造成的。当自己发现第一个问题时就应该多对此次数据升级的事情上心，不要太相信人的操作。由于此次数据更新设计的量比较大，被错误更新后也较难恢复（无法通过业务逻辑，日志等手动恢复），就更加应该上心。不过，这一切都是事后的想法了。

# 事件中涉及的技术

- 包版脚本最后能改成按照文件提交的版本号去重后执行
- [闪回数据库（Flashback Database）](https://blog.csdn.net/ccie38499/article/details/12519253)有时间限制,  生产环境也未开
- [逻辑备份、物理备份与快照](https://help.aliyun.com/document_detail/92904.html) 此次恢复使用的时oracle rman
- [Oracle的三种高可用集群方案](https://developer.aliyun.com/article/604235)   目前我们使用的是rac                              

