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

曾经，我信奉一句话， THE LORD IS MY LIGHT. 现在我相信两个人， 相信她是适合我的，也相信我每天都坚持为她努力提升自己。

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
