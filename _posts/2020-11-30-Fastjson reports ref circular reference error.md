---
layout:     	post
title:      	Fastjson reports "$ref" circular reference error
categories: 	Fastjson
description:   	Java知识点和总结
keywords: 		Java, Fastjson
topmost: true
---

Fastjson reports "$ref" circular reference error 发散

# 故事要从bug开始

```java
JSONArray array = new JSONArray();
JSONObject item = new JSONObject();
for (int i = 0; i < 5; i++) {
    item.put("id", i);
    array.set(i, item);
}
System.out.println(JSON.toJSONString(array));
```

# 解决方法

在循环开始处new JSONObjec或者item.clone， 我从网上也找到了

```java
JSON.toJSONString(list, SerializerFeature.DisableCircularReferenceDetact); 
//Means to disable ref duplicate reference
```

但我本意并不上要重复使用一个对象。哈哈

# Readlist

-  [Java clone – deep and shallow copy – copy constructors](https://howtodoinjava.com/java/cloning/a-guide-to-object-cloning-in-java/)
- [Object class in Java](https://www.javatpoint.com/object-class)

