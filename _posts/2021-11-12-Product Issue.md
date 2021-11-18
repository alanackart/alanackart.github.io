---
layout:     	post
title:      	Product Issue
categories: 	[Linux, Bug]
description:    On a logging framework
keywords: 		Linux
topmost: true
---

记录一些线上问题 update@20211118

# 记录

tomcat线程池 maxWait未配置，默认是 30s, 在oracle scan ip背后的实地址ip被动到的情况下，需要30s才超时，在大量访问的情况下触发了actives 100的限制。

# Readlist



