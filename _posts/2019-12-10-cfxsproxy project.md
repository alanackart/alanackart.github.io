---
layout:     	post
title:      	Words on end of 2019
categories: 	CPP
description:   	12月的随笔
keywords: 		Life

---

写在2019的最后一个月



20190122_pxy_172.19.223.240_8161_RMB_CSTP.ctr 這個是cmdspoxy -> 下游 ...checkmode=2 由cmdsproxy 來記錄

Tom 2019/1/22 15:54:18
20190122_pxy_server_BOTH_CMDSINFO.ctr 這個是上游->cmdsproxy checkmode=1 由下游(cmdsproxy)記錄

Tom 2019/1/22 15:54:54
20190122_server_RMB_IHUB.ctr 這個是上游 -> cmdssvc checkmode=1 由下游(cmdssvc)記錄

 if(chkmode==1) {

   handshake_client(connfd,clientip,datatype,sourcetype,chkmode,searchkey);

 }

下游是kafka的chkmode应该用2， 否则可以用1， 有cfxsproxy自行来管控， 因为我们这个QBOND的下游可能会是kafka，都用2好了

开发思路是:  

##  作为client（client process）

- 连接健哥QB_SRC那边， 接受健哥的qb信息，写到文件里
- 一个QB_NEXT 读取文件，推送给相应的地址QBOND_CHILD
- 一个QB_KAFKA，读取文件，推送到KAFKA

## 作为server(child process)

- 一个QB_CHILD，接受

## 文件名格式

   sprintf(filename,"../data/cfxspxy/inrmbqbond%4d%02d%02d.dat",timep->tm_year+1900,timep->tm_mon+1, timep->tm_mday);