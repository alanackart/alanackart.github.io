---
layout: page
title: About
description: FC's Blog
keywords: FangChao
comments: true
menu: 关于
permalink: /about/
---

Hey，我是**FangChao**，一枚程序猿。

> 人世无常，人情冷暖，奔忙一生，碌碌无为，然无奈悲苦之一生，若能遇见斗沙片刻之美好，便足矣。
>
> —— 苏秦 《大秦帝国之崛起》

为了那些曾经的以及将要发生的美好，我正在努力



> 在山的那边，是海吗？

也许我已经跨越了不少的山从大西北求学来到上海，但是正如我还没真正见过一望无际的汪洋大海一样，我的理想也从未实现， 没有找到对的路， 没有找到对的人。前路漫漫，过去的经历不是负担还是一种荣耀，我会继续勇敢的走下去！

## Contacts

{% for website in site.data.social %}
* {{ website.sitename }}：[@{{ website.name }}]({{ website.url }})
{% endfor %}

## Skill Keywords

{% for category in site.data.skills %}
### {{ category.name }}
<div class="btn-inline">
{% for keyword in category.keywords %}
<button class="btn btn-outline" type="button">{{ keyword }}</button>
{% endfor %}
</div>
{% endfor %}
