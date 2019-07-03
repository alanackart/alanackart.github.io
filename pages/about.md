---
layout: page
title: About
description: FC's Blog
keywords: FangChao
comments: true
menu: 关于
permalink: /about/
---

> 冰冻三尺 非一日之寒
> 积土成山 非斯须之作

Hey，我是**FangChao**，一枚新手程序猿。

曾经，我信奉一句话， THE LORD IS MY LIGHT. 现在我相信两个人， 相信她是适合我的，也相信我每天会为她付出努力。

## 联系

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
