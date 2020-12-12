---
layout:     	post
title:      	Bug Caused By Wrong Order Of Deploying
categories: 	[Build, Deploy, Database, Bug]
description:   	Bug Caused By Wrong Order Of Deploying
keywords: 		Build, Deploy, Database, Bug, DML
topmost: true
---

数据库插入，删除脚本在初步测试环境和UAT环境因部署问题导致结果不同

# 背景介绍

- 我先提交了一个数据插入的脚本，然后需求变动，我只好再做了一次提交，删除了之前提交的数据。在初步测试环境（以下简称devtest）因为脚本是先后分别被部署的。结果符合预期。

- 在UAT环境, 两个脚本的部署是同批次进行的，但执行顺序与我的提交顺序不符（实际是按文件名排序），导致bug

# 事故反思

- 在明显依赖执行顺序时，自己如果不能或者无法知道部署逻辑时，应该自己做好防御，在同一个文件里提交。或者进行咨询，而不是自以为是， 要永远对其他事务保持质疑和求证的态度！