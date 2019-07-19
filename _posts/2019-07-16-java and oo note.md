---
layout:     	post
title:      	Java and OO(C++) Notes and Tips
categories: 	Java
description:   	Java/C++知识点和总结
keywords: 		Python
---

Java(C++)知识点和总结

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

# C++类的加载顺序

​	

# Readlist

- [为什么函数不能根据返回类型来区分重载？](https://blog.csdn.net/chang384915878/article/details/79535416), 这个自己一直有误解， C++, Java都要注意