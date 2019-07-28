---
layout:     		post
title:      		   MySQL notes & tips 
categories: 	      MySQL
description:   		MySQL与ORACLE的区别及其他总结
keywords: 		  MySQL, SQL
---

MySQL: 从删除到跑路

# 从删除到跑路

​		事故的原因是部署在客户的落地服务器在解析同步文件时， 在本应该是债券代码的地方遇到了乱码而产生的通配符， 结果就delete全部的业务所依赖的债券信息表，因为是落地部署在客户， 所以数据恢复相当麻烦。 讲这个自己知道的事故就是为了特别提醒自己。

# 数据库基础设置



# 基础知识

## libf

libf是library function的缩写



# Readlist

- [Oracle and MySQL Compared](https://docs.oracle.com/cd/E39885_01/doc.40/e18461/oracle_mysql_compared.htm#RPTMS114)
- [MySQL show current connection info](https://stackoverflow.com/questions/3613704/mysql-show-current-connection-info)：`select user();`
- [MySQL List Users – How to List MySQL User Accounts via command line?](https://www.fastwebhost.in/blog/mysql-list-users-how-to-list-mysql-user-accounts-via-command-line/) `SELECT User FROM mysql.user;`

