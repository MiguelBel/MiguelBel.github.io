---
categories: Log
layout: log_entry
published: true
title: "@ y -  en Makefiles"
anchor: makefiletips
---

Últimamente estoy haciendo escribiendo más Makefiles. Hay dos necesidades que cubre la implementación de [GNU Make](https://www.gnu.org/software/make/) que me han resultado muy útiles.

La primera es escribir `@` antes del comando, sirve para que el comando no salga en la salida. Me resultó útil para no mostrar datos sensibles. Sin `@`:

```undefined
test:
    echo 1
```

```undefined
$ make test
echo 1
1
```

Con `@`:

```undefined
test:
    @echo 1
```

```undefined
$ make test
1
```

La segunda es escribir `-` antes del comando, sirve para ejecutar diferentes comandos con independencia del resultado del anterior. Los comandos se ejecutan aunque falle alguno. Me resultó útil para poder hacer la limpieza de los containers de Docker que podían existir o no. Sin `-`:

```undefined
test:
    not_existing_command
    echo 1
```

```undefined
$ make test
not_existing_command
make: not_existing_command: No such file or directory
make: *** [test] Error 1
```

Con `-`:

```undefined
test:
    -not_existing_command
    -echo 1
```

```undefined
$ make test
not_existing_command
make: not_existing_command: No such file or directory
make: [test] Error 1 (ignored)
echo 1
1
```

Se pueden combinar:

```undefined
test:
    @-not_existing_command
    @-echo 1
```

```undefined
$ make test
make: not_existing_command: No such file or directory
make: [test] Error 1 (ignored)
1
```
