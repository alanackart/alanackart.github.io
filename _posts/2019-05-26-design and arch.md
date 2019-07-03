---
layout:     post
title:     pub-sub的设计
subtitle:  pub-sub的设计的一些想法
date:       2019-05-26
author:     Alan
header-img: img/post-bg-plum-blossom.jpg
catalog: true
tags:
    - Design
---
# Part A:

- 数据的广播要考虑一点是否需要旧有数据， 若需要旧有数据， 则需要将每一笔数据保存下来， 若推送端做保存， 可请求推送端重新广播; 或若接收端有保存， 做查询即可。若不需要旧有数据， 若有必要， 重新发送订阅信息即可接收到目前实时的数据