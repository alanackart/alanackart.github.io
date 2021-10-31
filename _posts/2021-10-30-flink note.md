---
layout:     	post
title:      	flink note
categories: 	flink 
description:   	Flink学习笔记
keywords: 		flink 
topmost: true
---

flink 学习笔记 					update@20211030

# 前言

通过[官方的示例工程](https://codeload.github.com/apache/flink/zip/refs/heads/master)的代码学习flink的各种功能（注意使用JDK8）


# 术语解释

##  JobMaster implementation

The job master is responsible for the execution of a single [`JobGraph`](https://ci.apache.org/projects/flink/flink-docs-release-1.7/api/java/org/apache/flink/runtime/jobgraph/JobGraph.html).

It offers the following methods as part of its rpc interface to interact with the JobMaster remotely:



# ReadList

