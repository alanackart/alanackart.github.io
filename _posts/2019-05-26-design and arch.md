---
layout:     	post
title:      	Data Processing
categories: 	Data
description:   	行情数据处理
keywords: 		General
topmost: true
---

数据处理的思考

# 数据的广播要考虑一点接收方是否需要旧有数据 

## 若需要旧有数据

- 若推送端有做保存， 则接收方可请求推送端重新广播
- 若接收端有保存， 从DB里做查询即可

## 若不需要旧有数据

-  接收方发送订阅信息即可接收到目前实时的数据

# Kafka多partition导致消息处理顺序问题

使用单个parttion虽然可以解决问题， 但是kafka集群在正常运行下就变得无用， 一个解决方案是保证需要顺序处理的消息(某个业务关键要素， 用户， 订单ID等)放到同一个parttion中即可。这里思考问题用到了分解思想， 我们只需要保证某类业务消息得到顺序处理即可， 不用保证所有的消息顺序处理。