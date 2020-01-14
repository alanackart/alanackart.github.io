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
