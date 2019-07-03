---
layout:     post
title:     benchmarks(redis, kafka)
subtitle:   basic benchmarks on (redis, kafka)
date:       2019-05-16
update:     2019-06-26
author:     Alan
header-img: img/post-bg-plum-blossom.jpg
catalog: true
tags:
    - benchmarks
---



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


