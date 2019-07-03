---
layout:     	post
title:      	Benchmarks on DB & messae queue
categories: 	Benchmarks
description:   	Benchmarks on DB & messae queue
keywords: 		Linux, Shell
---

虚拟机上简单跑了下redis的评测工具

# test for redis

- test environment:  

  Intel(R) Core(TM) i7-7700HQ CPU @ 2.80GHz on virtual machine

- procedure:

  redis-benchmark -r 1000000 -n 2000000 -t get,set,lpush,lpop -q

- result:
  - SET: 104335.12 requests per second
  - GET: 100010.01 requests per second
  - LPUSH: 105786.52 requests per second
  - LPOP: 103734.44 requests per second


