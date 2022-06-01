---
layout:     	post
title:      	Docker Note
categories: 	[docker]
description:    Docker Note
keywords: 		Docker 
topmost: true 
---

关于docker的一些笔记 update@20220601

# docker daemon

```
sudo dockerd
```

dockerd is the daemon service for docker containers, because it is not running in background we're not able to take any actions related to the service, which needs be restarted.

# Readlist

- [Cannot connect to the Docker daemon at unix:/var/run/docker.sock. Is the docker daemon running?](https://stackoverflow.com/questions/44678725/cannot-connect-to-the-docker-daemon-at-unix-var-run-docker-sock-is-the-docker)
- [Docker’s networking subsystem is pluggable, using drivers. Several drivers exist by default, and provide core networking functionality](https://docs.docker.com/network/)

