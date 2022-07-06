---
layout:     		post
title:      		   MySQL notes & tips 
categories: 	      Database
description:   		MySQL与ORACLE的区别及其他总结
keywords: 		  MySQL, SQL
topmost: true
---

MySQL从删除到跑路, update@20220705

## 从删除到跑路

​		事故的原因是部署在客户的落地服务器在解析同步文件时， 在本应该是债券代码的地方遇到了乱码而产生的通配符， 结果就delete全部的业务所依赖的债券信息表，因为是落地部署在客户， 所以数据恢复相当麻烦。 讲这个自己知道的事故就是为了特别提醒自己。

## 谈谈执行计划

今天在用mybaits做一个查询时， 一直查不到结果， 后来一位同事告诉我说是因为我没有对char型字段没有填充到相同长度， 而我的解决方案就只是对某个条件字段先trim了下（[mybatis 使用oracle char 字段查询返回结果总是null](http://www.voidcn.com/article/p-blqnkdow-qg.html)）， 这位同事这个时候告诉我说， 这个字段刚好是索引字段之一， 这样处理会是索引失效会十分影响查询效能，我当时还不以为然（没觉得损失了多大的性能）， 结果在pl/sql里使用了F5查看了不同情况下的执行计划后发现， 使用索引和不适用索引cost**竟然相差20倍**。哈哈， 还是要多使用索引， 多关注执行计划啦（其实一年前听讲座时就知道执行计划， 不过一直太忙又觉得高大上一直没尝试去看过😂）

## 数据库基础设置

### 用户登陆

 mysql -u root -p12345678



## 基础知识

### libf

libf是library function的缩写

## Oracle与MySql的区别

### 对象的大小写

Oracle 使用双引号对列进行重命名， 默认情况下对象（列）的名称都是大写； MySql使用单引号对列进行重命名

## 待解决问题

### TIMESTAMP类型如何有更高的精度？

目前`fis.key_logger`的time域只能存储类似此精度`2019-08-14 05:39:38`的， 按照[Timestamp with a millisecond precision: How to save them in MySQL](https://stackoverflow.com/questions/26299149/timestamp-with-a-millisecond-precision-how-to-save-them-in-mysql)操作后， 发现并没有效果， 需要再进行处理。

## mysql查询正在执行的sql:

`SHOW FULL PROCESSLIST;`
`SELECT * FROM INFORMATION_SCHEMA.PROCESSLIST WHERE COMMAND != 'Sleep' AND TIME >= 5;`

## Readlist

- [Oracle and MySQL Compared](https://docs.oracle.com/cd/E39885_01/doc.40/e18461/oracle_mysql_compared.htm#RPTMS114)
- [MySQL show current connection info](https://stackoverflow.com/questions/3613704/mysql-show-current-connection-info)：`select user();`
- [MySQL List Users – How to List MySQL User Accounts via command line?](https://www.fastwebhost.in/blog/mysql-list-users-how-to-list-mysql-user-accounts-via-command-line/) `SELECT User FROM mysql.user;`
- [Obtaining Execution Plan Information](https://dev.mysql.com/doc/refman/5.5/en/explain.html)
- [MySQL索引原理一 索引类型](https://segmentfault.com/a/1190000039713841)
- [UNIQUE VS DISTINCT](https://stackoverflow.com/questions/336268/difference-between-select-unique-and-select-distinct)

