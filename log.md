---
layout: log
title: Log
permalink: /log/
---

Aquí pongo las cosas que no dan para un post pero quiero conservar y compartir.

{% assign entries = site.posts | where_exp: "post", "post.categories contains 'Log'" %}
{% assign links_identifier_in_title = "Links" %}

<div class="content-index" markdown="1">
  <ul>
    {% for entry in entries %}
      {% unless entry.title contains links_identifier_in_title %}
        <li>
          <a href="#{{ entry.anchor }}">
            [{{ entry.date | date: '%d-%m-%Y' }}] {{ entry.title }}
          </a>
        </li>
      {% endunless %}
    {% endfor %}
  </ul>
</div>

<div class="content-index links-index" markdown="1">
  <p>Links:</p>
  <ul>
    {% for entry in entries %}
      {% if entry.title contains 'Links' %}
        <li>
          <a href="#{{ entry.anchor }}">
            {{ entry.title | replace: "Links del mes de ", "" | capitalize }}
          </a>
        </li>
      {% endif %}
    {% endfor %}
  </ul>
</div>
<div>

<div class="log-entries">
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
<div>
