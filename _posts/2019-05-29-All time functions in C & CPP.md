---
layout:     	post
title:      	C time funtions
categories: 	C/CPP
description:   	C time funtions & it's use
keywords: 		C/CPP, time
---

# 序言

曾经在C的时间处理方面卡了较久， 现在特地来做个总结

# C code snippets：

```cpp
#include        <string.h>
#include        <stdio.h>
#include        <stdlib.h>
#include        <errno.h>
#include        <sys/time.h>
#include        <time.h> /*on linux, this header is also needed*/



int main(){
    struct tm localct ;
    double diff = 0;
    char time_field[100] =  "20190529-22:20:07.227";
    sscanf(time_field, "%04d%02d%02d-%02d:%02d:%02d", &localct.tm_year, &localct.tm_mon, &localct.tm_mday, &localct.tm_hour, &localct.tm_min, &localct.tm_sec);
    fprintf(stderr, "%04d%02d%02d-%02d:%02d:%02d, DST:%d\n", localct.tm_year, localct.tm_mon, localct.tm_mday, localct.tm_hour, localct.tm_min, localct.tm_sec, localct.tm_isdst);
    localct.tm_year = localct.tm_year - 1900;
    localct.tm_mon = localct.tm_mon - 1;
    localct.tm_isdst = -1;
    time_t m_field  = mktime(&localct);
    time_t  now = time(NULL);
    diff = difftime(now, m_field);
    fprintf(stderr, "time diff is %f\n", diff);

  
   time_t rawtime;
   struct tm *info;
   time( &rawtime );
   info = localtime( &rawtime );
   fprintf(stderr, "Current local time and date: %s, DST=%d", asctime(info), info->tm_isdst);

    return 0;
}

```

-  struct tm localct 是结构体(可通过.直接访问成员)， 而struct tm *info 是结构体指针(info需要通过->来访问成员)做函数参数时结构体指针会更有效率

- 需要注意sscanf的使用， 格式化读入字符串， 可节省解析字符串的工作

- **Summer Time Is [Daylight Saving Time](<https://en.wikipedia.org/wiki/Daylight_saving_time>)**, there is a tricky field in struct tm called **tm_isdst**
      It should be 1 (or a positive value), DST is in effect.
      It should be 0, because, as you say, DST is not in effect.
      It should be 0, because DST was not in effect at that time.

- ```
  time_t mktime (struct tm * timeptr); 
  ```

  Convert tm structure to time_t   

- Don't forget to adjust members in struct tm (-1, -1900) etc.  tm_year is relative to 1900 in POSIX-compliant platforms. Don't mess up with unix timestamp, see this [link](https://stackoverflow.com/questions/45355478/why-is-the-tm-year-member-in-struct-tm-relative-to-1900-rather-than-1970-in-c-on)

- **time_t time(time_t \*seconds)** returns the time since the Epoch (00:00:00 UTC, January 1, 1970), measured in seconds. If **seconds** is not NULL, the return value is also stored in variable **seconds**. see on [link](https://www.tutorialspoint.com/c_standard_library/c_function_time.htm).

- **double difftime(time_t time1, time_t time2)**returns the difference of seconds between **time1** and **time2** i.e. **(time1 - time2)**. The two times are specified in calendar time, which represents the time elapsed since the Epoch (00:00:00 on January 1, 1970, Coordinated Universal Time (UTC)). see on this

  [link](https://www.tutorialspoint.com/c_standard_library/c_function_difftime.htm).

- **struct tm \*localtime(const time_t \*timer)** uses the time pointed by **timer** to fill a **tm** structure with the values that represent the corresponding local time. The value of **timer** is broken up into the structure **tm** and expressed in the local time zone. see on this [link](<https://www.tutorialspoint.com/c_standard_library/c_function_localtime.htm>).

  

# time Data Type:

```c
           struct timeval {
               time_t      tv_sec;     /* seconds */
               suseconds_t tv_usec;    /* microseconds */
           };

           struct timezone {
               int tz_minuteswest;     /* minutes west of Greenwich */
               int tz_dsttime;         /* type of DST correction */
           };
		
		  typedef long time_t;
		  
		  struct tm {
               int tm_sec;         /* seconds,  range 0 to 59          */
               int tm_min;         /* minutes, range 0 to 59           */
               int tm_hour;        /* hours, range 0 to 23             */
               int tm_mday;        /* day of the month, range 1 to 31  */
               int tm_mon;         /* month, range 0 to 11             */
               int tm_year;        /* The number of years since 1900   */
               int tm_wday;        /* day of the week, range 0 to 6    */
               int tm_yday;        /* day in the year, range 0 to 365  */
               int tm_isdst;       /* daylight saving time             */	
		};
```

