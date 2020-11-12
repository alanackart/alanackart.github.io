---
layout:     		post
title:      		Learn of Nginx(Web Server) 
categories: 	    Infrastructure
description:   		Learn of Nginx(Web Server)
keywords: 		  infrastructure, Nginx, Server
topmost: true
---

记录自己在学习Nginx设计架构时的一些心得和感悟

# 写在前面

- 某司自己开发的一套Web服务器由于是阻塞性的， 一个请求只能等请求的事件处理完才能调用返回，并且服务进程只能逐个从事件队列中取出事件并处理完成，所以在遇到耗时较长的业务处理（比如client请求一个较大的文件）时就会导致服务器实质上的不可用。

- 某司的很多服务进程都不支持实时的配置（一般配置都是直接在初始化时从DB捞取到（共享）内存中），这一点Nginx就很棒了。作为可能大量依赖的基础软件， 不支持实时配置，则意味着配置若有改动想实时生效则只能重启， 而这在生产环境则是不可接受的（粗暴的重启可能会丢数据， 可能会受到生产操作流程的限制）， 在处理突发状况时， 所需时间也比较慢。

# General

# Others


# Readlist

# Reference

