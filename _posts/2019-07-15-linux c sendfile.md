---
layout:     	post
title:      	Linux C Socket sendfile
categories: 	C/CPP
description:   	Linux C Socket sendfile
keywords: 		C/CPP, Socket, sendfile
topmost: true
---
sendfile比send快？

# sendfile 

 看到有文章说`sendfile`会比直接的`read` 和`write`快， 就自己尝试跑了程序对比了下时间，实际结果发现效果是有一些的。但是通过网络搜索， 除了了解了sendfile的原理外， 也发现了`sendfile`的诸多限制(不同版本会有些许不同)， 这些都值得再好好看一下。

# Readlist

- [Linux零拷贝函数SendFile应用](https://my.oschina.net/zidanzzg/blog/813171) 
- [linux的sendfile（）系统调用](http://blog.chinaunix.net/uid-20778583-id-37112.html)
- [Linux kernel 的 sendfile 是如何提高性能的](https://www.vpsee.com/2009/07/linux-sendfile-improve-performance/)
- [C, sendfile() and send() difference?](https://stackoverflow.com/questions/13215656/c-sendfile-and-send-difference)
- [True zero copy writes to a socket in linux](https://groups.google.com/forum/#!topic/mechanical-sympathy/6v1nMuuTd_g), **Be aware, when splicing data from a mmap'ed buffer to a network socket, it is not possible to say when all data has been sent. Even if splice() returns, the network stack may not have sent all data yet. So reusing the buffer may overwrite unsent data.**
- [Zero-Copy in Linux with sendfile() and splice()](https://blog.superpat.com/2010/06/01/zero-copy-in-linux-with-sendfile-and-splice/)
- [linux kernel sendfile](https://yarchive.net/comp/linux/sendfile.html)

# Create file for test

- [How can I populate a file with random data?](https://unix.stackexchange.com/questions/33629/how-can-i-populate-a-file-with-random-data)  

  ```bash
  head -c 1G </dev/urandom >myfile
  ```

- [Quickly create a large file on a Linux system](https://stackoverflow.com/questions/257844/quickly-create-a-large-file-on-a-linux-system)

  ```bash
  fallocate -l 10G gentoo_root.img
  ```

- [Generate File of a certain size?](https://unix.stackexchange.com/questions/101332/generate-file-of-a-certain-size)

  ```bash
  dd if=/dev/zero of=output.dat  bs=1M  count=24
  ```