---
layout: page
title: ARCHIVES
description: Sort by Years
keywords: ARCHIVES
comments: false
menu: ARCHIVES
permalink: /archives/
---

<section class="container posts-content">
{% assign count_year = 1 %}
{% assign count_month = 1 %}
{% for post in site.posts reversed %}
    {% assign year = post.date | date: '%Y' %}
    {% assign next_year = post.next.date | date: '%Y' %}
	{% assign month = post.date | date: '%Y%m' %}
    {% assign next_month = post.next.date | date: '%Y%m' %}
    {% if year != next_year %}
        {% assign count_year = count_year | append: ', ' %}
        {% assign count_years = count_years | append: count_year %}
        {% assign count_year = 1 %}
		
		{% assign count_month = count_month | append: ', ' %}
        {% assign count_months = count_months | append: count_month %}
		{% assign count_month = 1 %}
    {% else %}
        {% assign count_year = count_year | plus: 1 %}
		{% if month != next_month %}
			{% assign count_month = count_month | append: ', ' %}
			{% assign count_months = count_months | append: count_month %}
			{% assign count_month = 1 %}
		{% else %}
			{% assign count_month = count_month | plus: 1 %}
		{% endif %}
    {% endif %}
{% endfor %}

{% assign count_years = count_years | split: ', ' | reverse %}
{% assign i = 0 %}

{% assign count_months = count_months | split: ', ' | reverse %}
{% assign j = 0 %}


{% assign this_year = 1 %}
{% assign this_month = 1 %}


{% for post in site.posts %}
    {% assign year = post.date | date: '%Y' %}
    {% assign next_year = post.next.date | date: '%Y' %}
	{% assign month = post.date | date: '%Y%m' %}
    {% assign next_month = post.next.date | date: '%Y%m' %}
    {% if year != next_year %}
			{% if this_year != 1 %}
				</ol>
			{% endif %}
			<h3>{{ post.date | date: '%Y' }} ({{ count_years[i] }})</h3>
			<h4>{{ post.date | date: '%Y%m' }} ({{ count_months[j] }})</h4>
			{% if this_year != 0 %}
				{% assign this_year = 0 %}
			{% endif %}
			<ol class="posts-list">
			{% assign i = i | plus: 1 %}
			{% assign j = j | plus: 1 %}
			<li class="posts-list-item">
			<span class="posts-list-meta">{{ post.date | date:"%m-%d" }}</span>
			<a class="posts-list-name" href="{{ site.url }}{{ post.url }}">{{ post.title }}</a>
			</li>
		{% else %}
			{% if month != next_month%}
			<h4>{{ post.date | date: '%Y%m' }} ({{ count_months[j] }})</h4>
			{% assign j = j | plus: 1 %}
			{% endif %}
			<ol class="posts-list">
			<li class="posts-list-item">
			<span class="posts-list-meta">{{ post.date | date:"%m-%d" }}</span>
			<a class="posts-list-name" href="{{ site.url }}{{ post.url }}">{{ post.title }}</a>
			</li>
    {% endif %}

{% endfor %}

</section>
