---
layout:     	post
title:      	MyBatis Source Code Reading
categories: 	[MyBatis, Java, Code Reading]
description:   	MyBatis
keywords: 		MyBatis Source Code Reading
topmost: true
---

MyBatis Source Code Reading， 做一个掌握底层技术的Java程序员！update@20201224

# 零散知识

## SqlSessionFactoryBean

In base MyBatis, the `SqlSessionFactory` is built using `SqlSessionFactoryBuilder`. In MyBatis-Spring, `SqlSessionFactoryBean` is used instead. [read](https://mybatis.org/spring/factorybean.html)

代码片段

```java
    reader = Resources.getResourceAsReader("config/Configure.xml");
    sqlSessionFactory = new SqlSessionFactoryBuilder().build(reader);

    SqlSession session = sqlSessionFactory.openSession();
    IUser userMapper = session.getMapper(IUser.class);
    System.out.println("Test insert start...");
    User user = new User();
    user.setId(0);
    user.setName("Google");
    userMapper.insertUser(user);
    session.commit();
```

## 为什么Mapper没有实现类

动态代理获取到实现类， `IUser userMapper = session.getMapper(IUser.class);`类似这个`UserService proxy = (UserService) Proxy.newProxyInstance(classLoader, interfaces, logHandler);`

# 某司改过的版本

## 为什么没有session.commit()?

# 系统阅读

# Read list:

- [Java 动态代理详解](https://www.cnblogs.com/whirly/p/10154887.html)





