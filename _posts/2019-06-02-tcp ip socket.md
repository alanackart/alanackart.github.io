---
layout:     	post
title:      	Computer Networks & Socket Programming
categories: 	TCP/IP
description:   	Computer Networks(TCP/IP) & Socket Programming()
keywords: 		network, TCP/IP
---
网络知识的总结， Socket编程经验

TCP协议的特点

TCP提供可靠的交付服务， 保证传输的数据无差错(数据校验， 参考[TCP新手误区--数据校验的意义](https://blog.csdn.net/bjrxyz/article/details/75194716))，不丢失（确认和重传），不重复（序号）， 有序（序号）

# network device

- 网闸(GAP)： 物理上做到了两端不同时连接， [阅读](http://expert.51cto.com/art/200804/71720.htm)
- 网关(Gateway):  网络的出口地址， 实现不同网络之间的通信
- 交换机(Switch): 工作在**数据链路层**， 识别MAC地址，实现网络内部的通信
- 网桥(Bridge)：是早期的两端口**数据链路层**网络设备
- 路由器（Router）：工作在**网络层**，是用于连接多个逻辑上分开的网络（相似网络）

  [集线器、网桥、交换机、路由器、网关大解析](https://www.tianmaying.com/tutorial/NetWorkInstrument)

# Socket, Server, Client通信建立（函数调用）过程

## server

​	server端因为既需要处理已存在的连接，又需要处理可能存在的新连接请求，所以相对client来说较为复杂， [示例代码地址](https://www.gnu.org/software/libc/manual/html_node/Server-Example.html)

- 使用`socket`创建1个套接字sock
- 使用`bind`将`sock`绑定到某个地址上
- 使用`FD_SET`将监听套接字`sock`加入已连接套接字集合`active_fd_set` 中
- 使用select 侦测`active_fd_set`中是否收到数据请求
- 使用`FD_ISSET`处理是已连接套接字`active_fd_set`中的， 使用套接字做下一步判断
  - 获取到的套接字不是监听套接字(已有连接)：正常通信， `read`/`write`
  - 获取到的套接字是监听套接字（新连接）： 
    - 调用`accept`接收请求， 得到新的已连接套接字`new`
    - 将新的已连接套接字`new`加入已连接套接字集合`active_fd_set` 中

## client

client端的处理比较简单，过程如下

- 使用socket创建连接套接字`sock`
- 使用`connect`向服务器发起连接请求， 连接成功后即可正常通信 `read`/`write`



# ReadList

- O_NONBLOCK vs. O_NDELAY for non-blocking sockets, 程序移植性, read [page](https://mail.python.org/pipermail/python-list/1999-May/013687.html)
- fcntl()根据文件描述词来操作文件的特性， read [page](https://www.cnblogs.com/lonelycatcher/archive/2011/12/22/2297349.html)
- [大话 Select、Poll、Epoll](https://cloud.tencent.com/developer/article/1005481)
- socket睡眠队列上的排他节点，read [Socket层实现系列 — 睡眠驱动的同步等待](https://blog.csdn.net/zhangskd/article/details/45770323), [[Linux网络编程“惊群”问题总结](https://www.cnblogs.com/Anker/p/7071849.html)
- [TCP新手误区--粘包的处理](https://blog.csdn.net/bjrxyz/article/details/73351248)
- [TCP新手误区--心跳的意义](https://blog.csdn.net/bjrxyz/article/details/71076442)


