<!--
date: 02-12-2022
tag: programming
satisfaction: 5/5
difficulty: 1/5
-->

{% include collapsible_fragment_start.html title="Ruby syntax compact" %}

<div markdown="1">

**Modelo:** [OpenAI Chat](https://chat.openai.com/chat)

**Contexto:** Necesitaba cambiar el formato de hash de fat arrow a símbolos.

**Prompt:** can you remove here the + symbol and convert from this syntax ruby to symbol ones, also I want single quotes:

{% highlight ruby %}
      +    :not_allowed=>
       +     [{:reason=>"no es valido",
       +       :words=>
       +        ["HOLA",
       +         "ADIOS",
       +         "REGEXP"]}],
       +    :regexp=>"^(?!.*0001$).*$",
{% endhighlight %}

**Resultado:**

{% highlight ruby %}
In Ruby, you can use the following code to convert the given syntax to use symbols and single quotes:

not_allowed: {
  reason: 'no es valido',
  words: [
    'HOLA',
    'ADIOS',
    'REGEXP'
  ]
},
regexp: '^(?!.*0001$).*$'
{% endhighlight %}

**Conclusión:** Acierta a la primera con lo que necesitaba. Esto no es tan compleja con un lintern puedes hacerlo también.

</div>

{% include collapsible_fragment_end.html %}
