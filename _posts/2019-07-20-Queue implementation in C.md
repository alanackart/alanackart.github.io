---
layout:     	post
title:      	Queue implementation in C
categories: 	C/CPP
description:   	Queue implementation in C
keywords: 		C/CPP, Queue, static
---
Talk is Cheap , Show Me the Code, 队列的C实现

# 背景

在网上看到了个题目在本节的例子中，[生产者和消费者访问链表的顺序是LIFO的，请修改程序，把访问顺序改成FIFO](https://www.kancloud.cn/wizardforcel/linux-c-book/ch35s04.html), 看起来很简单， 自己实际实现的过程中， 还是遇到了些问题， 还是要好好努力写代码才行。

# 实现代码

## queue.h

```c
#ifndef QUEUE_H
#define QUEUE_H
#include <stdio.h>
#include <stdlib.h>
typedef int ELEMENT_TYPE;
struct msg{
    struct msg *next;
    ELEMENT_TYPE data;
};
ELEMENT_TYPE push(ELEMENT_TYPE data);
ELEMENT_TYPE pop();
void show();
#endif
```

## queue.c

```c
#include <stdio.h>

#include <stdlib.h>

#include <errno.h>

#include "queue.h"

#include "log.h"

/*
a queue implementation
 */
extern struct msg * head = NULL;
ELEMENT_TYPE push(ELEMENT_TYPE data) {
    if (head == NULL) {
        LogInfo("head(%p)is null, empty queue\n", head);
    }
    struct msg * tmp = head;
    struct msg * node = (struct msg * ) malloc(sizeof(struct msg));
    if (node == NULL) {
        printf("malloc failed, errno=%d\n", errno);
        exit(-1);
    }
    node - > next = NULL;
    node - > data = data;
    if (head == NULL) {
        head = node;
        return data;
    }

    while (tmp - > next != NULL) {
        tmp = tmp - > next;
    }
    tmp - > next = node;
    return data;
}

ELEMENT_TYPE pop() {
    if (head == NULL) {
        LogInfo("head(%p)is null, empty queue\n", head);
    }
    struct msg * tmp = head;
    ELEMENT_TYPE data;
    if (tmp == NULL) {
        return -1;
    }
    head = head - > next;
    data = tmp - > data;
    printf("address=%p, data=%d poped\n", tmp, data);
    free(tmp);
    return data;
}

void show() {
    struct msg * tmp = head;
    if (tmp == NULL) {
        return;
    }
    while (tmp != NULL) {
        printf("address=%p, data=%d\n", tmp, tmp - > data);
        tmp = tmp - > next;
    }
    return;
}

```

## main.c

```c
#include <stdlib.h>

#include <pthread.h>

#include <stdio.h>

#include <unistd.h>

#include "queue.h"

#include "log.h"

pthread_cond_t has_product = PTHREAD_COND_INITIALIZER;
pthread_mutex_t lock = PTHREAD_MUTEX_INITIALIZER;

struct msg * head;

typedef int ELEMENT_TYPE;

void * consumer(void * p) {
    struct msg * mp;
    struct msg * tmp;
    ELEMENT_TYPE data;
    for (;;) {
        pthread_mutex_lock( & lock);
        while (head == NULL) {
            pthread_cond_wait( & has_product, & lock);
        }
        data = pop();
        pthread_mutex_unlock( & lock);
        printf("Consume %d\n", data);
        sleep(rand() % 5);
    }
}


void * producer(void * p) {
    struct msg * mp;
    int i = 0;
    for (;;) {
        i++;
        printf("Produce %d\n", i);
        pthread_mutex_lock( & lock);
        push(i);
        pthread_mutex_unlock( & lock);
        pthread_cond_signal( & has_product);
        sleep(rand() % 1);
    }
}

int main(int argc, char * argv[]) {
    pthread_t pid, cid;
    LogInfo("head(%p)\n", head);
    push(10);
    LogInfo("head(%p)\n", head);
    srand(time(NULL));
    pthread_create( & pid, NULL, producer, NULL);
    pthread_create( & cid, NULL, consumer, NULL);
    pthread_join(pid, NULL);
    pthread_join(cid, NULL);
    return 0;
}

```

## Makefile

```makefile
all:
        gcc -c link_list.c
        gcc -c test.c
        gcc link_list.o test.o -o main.o -lpthread
```

# 遇到的问题

- 在使用头指针时未给头指针分配内存空间 就将其指向下一个数据节点，这里还是需要注意使用指针时， 一定要判断指针是否为NULL， 使用指针的某一数据成员时， 一定要注意其自身是否有合法的地址（被分配过内存）。
- 犯了一级指针为全局变量分配内存的错误, 实际上下面的`tmp`只是拿到了全局变量~指向的地址，将malloc分配的地址给`tmp`后， `head`还是未指向有效地址。这里错误说明自己对指针的值(指针指向的地址)，指针自身的地址还是不够清楚， 多看看吧。

    ```c
    tmp = head;//head is a global struct pointer 
    /*do malloc for local pointer node*/
    if (tmp == NULL){
         tmp = node;
         return;
     }
    ```

- 在`queue.h`中定义了静态全局变量后， 使用遇到问题， 需要注意静态全局变量作用域只在当前编译单元（比如 include 了该头文件的 .c）中生效， 另外也遇到了在头文件中直接定义发生重复定义(`multiple definition`)报错（最后使用了`extern`）， 可再仔细阅读[C语言：全局变量在多个c文件中公用的方法](https://www.cnblogs.com/wangh0802PositiveANDupward/archive/2012/08/06/2624827.html)， [C++头文件如何正确定义全局变量](https://norcy.github.io/wiki/C++/C++头文件如何正确定义全局变量/)

# 反思

一个简单的任务自己遇到了这么多问题， 自己好好学习了。 其实这些知识点自己都知道， 但是因为缺少变成实践， 掌握的不过牢固，还是多实践吧，多总结 