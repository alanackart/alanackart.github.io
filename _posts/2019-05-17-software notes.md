---
layout:     	post
title:      	Software Notes and Tips
categories: 	Software
description:   	Note on using software
keywords: 		Software
topmost: true
---

各种奇妙的软件, update@20201014

# Windows

## shortcuts

- task manager: ctr + alt + del
- c:/windows/explore.exe
- C:\Windows\System32\ctfmon.exe      (input method can not switch)
- [gitfor windows](https://gitforwindows.org/index.html) Git BASH

## commands

- netstat -ano  | findstr 5840

## Excel

### 表格复制粘贴

可以将网页上的表格直接复制粘贴到excel中，然后再进行处理，在自己没有掌握网页抓取前，这个方法还是挺好用的。

## must install 

- snipaste
- iqbt unlocker
- typora
- vs code
- tortoisesvn
- notepad++
- wireshark
- snipaste
- vs code : change display language to en
- everything: index & search file
- Vmware WrokStation
- [Balabolka](http://www.cross-plus-a.com/balabolka.htm)： Text-To-Speech (TTS) program

## Vmware WrokStation

### virtual disk

哈哈，自己的这台电脑一直没有成功的装过Ubuntu， 其实啦， 用虚拟机跑也还是挺方便的。今天发现了个问题， 新建guets系统时， 选单文件虚拟disk：扩展磁盘时还是在同一个盘上， 直接resize就可以； 多文件disk: 扩展磁盘后需要使用mount进行挂载。

### vmware tools

哈哈，当新创建的用户无法使用剪切板复制粘贴时可以先尝试重启下虚拟机， 如果不行再重新安装vmware tools. 

### Cannot take ownership of two machines after power failure

First shut down VMware Workstation then go and have a look at the folders where your virtual machines are stored.

It is highly likely that you will see some .lck or .lock files and/or folders. Which ones you will see (lck or lock) depends on the version of your VMware product. 

Delete those files (move them to another folder if you are more comfortable with that) and then go back to VMware Workstation.  

**copy from  [communities.vmware](https://communities.vmware.com/message/1105740#1105740)**

## config for cmder

```
cmder
修改初始目录 init.bat,
::add by fc
@cd /d "D:/releaseFIS"
::add by fc
```

# Linux

## Ubuntu

Ubuntu安装后大约会占6G的空间， 60G磁盘就会占用到10%， 好伤心， 虽然可以在添加新磁盘， 但是只比较适合挂载到新目录上， 其他的操作方式如将新磁盘挂载到旧有的某个目录或者[对原有磁盘进行扩展](https://www.linuxprobe.com/linux-fdisk-size.html)都会带来挺多问题（以后可以折腾下这个）， 但是最好磁盘还是一次就分够😂

# Android

## Apps

- openhub for github
- LDOCE 5(see huawei  drive)

ReadList

- [excel 打开csv中，数值类型超15位后变0](https://blog.csdn.net/q944324153/article/details/82994999)
- [Is there anyway to get TortoiseSVN to leave EOL (line endings) as is?](https://stackoverflow.com/questions/11587806/is-there-anyway-to-get-tortoisesvn-to-leave-eol-line-endings-as-is)



