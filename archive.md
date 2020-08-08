---
layout: default
title: Archivo | I'm Miguel
permalink: /archive/
---

{% assign articles = site.posts | where_exp: "post", "post.categories contains 'Article'" %}

<div>
  <h2 class="site-title">Posts</h2>
  <ul class="posts">
    {% for post in articles %}
      <li class="post">
        <span class="post-date-index blue">
          {{ post.date | date: "%b %d %Y" }}
        </span>
        <span class="post-name blue">
          <a href="{{ post.url }}">{{ post.title }}</a>
        </span>
      </li>
    {% endfor %}
  </ul>
</div>