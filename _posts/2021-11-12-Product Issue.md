---
layout:     	post
title:      	Product Issue
categories: 	[Dubbo, Bug]
description:    On a logging framework
keywords: 		Linux
topmost: true
---

记录一些线上问题 update@20211118

# 记录

- tomcat线程池 maxWait未配置，默认是 30s, 在oracle scan ip背后的实地址ip被动到的情况下，需要30s才超时，在大量访问的情况下触发了dubbo actives 100的限制。

- dubbo线程池复用，导致上一次请求残留的变量在没有被重置的情况下(我们遇到的问题是被另一service直接引用)而泄露

  ```xml
  <dubbo:protocol name="dubbo" dispatcher="all" threadpool="fixed" threads="100" />
  ```

# Readlist

- [The Tomcat JDBC Connection Pool](https://tomcat.apache.org/tomcat-7.0-doc/jdbc-pool.html)

