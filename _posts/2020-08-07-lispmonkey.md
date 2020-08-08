---
categories: Log
layout: log_entry
published: true
title: Monkey Patching en Lisp
anchor: lispmonkey
---

El monkey patching trae [problemas](https://en.wikipedia.org/wiki/Monkey_patch#Pitfalls) pero estaba mirando por curiosidad como hacerlo en Lisp. Un ejemplo, que el símbolo de sumar reste:

```lisp
1 ]=> (define (+ . args-list)
  (apply - args-list))

;Value: +

1 ]=> (+ 1 1)

;Value: 0
```
