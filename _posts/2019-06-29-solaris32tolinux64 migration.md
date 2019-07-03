---
layout:     	post
title:      	Solaris to Linux migration
categories: 	Linux
description:   	服务端程序32位Solaris迁移到64位Linux的总结 
keywords: 		Linux， Migration
---
迟到的程序移植总结

# 迁移说明   

迁移周期可能较长，为了维护尽量少的代码与方便追朔， 需要做相容处理。具体处理是， Makefile可以不同(使用[include命令](https://www.cnblogs.com/cuckoos/articles/5049984.html))， 代码可以使用中用宏定义( -D 引入)以使得可以对不同平台进行[条件编译](https://blog.csdn.net/zz460833359/article/details/51335333)。

# 注意事项

- solaris 与linux库的差异， 如`-lposix4 -lsocket -liconv`已可被libc来取代
- solaris 与linux shell命令或命令选项的差异， 如grep
- 环境的不同(某些路径)，  需要使用不同的环境变量
- ipc文件路径(linux下为/dev/mqueue, /dev, )命名, 大小分配方式不同
- 数据类型， 指针大小， 宏(FD_SETSIZE等系统设定)， 可参考[指南](https://www.ibm.com/developerworks/cn/linux/l-solar/index.html#artrelatedtopics)或使用程序输出来查看
- linux平台上可以使用-m32/-m64编译程序为32位或者64位，若报错可以使用`sudo apt-get install gcc-multilib`安装32位版本的库

# 迁移细则

- 隐式声明:

  - Implicit function declaration: assuming extern returning int， 返回类型被假定成int， 在实际返回类型比int更长， 如long或者指针可能导致溢出截断而发生错误。[隐式声明已从C99中移除](https://stackoverflow.com/questions/17937909/implicit-function-declarations-sometimes-work-in-c)。若以C99模式编译， 则直接会编译错误。

  - 由于隐式声明和编译报错原因， 使用到`time.h`中的function的代码需要引入`time.h`(原因需要追查下)

- sys_errlist

   sys_errlist is deprecated, use ‘strerror’ or ‘strerror_r’ instead. 但是根据[nginx](http://nginx.org/en/docs/sys_errlist.html) 上的解释strerror() and strerror_r() functions are not Async-Signal-Safe， 需要注意

- SHELL命令差异

   不同平台上命令的options 可能不同：   ls –E  *. *  -> ls --full-time * .*

- size_t 类型

  在32位系统(4 byte,与unsigned in相同)和64位系统(与unsigned long long相同)的大小不同， 所以sizeof(something)最好存放在size_t类型中， 否则迁移到64位系统上如由int 等类型指针转换到size_t类型指针时， 会因为int等类型和size_t类型大小不同，多取了后面的4个字节而运行结果不确定，从而发生错误， 

  ```c
  #include <stdio.h>
  
  int main() {
      int n;
      char str[128];
      n = sizeof(str);
      size_t * s = (size_t *) &n;
      printf("sizeof int = %zd, sizeof size_t = %zd\n", sizeof(int), sizeof(size_t) );
      printf("n=%d, s=%zd, add of n=%p, add of s=%p\n", n, *s, &n, s);
      return 0;
  }
  //gcc  -m32 size_t_test.c 
  //gcc  -m64 size_t_test.c 
  ```

  

# 参考资料

- [从 Solaris 迁移到 x86 上的 Linux 指南](https://www.ibm.com/developerworks/cn/linux/l-solar/index.html)
- [64位平台编译常见问题汇总（个人移植问题仅供参考）](https://blog.csdn.net/sjin_1314/article/details/8537528)

