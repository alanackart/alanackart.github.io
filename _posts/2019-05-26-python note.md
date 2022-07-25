---
layout:     	post
title:      	Python Notes and Tips
categories: 	Python
description:   	Python知识点和总结
keywords: 		Python
topmost: true
---

Python知识点和总结（update@20220722）

# pip使用国内源

创建$HOME/pip/pip.conf文件， 写入一下内容

```
[global]
index-url = https://pypi.tuna.tsinghua.edu.cn/simple
[install]
trusted-host=https://pypi.tuna.tsinghua.edu.cn
```

# 关于.pyc文件

pyc 文件是python 脚本经编译后的中间文件(byte code, 与机器无关)， 可以由python 命令

```
python -m test.py
```

或者模块 `py_compile` compileall而生成

# 生成器(generator)和迭代器(iterator)

就用法上而言， 生成器generator和list的区别是？

# 关于a, b = b, a+b

a, b  = b, a+b  实际上是元组tupple的赋值， 等价于(a, b) = (b, a+b)而非a=b, b=a+b(实际上，C, C++, JAVA
都没有这样的赋值)

# 关于__slots__

The special attribute [`__slots__`](https://docs.python.org/3/reference/datamodel.html#slots) allows you to explicitly state which instance attributes you expect your object instances to have, with the expected results:

1. **faster** attribute access.
2. **space savings** in memory.

# global关键字的作用

The basic rules for `global` keyword in Python are:

- When we create a variable inside a function, it is local by default.
- When we define a variable outside of a function, it is global by default. You don't have to use `global` keyword.
- We use `global` keyword to read and write a global variable inside a function.
- Use of `global` keyword outside a function has no effect.

# python multiline comment

```python
'''
This is a multiline
comment.
'''
```

# python multiline string

```python
"""line 1
line 2
line 3"""
```

# Built-in Class Attributes

| Attribute    | Description                                                  |
| :----------- | :----------------------------------------------------------- |
| `__dict__`   | This is a dictionary holding the class namespace.            |
| `__doc__`    | This gives us the class documentation if documentation is present. `None` otherwise. |
| `__name__`   | This gives us the class name.                                |
| `__module__` | This gives us the name of the module in which the class is defined. In an interactive mode it will give us `__main__`. |
| `__bases__`  | A possibly empty tuple containing the base classes in the order of their occurrence. |

# Built-in Functions



# Built-in Data Types

| Text Type:      | `str`                              |
| --------------- | ---------------------------------- |
| Numeric Types:  | `int`, `float`, `complex`          |
| Sequence Types: | `list`, `tuple`, `range`           |
| Mapping Type:   | `dict`                             |
| Set Types:      | `set`, `frozenset`                 |
| Boolean Type:   | `bool`                             |
| Binary Types:   | `bytes`, `bytearray`, `memoryview` |

# Problems

- Python如何使用C/C++代码

# Read

1.   [Primer on Python Decorators](https://realpython.com/primer-on-python-decorators/)
2. [`typing`— Support for type hints](https://docs.python.org/3/library/typing.html#module-typing) 
2. [When to use yield instead of return in Python?](https://www.geeksforgeeks.org/use-yield-keyword-instead-return-keyword-python/)
4.   [How to escape special characters of a string with single backslashes](https://stackoverflow.com/questions/18935754/how-to-escape-special-characters-of-a-string-with-single-backslashes)
5.   [Private Variables](https://docs.python.org/3.6/tutorial/classes.html#private-variables)
6.   [Python type() Function. 1 or 3 arguments](https://www.learnbyexample.org/python-type-function/)
7.   [Python Generators](https://www.scaler.com/topics/python/python-generators/)

