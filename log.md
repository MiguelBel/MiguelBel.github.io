---
layout: log
title: Log
permalink: /log
---

Aquí pongo las cosas que no dan para un post pero quiero conservar y compartir.

<div class="content-index" markdown="1">
- [[01-06-2020] Links del mes de mayo 2020](#20mayo)
- [[06-05-2020] Xv6](#xv6)
- [[01-05-2020] Atajos para usar vim con corrector ortográfico](#vim-writing-mode)
- [[31-04-2020] Links del mes de abril 2020](#20abril)
</div>

<div id="20mayo" markdown="1">
### [01-06-2020] Links del mes de mayo 2020
</div>

<div class="log-entry" markdown="1">
Lectura:

- [HTTP Blog Server : 100 Lines of C in a Closet](https://blog.notryan.com/009.txt) [notryan.com]
- [Law of triviality](https://en.wikipedia.org/wiki/Law_of_triviality) [wikipedia.org]
  - Esto pasa mucho en las reviews de código. La broma de "+3 líneas 17 comentarios, +546 -87 líneas, todo ok"
- [Against unnecessary databases](https://beepb00p.xyz/unnecessary-db.html) [beepb00p.xyz]
- [Test Driven Development](https://github.com/testdouble/contributing-tests/wiki/Test-Driven-Development) [github.com]
- [Polish notation](https://en.wikipedia.org/wiki/Polish_notation) [wikipedia.org]
  - Conocía la notación polaca al echarle un ojo al temario para la [FCA](https://en.wikipedia.org/wiki/Financial_Conduct_Authority), me he acordado al ver cosas sobre Lisp.
- [SPA fatigue](https://macwright.org/2020/05/10/spa-fatigue.html) [macwright.org]
- [Teach Yourself Programming in Ten Years](https://norvig.com/21-days.html) [norvig.com]
- [One-pass Compiler](https://keleshev.com/one-pass-compiler-primer) [keleshev.com]
- [Hardware security module](https://en.wikipedia.org/wiki/Hardware_security_module) [wikipedia.org]
- [ISO 8583 - international standard for financial transaction card originated](https://en.wikipedia.org/wiki/ISO_8583) [wikipedia.org]
- [Instrumentation in Go](https://gbws.io/articles/instrumentation-in-go/) [gbws.io]
- [Why Failed Predictions Don’t Matter](https://ofdollarsanddata.com/failed-predictions/) [ofdollarsanddata.com]
- [Write like you talk](http://www.paulgraham.com/talk.html) [paulgraham.com]

Videos:

- [Simple Firmware Reverse Engineering](https://www.youtube.com/watch?v=oqk3cU7ekag) [youtube.com]
- [TW Hangouts - Is TDD dead?](https://www.youtube.com/watch?v=z9quxZsLcfo) [youtube.com]
- [Miguel Anxo Bastos - La Revolución Francesa](https://www.youtube.com/watch?v=lBEOwFm_gI5) [youtube.com]
- [Architecting a Modern Financial Institution](https://www.youtube.com/watch?v=VYuToviSx5Q) [youtube.com]

Misc:

- [gs-lang](https://github.com/geertvos/gs-lang/blob/master/README.md) [github.com]
- [Online compilers WYSIWYG](https://godbolt.org/) [godbolt.org]
- [OpenBSD handbook](https://www.openbsdhandbook.com/) [openbsdhandbook.com]
- [Awesome scalability](http://awesome-scalability.com/) [awesome-scalability.com]
- [Exobrain](https://beepb00p.xyz/exobrain/) [beepb00p.xyz]
- [Everything I Know](https://wiki.nikitavoloboev.xyz/) [nikitavoloboev.xyz]
- [Alfred my mind](https://github.com/nikitavoloboev/alfred-my-mind) [github.com]
- [100 ideas for computing](https://github.com/samsquire/ideas) [github.com]
- [roadmap.sh](https://roadmap.sh/) [roadmap.sh]
</div>

<div id="xv6" markdown="1">
### [06-05-2020] Xv6
</div>

<div class="log-entry" markdown="1">
Últimamente me he estado interesando por los sistemas operativos ya que supone una oportunidad para usar lenguajes de "bajo nivel" (si aceptamos C como lenguaje de bajo nivel). Empecé un curso de Linux y me di cuenta que había muchas cosas que no sabía sobre el funcionamiento de los sistemas operativos. Descubrí [Xv6](https://pdos.csail.mit.edu/6.828/2012/xv6.html). Es un sistema operativo mínimo que se puede virtualizar con QEMU. Es más sencillo que [MINIX](https://en.wikipedia.org/wiki/MINIX) y de kernel monolítico. Tiene un manual donde explica en 100 páginas el funcionamiento del sistema. El código es C y es sencillo.

Aproveché también para pasar re-escribir algunas de las GNU core utils para xv6. Hay varios forks y proyectos con modificaciones/extensiones (GUI, en otras arquitecturas...) que resultan más sencillas de explorar que proyectos reales.

No estoy 100% seguro pero uno de los profesores detrás de Xv6 es Robert Morris que es el "precursor" de los virus con [El gusano morris](https://es.wikipedia.org/wiki/Gusano_Morris).
</div>

<div id="vim-writing-mode" markdown="1">
### [01-05-2020] Atajos para usar vim con corrector ortográfico
</div>

<div class="log-entry" markdown="1">
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
</div>

<div id="20abril" markdown="1">
### [31-04-2020] Links del mes de abril 2020
</div>

<div class="log-entry" markdown="1">
Lista de enlaces sobre el contenido que me ha gustado/recomiendo/provoca-interés durante el mes. Hay partes que he consumido superficialmente, otras al completo y otras no pueden ser consumidas (Misc). He cogido la idea de la newsletter de [Gwern](http://gwern.net).

Lectura:

- [Linux Kernel Teaching](https://linux-kernel-labs.github.io/refs/heads/master/index.html) [github.io]
- [Orthographic ligature](https://en.wikipedia.org/wiki/Orthographic_ligature) [wikipedia.org]
- [Discussion: At Uber, we're moving many of our microservices to "macroservices"](https://lobste.rs/s/mc3k1c/at_uber_we_re_moving_many_our#c_f8vacm) [lobste.rs]
- [OpenBSD Ports - Working with Ports](https://www.openbsd.org/faq/ports/ports.html) [openbsd.org]
- [CodeOtaku's Open Source Progress Report](https://www.codeotaku.com/journal/2020-04/open-source-progress-report/index) [codeotaku.com]
- [Writing your own toy compiler](https://gnuu.org/2009/09/18/writing-your-own-toy-compiler/) [gnuu.org]
- [Stop Making Students Use Eclipse](https://nora.codes/post/stop-making-students-use-eclipse/) [nora.codes]
- [Technical reasons to choose FreeBSD over GNU/Linux](https://unixsheikh.com/articles/technical-reasons-to-choose-freebsd-over-linux.html) [unixsheikh.com]
- (political) Why you should migrate everything from Linux to BSD [Parte 1](https://unixsheikh.com/articles/why-you-should-migrate-everything-from-linux-to-bsd.html) y [Parte 2](https://unixsheikh.com/articles/why-you-should-migrate-everything-from-linux-to-bsd-part-2.html)
- [Your statement is 100% correct but misses the entire point](https://nibblestew.blogspot.com/2020/04/your-statement-is-100-correct-but.html?m=1) [blogspot.com]
- [Linux From Scratch](http://www.linuxfromscratch.org/lfs/view/stable/) [linuxfromscratch.org]
- [Dapper, a Large-Scale Distributed Systems Tracing Infrastructure](https://storage.googleapis.com/pub-tools-public-publication-data/pdf/36356.pdf) [googleapis.com]
- [Distributed tracing at Uber](https://eng.uber.com/distributed-tracing/) [uber.com]
- [5 reasons why i am done with long-term travel](https://againstthecompass.com/en/reasons-long-term-travel/) [againstthecompass.com]
- [Finding Great Developers](https://www.joelonsoftware.com/2006/09/06/finding-great-developers-2/) [joelonsoftware.com]
- [YMMV definition](http://onlineslangdictionary.com/meaning-definition-of/ymmv) [onlineslangdictionary.com]
- [Slow database test fallacy](https://dhh.dk/2014/slow-database-test-fallacy.html) [dhh.dk]
- [Test induced design damage](https://dhh.dk/2014/test-induced-design-damage.html) [dhh.dk]
- [A Conversation with the Creators Behind Python, Java, TypeScript, and Perl](https://thenewstack.io/a-conversation-with-the-creators-behind-python-java-typescript-and-perl/) [thenewstack.io]
- [Unix Admin. Horror Story Summary, version 1.0](http://www-uxsup.csx.cam.ac.uk/misc/horror.txt) [ac.uk]

Videos:

- [Write and Submit your first Linux kernel Patch](https://www.youtube.com/watch?v=LLBrBBImJt4) [youtube.com]
- [How I got engineering jobs at Apple & Nokia with no degree](https://www.youtube.com/watch?v=rS6l7p86cyw) [youtube.com]

Misc:

- [Kernel newbies](https://kernelnewbies.org/) [kernelnewbies.org]
- [SerenityOS](https://github.com/SerenityOS/serenity) [github.com]
- [Xv6, a simple Unix-like teaching operating system](https://pdos.csail.mit.edu/6.828/2012/xv6.html) [mit.edu]
  - [The xv6 Survival Guide](https://web.cecs.pdx.edu/~markem/CS333/handouts/guide)
  - [Xv6 book - rev11](https://pdos.csail.mit.edu/6.828/2018/xv6/book-rev11.pdf)
  - [Xv6 code booklet - rev11](https://pdos.csail.mit.edu/6.828/2018/xv6/xv6-rev11.pdf)
  - [Installing i386-elf-gcc on MacOS X](https://www.danirod.es/blog/2015/i386-elf-gcc-on-mac)
- [MirageOS](https://mirage.io/) [mirage.io]
- [Hack The Kernel](https://www.ops-class.org/) [ops-class.org]
- [Labs for Rust OS](https://tc.gts3.org/cs3210/2020/spring/lab/lab2.html) [gts3.org]
- [Learning operating system development using Linux kernel and Raspberry Pi](https://github.com/s-matyukevich/raspberry-pi-os) [github.com]
- [xv6 meets raspberry pi](https://github.com/siwadon/rpi-xboot) [github.com]
- [8-bit system simulator](https://twitter.com/diodesign/status/1248975584647995394) [twitter.com]
- [Programming from the Ground Up](https://download-mirror.savannah.gnu.org/releases/pgubook/ProgrammingGroundUp-1-0-booksize.pdf) [gnu.org]
</div>