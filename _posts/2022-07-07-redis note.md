---
layout:     	post
title:      	redis note
categories: 	[redis]
description:   	redis知识点和总结
keywords: 		redis, REDIS
topmost: true
---

redis知识点和总结 (update@20220721)

## jedis的pub/sub

使用subscirbe对应的事件处理回调是onMessage

使用psubscirbe对应的事件处理回调是onPMessage

## 使用config 命令做配置，redis重启后丢失

[Note that modifying the configuration on the fly has no effects on the redis.conf file so at the next restart of Redis the old configuration will be used instead.](https://redis.io/docs/manual/config/)

## Readlist

- [Redis keyspace notifications, 可以订阅key的变化](https://redis.io/docs/manual/keyspace-notifications/)

- [redis用来产生自增的key](https://github.com/redis/redis/issues/4265)

- [Redis pipeline vs mget](https://stackoverflow.com/questions/61529777/redis-pipeline-vs-mget)

  

