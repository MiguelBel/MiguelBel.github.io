---
categories: Article
layout: post
published: true
title: No memoices las relaciones del ORM
---

La [memoización](https://es.wikipedia.org/wiki/Memoizaci%C3%B3n) es una técnica muy usada como caché con duración del tiempo de vida del objeto. En Ruby es muy sencillo memoizar. Un ejemplo:

{% highlight ruby %}
class MyObject
  attr_reader :a_value

  def set_value
    @a_value ||= rand(99999)
  end
end

irb(main):001:0> mo = MyObject.new
=> #<MyObject:0x00007fd1af82f608>
irb(main):002:0> mo.a_value
=> nil
irb(main):003:0> mo.set_value
=> 96295
irb(main):004:0> mo.a_value
=> 96295
irb(main):005:0> mo.set_value
=> 96295
irb(main):006:0> mo.set_value
=> 96295
{% endhighlight %}

Mientras el objeto exista el método `set_value` solo calculará el número aleatorio una sola vez, la primera. El resto de llamadas el objeto utilizará el valor previamente guardado. Una alternativa a memoizar puede ser pasar el valor por el constructor al instanciar el objeto:

{% highlight ruby %}
class MyObject
  attr_reader :a_value

  def initialize(value)
    @a_value = value
  end
end

irb(main):001:0> mo = MyObject.new(rand(999999))
=> #<MyObject:0x00007fd30d059348 @a_value=31569>
irb(main):002:0> mo.a_value
=> 31569
irb(main):003:0> mo.a_value
=> 31569
{% endhighlight %}

Esto tiene la diferencia de tener siempre el valor desde la instanciación pero sigue teniendo el mismo problema que la memoización cuando almacenamos relaciones del ORM.

El problema viene cuando implementaciones como esta de la técnica [ORM](https://es.wikipedia.org/wiki/Asignaci%C3%B3n_objeto-relacional) utilizan un constructor de sentencias SQL dinámico y estos objetos son memoizados.

Un ejemplo de esto en [ActiveRecord](https://github.com/rails/rails/tree/main/activerecord), el ORM de [Rails](https://rubyonrails.org/), para una tabla de monedas podemos ver como genera diferentes consultas dependiendo de lo que necesitemos:

{% highlight ruby %}
irb(main):001:0> Currency.where(name: 'USD')
# DEBUG -- :   Currency Load (3.3ms)  SELECT  `currencies`.* FROM `currencies` WHERE `currencies`.`name` = 'USD' ORDER BY name asc
irb(main):002:0> Currency.where(name: 'USD').count
# DEBUG -- :    (2.2ms)  SELECT COUNT(*) FROM `currencies` WHERE `currencies`.`name` = 'USD'
{% endhighlight %}

Si esta consulta tardase mucho o se tuviese que ejecutar muchas veces en el ciclo de vida de un objeto podríamos vernos tentados a memoizarlo. Sería un error hacerlo directamente sin guardar los datos devueltos una vez extraída la consulta ya que realizaríamos la consulta varias veces:

{% highlight ruby %}
class MyObject
  def currencies
    @currencies ||= Currency.where(name: 'USD')
  end
end

irb(main):001:0> mo = MyObject.new
=> #<MyObject:0x00007f617eb61070>
irb(main):002:0> mo.currencies
# DEBUG -- :   Currency Load (1.3ms)  SELECT  `currencies`.* FROM `currencies` WHERE `currencies`.`name` = 'USD' ORDER BY name asc LIMIT 11
irb(main):003:0> mo.currencies.count
# DEBUG -- :    (1.8ms)  SELECT COUNT(*) FROM `currencies` WHERE `currencies`.`name` = 'USD'
{% endhighlight %}

Para que esto no supusiese un problema deberíamos guardar el resultado de la consulta en memoria:

{% highlight ruby %}
class MyObject
  def currencies
    @currencies ||= Currency.where(name: 'USD').to_a
  end
end

irb(main):001:0> mo = MyObject.new
=> #<MyObject:0x00007f3c05a3c0a8>
irb(main):002:0> mo.currencies
# DEBUG -- :   Currency Load (1.3ms)  SELECT `currencies`.* FROM `currencies` WHERE `currencies`.`name` = 'USD' ORDER BY name asc
irb(main):003:0> mo.currencies.count
=> 1
{% endhighlight %}
