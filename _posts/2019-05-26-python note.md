---
layout:     post
title:     python notes and summary
subtitle:   python notes and summary(to be continued)
date:       2019-05-26
author:     Alan
header-img: img/post-bg-plum-blossom.jpg
catalog: true
tags:
    - Python
---
# basic knowledge

- 关于.pyc文件：pyc 文件是python 脚本经编译后的中间文件(byte code, 与机器无关)， 可以由python 命令

  ```
  python -m test.py
  ```

  或者模块 py_compile, compileall而生成

- 生成器(generator)和迭代器(iterator)

  就用法上而言， 生成器generator和list的区别是？

- 关于a, b = b, a+b

  a, b  = b, a+b  实际上是元组tupple的赋值， 等价于(a, b) = (b, a+b)而非a=b, b=a+b(实际上，C, C++, JAVA
都没有这样的赋值)

- python docstring(java docstring, c/cpp  docstring)