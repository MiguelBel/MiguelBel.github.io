---
layout: default
title: One Liners
permalink: /one-liners/
---

```bash
kill -9 $(jobs -p)
```

Mata todos los trabajos en background. Muy útil si utilizas `ctrl-z` y `fg` con frecuencia.

```bash
vim -p `ack -l 'SOME_SEARCH'`
```

Abre los ficheros que contienen la cadena `SOME_SEARCH` en pestañas de Vim. Sin el `-p` los abre en buffers.
