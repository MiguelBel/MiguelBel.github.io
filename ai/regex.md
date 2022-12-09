<!--
date: 02-12-2022
tag: programming
satisfaction: 5/5
difficulty: 2/5
-->

{% include_relative _layouts/collapsible_fragment_start.html title="Regex" %}

<div markdown="1">

**Modelo:** [OpenAI Chat](https://chat.openai.com/chat)

**Contexto:** Necesitaba una expresión regular para identificar las cadenas que NO acababan en 0001. No es muy compleja pero no me acordaba de la sintaxis de la negación. Después de un par de búsquedas en Stackoverflow sin que me diesen exactamente lo que quería probé con la AI.

**Prompt:** can you code me a regexp in ruby which will match a string not ending in 0001?

**Resultado:**

{% highlight ruby %}
# Define the regex
regex = /^(?!.*0001$)/
# Define some test strings
strings = [
  "Hello world!",
  "Foo bar baz 0001",
  "This is a test string 0001",
  "This string does not end with 0001"
]

# Loop through the test strings and use the regex to match each one
strings.each do |str|
  if str.match?(regex)
    puts "#{str} matches the regex"
  else
    puts "#{str} does not match the regex"
  end
end
{% endhighlight %}

**Conclusión:** Acierta a la primera con lo que necesitaba.

</div>

{% include_relative _layouts/collapsible_fragment_end.html %}
