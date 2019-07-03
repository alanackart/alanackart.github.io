---
layout:     	post
title:      	Data Brodcast
categories: 	Data
description:   	行情数据处理
keywords: 		Design
---

行情数据处理的思考

# 数据的广播要考虑一点接收方是否需要旧有数据 

## 若需要旧有数据

- 若推送端有做保存， 则接收方可请求推送端重新广播
- 若接收端有保存， 从DB里做查询即可

## 若不需要旧有数据

-  接收方发送订阅信息即可接收到目前实时的数据