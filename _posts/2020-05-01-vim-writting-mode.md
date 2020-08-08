---
categories: Log
layout: log_entry
published: true
title: Atajos para usar vim con corrector ortográfico
anchor: vim-writting-mode
---

Con estas funciones:

```
    " Writer mode
    function! SpanishWriterMode()
      set spelllang=es
      set spell
    endfunction

    function! DisableSpanishWriterMode()
      set nospell
    endfunction

    noremap <leader>swm :call SpanishWriterMode()<CR>
    noremap <leader>dswm :call DisableSpanishWriterMode()<CR>
```

se hace más cómodo usar la ayuda para ver las faltas ortográficas al usar vim.

Con `,swm` para activar o `,dswm` para desactivar el corrector ortográfico.
