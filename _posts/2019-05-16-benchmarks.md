---
layout:     	post
title:      	Benchmarks 
categories: 	Benchmarks
description:   	各种评测
keywords: 		Linux, Shell
---

走着瞧（测着瞧）

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

# test for web server

## 评测工具及命令

webbench -c 300 -t 60 http://127.0.0.1:80/,  [webbench地址](https://github.com/alanackart/WebBench) 

## 评测结果

### nginx

```
chao@ubuntu:~/zaver/trunk$ webbench -c 300 -t 60 http://127.0.0.1:80/
Webbench - Simple Web Benchmark 1.5
Copyright (c) Radim Kolar 1997-2004, GPL Open Source Software.

Request:
GET / HTTP/1.0
User-Agent: WebBench 1.5
Host: 127.0.0.1

Runing info: 300 clients, running 60 sec.

Speed=1761903 pages/min, 25077754 bytes/sec.
```

### zaver(大神写的nginx简单实现)

```
chao@ubuntu:/var/log/nginx$ webbench -c 300 -t 60 http://127.0.0.1:3000/
Webbench - Simple Web Benchmark 1.5
Copyright (c) Radim Kolar 1997-2004, GPL Open Source Software.

Request:
GET / HTTP/1.0
User-Agent: WebBench 1.5
Host: 127.0.0.1

Runing info: 300 clients, running 60 sec.

Speed=321196 pages/min, 3704472 bytes/sec.
Requests: 321196 susceed, 0 failed.
```

[zaver](https://github.com/alanackart/zaver)和nginx差距还是满大的， 自己可以再看看两者的源码