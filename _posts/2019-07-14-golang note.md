---
layout:     		post
title:      		   Golang Notes & Tips 
categories: 	      Golang
description:   		Golang学习总结
keywords: 		  Golang, go
topmost: true
---

精通x语言😂，先来看看Go吧

# 开发环境搭建

- 需要安装go1.11以上的版本， [配置好GOPROXY和GO111MODULE](https://my.oschina.net/u/3305368/blog/3044169)后使用国内代理来Import依赖。

- third party tool: 
  - Go autocomplete tool: `go get -u github.com/nsf/gocode`
  - Go debug tool: `go get -u github.com/go-delve/delve/cmd/dlv`

# 总结

- multiline strings： backticks instead of double quotes.

  ```golang
  `line 1
  line 2
  line 3`
  ```

# Readlist



