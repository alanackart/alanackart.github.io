---
layout:     		post
title:      		   Oracle notes & tips 
categories: 	      Database
description:   		Oracle, PL/SQL 编程笔记与总结
keywords: 		  Oracle, SQL
---

oracle 数据库及其相关支持是真的强大(last update: 20200907)

# oracle basic command & functions


- **sqlldr**, load other data source into oracle

- PL:SQL Developer:  Sometimes it can be very awlful to use ORACLE_SID, the connection can also be set in 172.17.217.13:1521/fefmsdb

- **describe** 

- oracle string functions: **substr**, **instr**

- ORACLE special tables: **user_tables**

- WMSYS.WM_CONCAT 拼接查询结果,是一个聚集函数

- ORA-01480: STR 绑定值的结尾 Null 字符缺失, 可能是字符串长度过长， 去掉tag之间可能存在的多余空格， 去掉对debug没有帮助的串

- SQL%ROWCOUNT 检查最上一次的update, insert影响条数，

- query dependencies  

   ```sql
   select * from all_dependencies t where t.REFERENCED_NAME = upper('CMDS_04_QUOTE_S_M');
   ```

# look up some text in all source code 

```sql
select * from user_source where upper(text) like upper('%CMDS_PR_CLOSE%'); 
```

# output sql result into file

```sql
--tmp.sql
 spool myoutputfile.txt
 select * from users;
spool off;
```

```shell
sqlplus -s username/password@sid @tmp.sql > output.txt
```

# display full content of clob column in sqlplus

see [How do I display the full content of LOB column in Oracle SQL*Plus?](https://stackoverflow.com/questions/122772/how-do-i-display-the-full-content-of-lob-column-in-oracle-sqlplus)

```
 SQL> set long 30000
 SQL> show long
   long 30000
  SQL> set longchunksize 30000
```


# Oracle 表锁查询及解决

使用以下sql用sysdba登陆并在sqlplus中执行即可(ssh oracle@172.19.223.225； sqlplus / as sysdba)

```sql
select b.owner,b.object_name,a.locked_mode, 'ALTER SYSTEM KILL SESSION '''      || t.sid      || ','      || t.serial#      || ''' IMMEDIATE;'
from v$locked_object a,dba_objects b,  v$session t
where b.object_id = a.object_id
and b.OWNER = 'FIS'
and b.OBJECT_NAME in ('IMS_SECURITY_SOR_INFO')
and a.SESSION_ID = t.SID;
```

# Oracle 存储过程/package卡住解决

使用以下sql用sysdba登陆并在sqlplus中执行即可(ssh oracle@172.19.223.225； sqlplus / as sysdba)

```sql
SELECT    'ALTER SYSTEM KILL SESSION '''      || s.sid      || ','      || s.serial#      || ''' IMMEDIATE;'  FROM V$SESSION s WHERE SID 
in(select SID from V$ACCESS WHERE object = 'MQ_QUOTE');
```

备注：查询时间太久了，可以查正在运行的sql进行解决

# oracle 查看当前正在运行的sql

```sql
 select t.sql_id, t.TERMINAL, t.PROGRAM, 'ALTER SYSTEM KILL SESSION '''  || t.sid  || ','  || t.serial#  || ''' IMMEDIATE;',
  v.SQL_TEXT, t.* from v$session t, v$sqlarea v 
 where t.username='FIS' 
  and v.SQL_ID = t.SQL_ID
-- and t.TERMINAL ='machine_name'
-- and  t.program like 'program possible running%';
```

# pl/sql developer 调试代码

step in 和step over表现相同， 无法进入代码的解决方案是右键， 选中 [**add debug information**]

oracle 按规则解析xml字符串

```sql
select *  FROM XMLTABLE( '/Page/STRATEGY_LIST/STRATEGY'           PASSING               xmltype(  to_clob('                <Page><CUS_NUMBER>856</CUS_NUMBER><STRATEGY_LIST><STRATEGY><STRATEGY_ID>L_01_01_01</STRATEGY_ID><SEQ>1</SEQ><IS_USE>Y</IS_USE></STRATEGY><STRATEGY><STRATEGY_ID>L_01_01_02</STRATEGY_ID><SEQ>2</SEQ><IS_USE>Y</IS_USE></STRATEGY></STRATEGY_LIST></Page>            ') )         COLUMNS                          STRATEGY_ID  varchar2(20)    PATH './STRATEGY_ID',              SEQ varchar2(20)    PATH './SEQ',              IS_USE  varchar2(20)    PATH './IS_USE'     ) xmlt  ;  
```



# Oracle In 语句的参数个数限制

Oracle 关于where语句中IN(1,2,3,4,...,1001,1002,...)不能超过1000的解决办法: 将参数通过dual查询出来；拆分为多个in语句, 参考[Oracle中的in参数的个数限制](https://blog.csdn.net/zhixinhuacom/article/details/31440899)

# select into 异常的处理

参见https://blog.csdn.net/u012820258/article/details/51434513?utm_source=blogxgwz4， 异常， 游标， 聚合函数（SELECT nvl(MAX(SORT),0) as sort FROM web_d_info)

# ORACLE decode函数 

decode(条件,值1,返回值1,值2,返回值2,...值n,返回值n,缺省值)

# Oracle字符统计

select name,LENGTH(REGEXP_REPLACE(name,'[a-zA-Z]','')) as num_count,LENGTH(REGEXP_REPLACE(name,'[0-9]','')) as char_countfrom test6;

Count the Upper and lower case letters. https://community.oracle.com/thread/2498568

# Oracle中的聚合函数

 Count,Max,Min,Avg,Sum,Variance,Stddev统计函数总会返回结果

# Oracle dbms_output

```sql
set serveroutput on;/*comment this line in sql mode, this line works in command mode & sqlplus */
begin
   dbms_output.put('a'); --写入buffer但不输出
   dbms_output.put('b'); --写入buffer但不输出
   dbms_output.new_line; --回车(换行)，输出                              
   dbms_output.put_line('hello world!'); --输出并换行 
   dbms_output.put('d'); --写入buffer但不输出 
   dbms_output.put_line(get_serial_no_date('TEST'));
end;                                                     
/ 
```



# 为原本的主键添加新的一个含null的列

主键中包含的列为空时， 可以先给为空的列一个default value, 无需删除所有数据

- # NULL值的判断

    ```sql
    declare
      -- Local variables here
      n number;
    begin
      -- Test statements here
      n := NULL;
      if(n > 0) then
      dbms_output.put_line( 'n > 0' );
      else
     dbms_output.put_line( 'others' );
      end if;
       if(n <= 0) then
      dbms_output.put_line( 'others' );
      else
     dbms_output.put_line( 'n > 0' );
      end if;
    end;
    ```

输入为NULL时，上面两个过程中的判断的结果都是一样的，不管是NULL >= 0还是NULL < 0结果都是未知，所以两个判断的结果都是NULL。最终，在屏幕上输出的都是ELSE后面跟的输出值。
由于NULL所具有的特殊性，在处理数据库相关问题时应该对NULL的情况额外考虑，否则很容易造成错误。

# 常用DML sql

## Copy all columns from one table to another table

```sql
INSERT INTO  table2  SELECT  *  FROM  table1  WHERE  condition;
```

## 插入1条rowtype

v_record X_table%ROWTYPE; insert into X_table values v_record;

# 常用DDL sql

```sql
INSERT INTO table2 (column1, column2, column3, ...)
SELECT column1, column2, column3, ...
FROM table1
WHERE condition;
```

## 禁用主键

ALTER TABLE table_name
DISABLE CONSTRAINT constraint_name;

## create index

```sql
create index CUS_STRATEGY_CONDITON_LIST_idx on CUS_STRATEGY_CONDITON_LIST(SEQ,CUS_STRATEGY_ID, CUS_NUMBER, DEALER_NUMBER);
```

## comment on table and column

```sql
comment on table CUS_STRATEGY_CONDITON_LIST
  is '条件表';
comment on column CUS_STRATEGY_CONDITON_LIST.SEQ
  is '条件的唯一序列编号';
```

## drop primary key and unique constraint 

```sql
alter table CSTP_04_LF_GRP drop constraint  PK_CSTP_04_LF_GRP;

alter table CSTP_04_LF_GRP add constraint PK_CSTP_04_LF_GRP primary key (CUS_NUMBER, MODIFY_USER, GRP_ID);
```

- # group by having

  ```sql
  SELECT
      order_id,
      SUM( unit_price * quantity ) order_value
  FROM
      order_items
  GROUP BY
      order_id
  ORDER BY
      order_value DESC;
  ```

- Oracle **rownum** with  **order by** may be interpreted differently on several platforms, avoid use it. 

- oracle [convert negative and comma separated values to numbers ](https://stackoverflow.com/questions/44625456/how-to-convert-negative-and-comma-separated-values-to-numbers-oracle)

  感概：前后台通信协议不仅要规定好tag名称， 数值类型， 也要注意数值的取值范围， 传递方式(数值中带不带, 有无小数点等）越详细越好， 才能做好隔离

# union & join

- oracle union can remove duplicate rows(if do not want this, union all should be used)

- [oracle union caluse: what happens if there is a column name mismatch](https://stackoverflow.com/questions/5170228/oracle-union-caluse-what-happens-if-there-is-a-column-name-mismatch), So long as the column data types are not mismatched, the column names will always come from the first query. It shouldn't (and, as you've found, doesn't) throw an error.

- difference between union and join, run the sql bellow to see the difference

  ```sql
  selec t 1 from dual union select 2 from dual
  select * from ( (select 1 from dual) s join  (select 2 from dual) t on 1=1)
  ```

# ORACLE calculate time differnence

- if the data type was char

  - see this, [Calculating difference between two timestamps in Oracle in milliseconds](https://stackoverflow.com/questions/11617962/calculating-difference-between-two-timestamps-in-oracle-in-milliseconds)

    ```sql
    select
          (extract( hour from diff )*60*60 +
          extract( minute from diff )*60 + 
           extract( second  from diff ) ) "DIFF_SECS"
      from (select systimestamp - to_timestamp( to_char(sysdate,'yyyy/mm/dd ') || '19:32:21', 'yyyy/mm/dd hh24-mi-ss' ) diff 
            from dual)
    ```

    

  - actually, a more easy way to do this is 

    ```sql
    select (sysdate -  to_date(trim(t.send_time), 'YYYYMMDD HH24:MI:SS'))  from cstp_04_quote_s_m t
    ```

- if the data type was `DATE`

  ```sql
  select  (sysdate -  t.modify_time)* 24*3600 from table_test t;
  ```

  

# query table info

- use `user_col_comments`, `user_tab_columns` to query full info of a table

  ```sql
  select tc.column_name as "字段"
  ,      tc.data_type || case when tc.data_type = 'NUMBER' and tc.data_precision is not null then '(' || tc.data_precision || ',' || tc.data_scale || ')'
                              when tc.data_type like '%CHAR%' then '(' || tc.data_length || ')'
                              else null
                         end type
  ,      cc.comments as "备注"
  ,      tc.nullable  as "是否允许为Null"
  ,    null as "备注"
  ,    null as  "主键"
  from   user_col_comments cc
  join   user_tab_columns  tc on  cc.column_name = tc.column_name
                              and cc.table_name  = tc.table_name
  where  cc.table_name = upper('CSTP_04_QUOTE_S_M');
  ```

- use   `sys.Dba_tab_Columns` , `sys.Dba_col_comments` to  query full info of a table.see [stackoverflow](https://stackoverflow.com/questions/10912337/how-to-show-comments-of-a-column-with-desc-operation)

- query DDL script which generate a script which can create a table.

  ```sql
  SELECT DBMS_METADATA.get_ddl ('TABLE', 'CSTP_STRATEGY_LIST_N')  FROM sys.dual;
  ```

# ORA-04091: table xxxx is mutating, trigger/function may not see it

**触发器不能再查询列本身**， 这个网上一查一大堆。 前辈给我说过， 这是因为ORACLE不好处理行是更新前的还是更新后的， **确切的原因以后有空再查**。 其实我当时做的是当表的一行发生更新时把这一行插入到另一张表中，而我当时用的是`insert into table2 select  *  into row from table1 where key = :new.key`就报错了， 前辈教我的是全部用`:new.column1, :new.column2…来做，自己还是欠一些思考啊。`

# Readlist

- [AUTONOMOUS_TRANSACTION Pragma](https://docs.oracle.com/cd/B14117_01/appdev.101/b10807/13_elems002.htm)， A subprogram marked with this pragma can do SQL operations and commit or roll back those operations, without committing or rolling back the data in the main transaction. 

- [racle中length、lengthb、substr、substrb用法小结, 注意中文编码长度问题](https://blog.csdn.net/zhangbingtao2011/article/details/51384393)

- [Oracle MERGE](https://www.oracletutorial.com/oracle-basics/oracle-merge/)

- [【SQL】Oracle分页查询的三种方法](https://blog.csdn.net/oYunTaoLianWu/article/details/9769601) 保持开放的心态，查询减少数据量有很多种做法

- [Max Value based on two columns](https://stackoverflow.com/questions/41917925/max-value-based-on-two-columns)  

   `MAX(t.MONTH) keep (dense_rank last ORDER BY YEAR nulls first) MONTH` see more  at [Analytic Functions Versus Aggregate Functions](https://www.vertica.com/docs/9.2.x/HTML/Content/Authoring/AnalyzingData/SQLAnalytics/AnalyticFunctionsVersusAggregateFunctions.htm)
   
- [分析oracle的执行计划（explain plan）并对对sql进行优化实践](https://www.cnblogs.com/langtianya/p/5897592.html)  see [a explain plan got from work](https://github.com/alanackart/ORACLE/blob/master/explain%20plan.txt)

- [Oracle执行计划详解](https://www.cnblogs.com/jianggc/articles/2029854.html)

  

