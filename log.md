---
layout: log
title: Log
permalink: /log/
---

Aquí pongo las cosas que no dan para un post pero quiero conservar y compartir.

{% assign entries = site.posts | where_exp: "post", "post.categories contains 'Log'" %}

<div class="content-index" markdown="1">
  <ul>
    {% for entry in entries %}
      <li>
        <a href="#{{ entry.anchor }}">
          [{{ entry.date | date: '%d-%m-%Y' }}] {{ entry.title }}
        </a>
      </li>
    {% endfor %}
  </ul>
</div>

{% for entry in entries %}
  <div id="{{ entry.anchor }}">
    <a href="/log#{{ entry.anchor }}">
      <h3>[{{ entry.date | date: '%d-%m-%Y' }}] {{ entry.title }}</h3>
    </a>
  </div>

  <div class="log-entry">
    {{ entry.content }}
  </div>
{% endfor %}