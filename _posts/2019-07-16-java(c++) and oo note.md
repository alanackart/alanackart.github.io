---
layout:     	post
title:      	Java Notes and Tips
categories: 	Java
description:   	Java知识点和总结
keywords: 		Java
---

Java知识点和总结(java会是一条不归路吗)

# Java环境搭建

## 可以使用的idea插件

插件无法通过idea直接安装时， 可去[plugins.jetbrains.com](https://plugins.jetbrains.com/)下载到本币后再行安装。

### lombok

#### 引入maven包（引入失败问题）

```xml
<dependency>
  <groupId>org.projectlombok</groupId>
  <artifactId>lombok</artifactId>
  <version>1.16.18</version>
  <scope>provided</scope>
</dependency>
```

哈哈之前一直导入失败， 还以为是自己手动装的lombok插件没装好， 按照[Java效率工具之Lombok](https://juejin.im/post/5b00517cf265da0ba0636d4b)给的dependency（和我原来相比多了版本号， [maven dependency without version](https://stackoverflow.com/questions/29476472/maven-dependency-without-version)）

### alibaba guidelines（alibaba 代码检查）

### free mybaits plugin

## 其他工具

 mybatis逆向生成工具:[Spring-generator]( https://github.com/EliMirren/Spring-generator.git)

## IDEA代码自动提示与补全功能消失

网上很多资料说的是开启了省电模式，但是我的状况是pom.xml文件未被引入maven管理，可以看到文件的图标颜色已经发生了变化

# 浮点数到整数的转换

浮点数到整数的转换是通过舍弃小数得到，而不是四舍五入，例如：

```java
    (int)23.7 == 23;        (int)-45.89f == -45
```

这一点和C的是不同的

# Java的标识符规则

Java的标识符和C的一样都是美元符（$）开始的， 这个C和JAVA我都没记得可以这样用

# Java中的null

- java 中string 和null相加,         

    ```java
     String nstr;  String str1 = "hello" + nstr; String str2 = "world" + null;
    ```

    结果会变成 `hellonull`, `worldnull`
    
- java中判断某个某个`String`对象是否是`null`或者为空字符串， 需要先判断是否为`null`， 顺序不能调换

    ```java
    if(str != null && !str.equals("")){}
    ```

# 重载overload vs. 重写override

- 重载overload（实现不同参数列表的同名方法）
- 重写override(重新实现同名方法的内容， 参数列表，返回值都相同， 仅方法内容即方法体不同)

# Java类的加载顺序

​	java类的加载顺序: **父类static代码块，方法** –> **子类static代码块，方法** –> **父类构造方法**- -> **子类构造方法** 

​	所以java中静态代码块， 方法(static  context)不能使用非静态方法（non static method or Object）

# Spring Bean名称重复ConflictingBeanDefinitionException解决

最近多次遇到过这个问题， 虽然原因已经知晓，但是原理还不是很清楚， 有空再来深入理解下，[Spring Bean名称重复ConflictingBeanDefinitionException解决](https://www.jianshu.com/p/74c801fd70f4)

# 记一次困扰自己3天的序列化偶发问题

入手公司的新架构， 写了个服务，部署到开发测试环境之后， 总是发现客户端调用服务时有遇到序列话问题， `com.esotericsoftware.kryo.KryoException: Encountered unregistered class, Serialization trace:`百度后有看到说是对象太大，于是精简后也还是遇到了相同的状况， 后来请教了同事后发现是自己服务有做过迁移， 老的服务再自己新服务VO对象有改动的情况下没有重新部署过，导致服务在请求到2个新服务的提供者之外的另一服务时就会遇到问题（这里自己要检讨为什么自己不去关注自己的请求在两台机器的log里都没找到）， 同事当时用了命令查看到服务此时有3个提供者而不是两个，用的命令可以参考[zookeeper客户端命令行查看dubbo服务的生产者和消费者](https://blog.csdn.net/alinshen/article/details/79568280)

# System.exit(0)问题

在参考别人的代码时， 也随手学别人写了个`System.exit(0)`， 但是实际上这个会停掉整个进程在使用的虚拟机， 后果很严重😂

# ThreadLocal

ThreadLocal和Synchronized都是为了解决多线程中相同变量的访问冲突问题，不同的点[[ingxin简书ThreadLocal](https://www.jianshu.com/p/3c5d7f09dfbd)

- Synchronized是通过线程等待，牺牲时间来解决访问冲突
- ThreadLocal是通过每个线程单独一份存储空间，牺牲空间来解决冲突，并且相比于Synchronized，ThreadLocal具有线程隔离的效果，只有在线程内才能获取到对应的值，线程外则不能访问到想要的值。

# Readlist

- [为什么函数不能根据返回类型来区分重载？](https://blog.csdn.net/chang384915878/article/details/79535416), 这个自己一直有误解， C++, Java都要注意
- [Java线程同步：synchronized锁住的是代码还是对象](https://blog.csdn.net/xiao__gui/article/details/8188833)
- [JVM系列三:JVM参数设置、分析](https://www.cnblogs.com/redcreen/archive/2011/05/04/2037057.html)

