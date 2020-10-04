---
categories: Log
layout: log_entry
published: true
title: Utilidad fechas Arvelie en Scheme
anchor: arvelie-scheme
---

Mientras leía (bueno, leo) el [SICP](/log/#sicp1) echaba un poco en falta programar algo en Scheme más allá de los ejercicios del libro. Me topé con [este](https://wiki.xxiivv.com/site/home.html) jardín digital donde el autor usa un formato de fechas diferente al gregoriano, se llama [Arvelie](https://wiki.xxiivv.com/site/arvelie.html). La idea de representar el tiempo en un [formato alternativo](https://es.wikipedia.org/wiki/Calendario) me llamó la atención.

Hay un [librería](https://github.com/XXIIVV/oscean/tree/master/src/projects/arvelie) en C. Se me ocurrió hacer [mi propia librería en Scheme](https://github.com/MiguelBel/arvelie-scheme). La empecé en verano, ayer la publiqué. Algunas reflexiones...

Tuve que meter [tests](https://github.com/MiguelBel/arvelie-scheme/blob/master/tests.scm). Me cuesta muchísimo trabajar en algo que lleve más de una hora o dos sin tests. Por ejemplo, para el blog tengo scripts:

```
$ tree | grep '\.rb'
│   ├── add_book.rb
│   ├── amazon_book.rb
│   └── generate_bookshelf.rb
│   ├── add_domains.rb
│   └── add_entry.rb
```

que no están testeados, pero son scripts cortos que no (me) merece la pena testear. En cambio al meter el segundo método del conversor empecé a echar en falta los tests. Si hubiese sido un lenguaje compilado quizá podría haber confiado en el compilador para evitar los errores de sintaxis. Al ser interpretado, en lugar de lanzar el REPL para ejecutar los mismos casos de usos, más fácil, cómodo y menos frustrante automatizarlo desde el principio.

Los errores de sintaxis Scheme son crípticos. Un error de sintaxis y a buscar donde falta el paréntesis. Mi entorno de desarrollo no está optimizado para Lisp supongo que si inviertes ahí, no te lo tiene que decir el intérprete.

Lisp es estético. No comparto (ahora) la idea de que tantos paréntesis lo hace feo. Visualmente me resulta muy homogéneo.

La notación polaca, bien.

Demasiadas conversiones de tipos. Tengo la sensación de que mi solución tiene demasiadas conversiones de tipos. Creo que se podría refactorizar para trabajar con listas desde el principio siendo así más sencillo.

La solución podría ser más sencilla. Hubo un momento en el que dejé de hacer la solución más sencilla y empecé a darme prisa por acabarlo. Creo que se podría hacer más sencillo, en especial las validaciones.

Encontrar información no es tan fácil. Comparado con otros lenguajes que buscas en google `how to get first n elements of a list in XXXX` y el primer resultado es consistente en Scheme no es tan sencillo. Desde soluciones que ya existen en la librería estándar hasta soluciones de otros sabores de Lisp (Chicken Scheme, Racket) o soluciones que ya existen en la librería estándar pero que reimplementan en la solución. Supongo que por la historia/naturaleza del lenguaje no puedes esperar el mismo nivel de información que en los populares.

Me ha gustado trabajar con listas pero al ser un problema general aplicando un lenguaje generalista no he podido ver mejoras de "productividad" en comparación con otros lenguajes que he usado.
