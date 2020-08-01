---
layout: post
title: Relativismo en el desarrollo de software
layout: post
---

Este [tweet](https://twitter.com/ctrlshifti/status/1288745146759000064?s=19) me hizo mucha gracia.

![tweet](/assets/tweet.png){:width="500", :height="500"}

Me entraron ganas de implementar esa función de la peor forma posible. Hice esto:

{% highlight ruby %}
def is_even(number, accum=2)
  base_uneven = 3
  base_even = 2

  if number <= 0
    raise '0 or negative numbers are not numbers'
  else
    if number == 1
      :uneven
    elsif number == 2 && accum == 2
      :even
    elsif (accum - number) == base_even
      :even
    elsif (accum - number) == base_uneven
      :uneven
    else
      is_even(number - 1, accum + 1)
    end
  end
end
{% endhighlight %}

Esta es la mejor peor solución debido a cosas obvias como:

- complejidad innecesaria
- uso excesivo de los condicionales
- error críptico que niega la existencia de los números menores a 1

y otras no tan obvias como:

- no soporte de nulos
- `uneven` no es `odd`
- es preferible usar un booleano en lugar de devolver un símbolo que representa un booleano
- `even?` es más legible que `is_even`
- hay `magic numbers` y las variables elegidas no tienen mucho sentido
- no funciona para números "grandes", falla con `100000` debido a que usa una suerte de "recursividad"

entre otras.

Alguien con conocimientos en programación haría:

{% highlight ruby %}
def is_even(number)
  number % 2 == 0
end
{% endhighlight %}

alguien con conocimientos en ruby haría:

{% highlight ruby %}
number.even?
{% endhighlight %}

¿Cuál de los tres códigos es mejor?

La respuesta sería el segundo o el tercero. Por el segundo podrías argumentar que es más fácil de entender ya que ves la implementación, podrías decir que en caso de extender la lógica para soportar nulos sería más fácil y quedaría encapsulado. Por el tercero podrías decir que es la implementación de Ruby, no hay necesidad de hacerlo más complejo. Nadie diría la primera.

Sin embargo, me puse a pensar, en qué caso sería mejor la primera que la segunda o la tercera. Últimamente tiendo a pensar en términos más relativistas que objetivistas. Por tanto ninguno de los tres códigos tiene que ser peor que otro. Algunas razones por las que la solución primera podría llegar a considerarse superior:

- es un ejercicio académico donde explícitamente se pide no utilizar el módulo
- el programador quiere quedar en ridículo, aparentar que no sabe
- el programador tiene intereses ocultos en hacer el código excesivamente complicado

en esos casos podríamos admitir que la solución primera es más adecuada.

Una definición básica del relativismo (Wikipedia):

<blockquote>
El relativismo sostiene que los puntos de vista no tienen, ni pueden llegar a tener, verdad ni validez universal, sino que solo poseen una validez subjetiva encuadrada en los diferentes marcos de referencia.
</blockquote>

Un artículo que me gusta mucho es [Your statement is 100% correct but misses the entire point](https://nibblestew.blogspot.com/2020/04/your-statement-is-100-correct-but.html?m=1). Eso pasa mucho en las discusiones por internet sobre casi cualquier ámbito. Las partes intentan imponer la superioridad de sus argumentos sin tener en cuenta el marco de referencia de la parte contraria e ignorando el marco de referencia que ocasiona la discusión.

En desarrollo de software se tiende a evaluar las soluciones sin tener en cuenta el marco de referencia o dejándolo como algo menor en la discusión. Tendemos a buscar realidades objetivas. Cuando en el software quizá no existan las realidades objetivas.