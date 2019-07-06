---
layout: page
title: Links
description: All Links, bookmarks
keywords: links
comments: true
menu: 链接
permalink: /links/
---

# Life

{% for link in site.data.links %}
  {% if link.src == 'life' %}
* [{{ link.name }}]({{ link.url }})
  {% endif %}
{% endfor %}

# Tech 

{% for link in site.data.links %}
  {% if link.src == 'tech' %}

- [{{ link.name }}]({{ link.url }})
  {% endif %}
  {% endfor %}

# Friends

{% for link in site.data.links %}
  {% if link.src == 'friend' %}

* [{{ link.name }}]({{ link.url }})
  {% endif %}
{% endfor %}
