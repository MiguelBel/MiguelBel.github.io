---
layout: post
published: true
title: Convirtiendo Minimal Viewer en una app móvil
---
Hace un tiempo creé [MinimalViewer](https://github.com/MiguelBel/MinimalViewer), tardé muy poco en conseguir que me aportase valor. Fundamentalmente es una forma inteligente de leer webs -sin anuncios, sin repetir lo que ya has visto...-, puedes ver un ejemplo en [MinimalViewer for HackerNews](http://www.minimalviewer.com/viewers/hackernews).

Creé varios visores y los utilicé bastante hasta hace un par de meses. Cada vez me cuesta más tiempo pasar tiempo delante del ordenador si no es para desarrollar, en mi tiempo libre tiendo a usar el móvil. Por esta razón quiero convertir el proyecto en una aplicación móvil (iOS) y que me siga aportando valor.

## Prototipado ~ 1 hora

Nunca he prototipado el diseño ni tampoco el resultado deseado cuando he hecho proyectos de fin de semana. Esto me suele llevar a pensar el resultado final una vez estoy maquetando. Suele ser pesado ya que acabas definiendo el resultado final a base de cambiar ficheros `.css`. Para este proyecto he decidido tener el resultado de lo que quiero antes de empezar.

Abro el [Sketch](https://www.sketchapp.com/), que prácticamente nunca he utilizado, me bajo la plantilla de [NativeBase](https://nativebase.io/) y después de un rato obtengo esto:

![](http://i.imgur.com/l8gT15u.png)

Es una aplicación sencilla, son 4 pantallas y la lógica es simple. Llamar a una `API`, pintar una lista, y luego llamar a otras `APIs` dependiendo del elemento que elijas.

## Elegir tecnologías ~ 3 horas

Lo último que hice de móvil fue hace por lo menos 4 o 5 años con [PhoneGap](http://phonegap.com/). El resultado fue bastante decepcionante. No me planteo volver a elegir una tecnología que dependa de un `webkit`. Aunque solo quiero hacer la app para iPhone, tampoco me planteo hacerlo con `Objective-C` o `Swift`. Quiero iterar lo más rápido posible. Por tanto queda la versión intermedia algo como [Titanium](https://www.appcelerator.com/mobile-app-development-products/) o [React Native]([https://facebook.github.io/react-native/).

Ya que MinimalViewer está hecho en [React](https://facebook.github.io/react/) elijo `React Native`. Aprovechando que he usado la plantilla de sketch de `Native Base`, tampoco me caliento mucho la cabeza eligiendo kit de UI y utilizo esta.

Esta parte de la decisión es un poco mentira. No ha sido un ejercicio de probar y valorar tecnologías. Tenía la idea en la cabeza de lo que quería usar y luego me he justificado. Lo normal sería haber probado diferentes herramientas y después de evaluar haberme quedado con la más convenientes. Al ser un proyecto personal tampoco quiero entretenerme mucho en esta parte. Me planteo cuantas veces queremos afrontar un desarrollo y justificamos las decisiones de las tecnologías empleadas en lugar de buscar la tecnología más adecuada.

Aprovecho esta parte para profundizar en los conceptos que creo que me pueden faltar cuando empiece el desarrollo.

**Flujo de trabajo**: Básicamente el hecho de pasar de aplicaciones web a móviles provoca un cambio de flujo de trabajo. Ya no ves el resultado en un navegador si no que lo haces en un simulador. El hecho de hacerlo en un simulador es que tienes que instalarte todo lo relacionado con él -`xcode`-. Aprovecho esta parte para familiarizarme con `React Native`. Al final resulta ser bastante sencillo e intuitivo.

**Navegación**: En teoría el cambio de `React`, en el que sí que he hecho cosas, a `React Native` no debería ser muy grande a nivel de sintaxis y funcionamiento interno. Sin embargo tengo ciertas dudas en la navegación entre "pantallas". Por eso hago una pequeña aplicación que me permite resolver las dudas al respecto.

<img src="http://i.imgur.com/EWQmWXR.gif" width="200">

Intento ser lo más pragmático posible e ir al grano. No me preocupo del código limpio, ni de los tests, simplemente quiero entender mínimamente como funciona la navegación en móvil. Lo que busco es un balance entre no emplear demasiado tiempo y que cuando esté desarrollando no tenga que volver a la documentación para hacer la navegación.

**Tests**: Al ser `React Native` asumo que las librerías de tests unitarios van a ser las mismas que las de `React`. Sin embargo, me surge la duda de que pasa con los tests `end to end`. Ya tengo en la cabeza tomar la aplicación como la unidad más pequeña y ceñirme en principio a hacer tests `end to end`.

Después de pasar una hora y media viendo opciones de tests de interfaz, lo veo todo demasiado complejo y con demasiadas cosas que instalar como para dedicarle más tiempo. Desecho la idea de hacer tests `end to end`. Estaba empezando a frustrarme porque esperaba que hubiese una solución más depurada.

## Desarrollo ~ 10 horas

Puedes ver el código en el [repositorio](https://github.com/MiguelBel/MinimalViewerMobile). Este post no tendría mucho sentido sin liberar el código.

Después de acabar un poco frustrado al ver que no iba a poder hacer [Behaviour Driven Development](https://en.wikipedia.org/wiki/Behavior-driven_development), me puse a ello. Me quedé sorprendido de lo productivo que era en un campo que prácticamente no había tocado nunca. Era como programar para web, incluso más sencillo porque ya tenía toda la UI hecha gracias a `Native Base`.

El único punto donde estuve algo bloqueado y estuve un buen rato buscando en Google fue usando `AsyncStorage` que es asíncrono y no tenía claro como aplicar `.filter` , pero eso se debe a que tampoco he tocado tanto `JavaScript`.

Si sabes `React`, hacer algo en `React Native` es trivial. Si sabes `JavaScript` hacer algo en `React` es sencillo. Hacer apps móviles es bastante sencillo con esta solución.

El reto en esta parte fue el balancear entre la limpieza del código y el foco. Al tener ya los requisitos donde quería llegar el reto fue rebajar un poco la limpieza del código para no dedicarle demasiado tiempo. En el `readme` del repositorio están los atajos que tomé para no dedicarle mucho tiempo a dejar el código perfecto. Se convertirá en deuda técnica si añado más cosas al producto, si no, así se quedará.

Al empezar el objetivo era conseguir las funcionalidades básicas (`swipe`, contador, leer visores, leer entradas...) y dejar la maquetación para el final. Así que conseguí esto:

![](http://i.imgur.com/USY1DTW.gif)

Luego de aplicar los estilos, la aplicación quedó así:

![](http://i.imgur.com/NoZSQ4e.gif)

## Pruebas ~ 30 minutos

Aunque mi idea de hacer `BDD` no fue posible, sí que quería mantener ciclos cortos de `feedback` así que después de cada cambio hacía las pruebas a mano. Por suerte, la aplicación es bastante simple, en apenas 5 movimientos puedes probar casi todas las funcionalidades pero llegó a un momento ciertamente cansado. Al final el hecho de tener que estar con el simulador en lugar de tener la `suite` de tests en verde hace que pierdas el foco. Viendo como lo hacen en otros proyectos de `React Native` se pueden usar snapshots pero ya pierdes el poder hacerlo antes.

No hice mucho test exploratorio, tampoco había necesidad, los casos extremos son pocos, el único defecto que encontré fue cuando estabas en el último elemento y pasabas al siguiente, daba error. Lo solucioné cuando lo descubrí.

En cuanto a los dispositivos solo probé para iOS, en iPhone 7, que es donde lo voy a usar. Tengo curiosidad por probarlo en el simulador de Android pero eso lo he dejado fuera del objetivo de esta parte.

## Despliegue ~ 15 minutos

Una de las cosas que me "preocupaba" era el tener que pagar la cuenta de desarrollador de Apple para poder probarlo en mi móvil. Son 100 dólares al año. Me parecía demasiado para simplemente probar la aplicación en mi móvil. Al parecer cambiaron la política hace unos años y ahora se puede probar en el móvil sin problemas sin tener que pagar nada.

Tuve un problema con el firmado que soluciono "googleando" por lo demás muy sencillo. Abrir el proyecto con el `XCode`, conectar el móvil, seleccionarlo y desplegarlo.

## ¿Y ahora qué?

De momento no me planteo publicar la app en la `App Store`. Quizá en el futuro si considero que puede aportarle valor a alguien lo haga pero no es el caso ahora mismo.

Llegados a este punto, en seguida te planteas nuevas funcionalidades y mejoras. No voy a hacerlas por ahora, ya tengo lo que quería, voy a seguir usando la aplicación y cuando piense -con el uso- que hacen falta mejoras, las añadiré.

La idea que tenía con este post es la de mostrar como intento desarrollar proyectos personales de manera sostenible. Intentando ser lo más pragmático posible intento evitar el desarrollar un producto muy complejo que tiene funcionalidades innecesarias. Si tengo que destacar algo de este `post` es el hecho de tener claro un final. Todos hemos dejado proyectos personales a medias. Diría que la razón principal, al menos en mi caso, es no tener claro el objetivo.
