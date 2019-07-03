---
layout:     	post
title:      	unix special shell variables
categories: 	Linux
description:   	unix special shell variables
keywords: 		Linux, Shell
---
Some unix special shell variables

##### Special Variables

| Sr.No. | Variable & Description                                       |
| ------ | ------------------------------------------------------------ |
| 1      | **$0**The filename of the current script.                    |
| 2      | **$n**These variables correspond to the arguments with which a script was invoked. Here **n** is a positive decimal number corresponding to the position of an argument (the first argument is $1, the second argument is $2, and so on). |
| 3      | **$#**The number of arguments supplied to a script.          |
| 4      | **$\***All the arguments are double quoted. If a script receives two arguments, $* is equivalent to $1 $2. |
| 5      | **$@**All the arguments are individually double quoted. If a script receives two arguments, $@ is equivalent to $1 $2. |
| 6      | **$?**The exit status of the last command executed.          |
| 7      | **$$**The process number of the current shell. For shell scripts, this is the process ID under which they are executing. |
| 8      | **$!**The process number of the last background command.     |

*=~* 

> An additional binary operator, =~, is available, with the same precedence as == and !=. When it is used, the string to the right of the operator is considered an extended regular expression and matched accordingly (as in regex(3)). The return value is 0 if the string matches the pattern, and 1 otherwise. If the regular expression is syntactically incorrect, the conditional expression's return value is 2. If the shell option nocasematch is enabled, the match is performed without regard to the case of alphabetic characters. Any part of the pattern may be quoted to force it to be matched as a string.

##### reference:

1. [tutorialspoint](http://www.tutorialspoint.com/unix/unix-special-variables.htm)

