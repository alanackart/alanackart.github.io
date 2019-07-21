---
layout:     	post
title:      	Linux command
categories: 	Linux
description:   	frequently used Linux command， cheat sheet
keywords: 		Linux, Shell
---

常用的一些linux命令和操作

# shell(file i/o)

- bash 

- chsh # can not change defaut shell, it should be set in config file, search it later

- io redirects

- `./start_service.sh 2>&1 |tee prog.log`, output to terminal & file, ( `2>&1` redirct both stderr & stdout)

- ​	`1>` file redirects stdout to file

- ​	`2>` file redirects stderr to file

- less + G file.txt

- `tail -400f ws.log | grep 'token'`

- shell脚本语法正常，但source失败， 可以考虑切换下SHELL试试

- shell multiline comment

  ```sh
  : '
  This is a
  very neat comment
  in bash
  '
  ```

# file command

- ls -altr

- ls -d */

- ls -l --block-size=M

- ls -lh

- ls .* (Be careful with hidden files o use `ls -al | grep 'pattern'` instead

- rm !(files_do_no_want_to_delete_delete)

- chown fis test.txt

- chgrp fefms test.txt

- sudo chown -R admin:admin .* [Recursive chown starting with the directory above current directory](https://askubuntu.com/questions/631534/recursive-chown-starting-with-the-directory-above-current-directory) 

  this happend to solve the problem of loggin hang after mirgrate to a new drive

- du -h .

- df -k

- cp -rp source destination/

- mkdir -p /home/fis

- ls | grep pattern | sed -e 's/^/prefix/' -e 's/$/suffix/'

- `mount --bind /media/tc1/folder /home/dvad/home` [How do I mount a folder from another partition?](https://askubuntu.com/questions/205841/how-do-i-mount-a-folder-from-another-partition)

  [How to mount a new drive on startup](https://askubuntu.com/questions/154180/how-to-mount-a-new-drive-on-startup)

- `tree` to print the directory tree in terminal

# grep 

- grep -rn . -e 'pattern'(不要使用-w选项)
- `grep -o 'needle' file | wc -l`
- `grep -roh 'needle' file | wc -w`
- grep --exclude=*log* -rn . -e '-DSUN'
- grep -rw . -e 'fis' | awk '{print $1}' | sort | uniq -u

# awk(需要注awk, nawk处理上的大小限制)

- `awk '{print NR-1, "," length}' inrmbcnex20190306.dat | sort -k2, -k1`   (sort 是否奏效再看一下)
- awk 'length < 10 {print NR-1, ",", length}' 20190308_cnex.dat
- nawk 'c-->0;$0~s{if(b)for(c=b+1;c>1;c--)print r[(NR-c+1)%b];print;c=a}b{r[NR%b]=$0}' b=2 a=4 s="string" file1 #输出匹配行的前a后b行


# sed

- sed "s/foo/bar/g" testfile > testchangedfile
- sed "s/foo/bar/2g" inputfile > outputfile [(http://write.flossmanuals.net/linea-de-comando/sed/)]()


# vim 

- vim, :%s/foo/bar/g

- vim: hjkl, arrow

- vim: :set nu, to show line number

- vim: / forward to search, ? backward search

- vim: :g/^$/d, remove empty line

- 5dd, 7yy

- do not use vi, vi can be awlful with large files, use more

- ```shell
  :w !sudo tee %
  ```

- copy and paste :

  - Place the cursor on the line you want to begin cutting.
  - Press V to select the entire line, or v to select from where your cursor is.
  - Move the cursor to the end of what you want to cut, using h,j,k, or l
  - Press y to copy it, or d to cut it.
  - Place the cursor where you would like to paste your copied stuff.
  - Press P to paste it before your cursor, or p to paste it after the cursor.

# zip & unzip

- tar -C /myfolder -xvf yourfile.tar
- zip -r myfiles.zip mydir
- unzip xxx -d xxx
- gunzip file.gz
- tar xvzf file.tar.gz -C /path/to/somedirectory


# find & locate files

- `find . -name '' | grep '' | grep -v 'Permission'`
- find . -name '*dir_file' -print
- find . -name "*.bak" -type f -delete
- find $PWD -type f -iname "*.sh" -exec chmod +x {} \;
- sudo updatedb, locate settings.xml
- which, whereis


# remote access

- scp (-r) file user@192.168.9.2:/home/xms/
- scp -P 22010 user@
- `echo 'Some Text' | ssh user@remotehost`  
- scp -oPort=22 user@


# network

- ifconfig -a, ip address
- `netstat -an | grep port`
- ssh cms@127.0.0.1 bin/bc_trade_to_users  #有时间了解下ssh的授信机制
- user ping and telnet ip port, tracert 198.13.32.250
- `netstat -n | awk '{print $7}' | sort | uniq -c | awk '{ print $2, $1 }' | awk '{ if ($2 >= 1 ) print $1, $2 }'` #统计网络状态
- lsof -i :80 (check which process listening on 80 port)
- `lsof -c program_name`(List opened files based on process names )
- netstat -peanut | grep ":8000 "
- exit telnet, try `Ctrl ]`

# process

- `ps -ef | grep ''`

- `pkill -f 'process_name'`

- `ps -ef | grep fis | grep -v ssh| awk '{print $2}' | xargs kill -9` 

- `ps -ef | grep fis | grep -v ssh | awk '{print $2 " " $3}'` 

- kill -9 pid

- `fuser -k /some/file, lsof -t /some/file | xargs kill`

- top

- pstree

- pfiles pid

- pmap pid

- set process priority, nice, see [link](https://www.tecmint.com/set-linux-process-priority-using-nice-and-renice-commands/)

- get process running time, can be used to monitor abnormal process(一次system fork出的进程卡住，导致端口被占用bind失败的问题)

  `ps -o etime= -p "1396" | awk -F: '{ print ($1 * 3600) + ($2 * 60) + $3 }'` 

# C & CPP 

- make -f makefilename 
- ldd xxx: list program or library's dependency
- file core*; gdb binary core; bt
- pstack pid, gstack pid
- gcc -o prom prom.c
- ipcs, ipcrm
- strings /lib64/libstdc++.so.6 | grep GLIBCXX
- env | grep '^LD_LIBRARY_PATH'
- nm -a
- file 
- enable core dump: ulimit -c unlimited

# system command

- crontab -e, crontab -l  #crontab  verfiy user password, caution about password  expiration
- cat /proc/meminfo
- cat /proc/cpuinfo



# svn and git

- svn: better to check out with my own's id, so it does not need id when commiting, --username USER --password PASS
- svn status | grep ^?
- svn list
- `find . -name '*.o' | xargs svn delete --force`
- `svn st | grep ^D | awk '{print $2}' |xargs svn commit -m "remove files"` 
- handle conflict: remove local file and svn update
- **在windows环境使用svn client提交时，本地新建的空目录通过svn add 不能提交成功**

# redis

- nohup redis-server &
- redis: getset return old value
- SENTINEL get-master-addr-by-name mymaster
   ./redis-cli -h 172.19.223.70  -p 8030
   info, monitor

# kafka

- partition的创建

  ```shell
  ./kafka-topics.sh --create --zookeeper 19.31.18.73:8032 --topic EventTopic1 --partitions 1 --replication-factor 3
  ./kafka-topics.sh --describe --zookeeper 19.31.10.73:8032 --topic EventTopic1
  ./kafka-topics.sh --delete --zookeeper 19.31.10.73:8032 --topic EventTopic1
  ```

- kafka消息发送

  ```shell
  ./kafka-console-producer.sh --broker-list 172.19.23.70:9035 --topic  SystemEvent
  {"name":"ReconciliationDataCacheStart","time":1515631359736,"props":{"StartBy":"System","StartupTime":30000},"extend":"Powered by System","source":"System"}
  ```

  ```
  ./kafka-console-producer.sh --broker-list localhost:9035 --topic "TopicA" < message.txt
  ```

- 查询消费者是否消费此消息

  ```shell
  ./kafka-console-consumer.sh --bootstrap-server 127.0.0.1:9092 --topic  mm_topic --from-beginning
  ```

- 修改parttiton的数目时可用：

  ```shell
  ./kafka-topics.sh --zookeeper 127.0.01:8032 --alter --topic  EventNew --partitions 1 #(只能增加)
  ```

  若删除， 新增不行(消费者进程未停止全)， 可以考虑停掉kafka, 将默认parttition数设为1, 再重开kafka， 停掉后新建会报(: Replication factor: 1 larger than available brokers: 0, 没有检测到ON的kafka)

- list all topics

  ```shell
  ./kafka-topics.sh --list --zookeeper localhost:2181
  ```

  

# ubuntu

- sudo passwd root (set password for root, for ubunutu)
- sudo timedatectl set-timezone Asia/Shanghai(for ubuntu)
- install ssh server(for ubuntu)
- apt-cache search keyword(for ubuntu)
- lsb_release -a
- sudo dpkg -i code_21212_amd64.deb
- sudo dpkg -r code

# python

- python-3.6 -m pip install fish

- python -m py_compile script.py #  check the syntax of Python script without executing it (do not ever expect this command can check more than verify the syntax)


# time & date

- `date -d @1558449691.73529` #timestamp to date, output: Tue May 21 22:41:31 CST 2019

- convert `00:20:40.28` (HH:MM:SS) to seconds 

  `echo "00:20:40.25" | awk -F: '{ print ($1 * 3600) + ($2 * 60) + $3 }'`

# Further Reading

- [What's the difference between nohup and ampersand](https://stackoverflow.com/questions/15595374/whats-the-difference-between-nohup-and-ampersand)

