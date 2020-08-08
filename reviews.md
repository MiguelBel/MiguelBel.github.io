---
layout: default
title: Reseñas | I'm Miguel
permalink: /reviews/
---

{% assign reviews = site.posts | where_exp: "post", "post.categories contains 'Books'" %}

<div>
  <h2 class="site-title">Reseñas</h2>
  <ul class="posts">
    {% for post in reviews %}
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
