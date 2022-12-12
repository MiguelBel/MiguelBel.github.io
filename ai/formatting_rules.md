<!--
date: 05-12-2022
tag: programming
satisfaction: 5/5
difficulty: 3/5
-->

{% include collapsible_fragment_start.html title="Formatting rules" %}

<div markdown="1">

**Modelo:** [OpenAI Chat](https://chat.openai.com/chat)

**Contexto:** Tenía una serie de reglas documentadas:

{% highlight markdown %}
- length: can be an integer or an array. The length of the value must be the one specified.

Valid example, length: [8,9] - '12345678'
Invalid example, length: 8 - '1234567'

- max_length: it is an integer. The maximum length of the value must be the one specified.

Valid example, max_length: 3 - 'abc'
Invalid example, max_length: 3 - 'abcd'

collection: can be alphanumeric, numeric, alphabetical, free or alphanumeric_special_chars. The value must be the collection specified.

Valid example, case: 'numeric' - '123'
Invalid example, case: 'numeric' - '12a'
Valid example, case: 'alphanumeric_special_chars' - '12a, 134'
Invalid example, case: 'alphanumeric_special_chars' - '12 & 34'

The allowed special characters are:

[a-Z][1-9] alphanumeric
? Question mark
( Left parenthesis
) Right parenthesis
. Full stop
, Comma
‘ Single quote
+ Plus sign
Blank
{% endhighlight %}

Había más reglas (dieciseis más) pero por simplicidad no las pongo. El resultado fue el mismo pero con más reglas.

**Prompt:** can you code me a javascript code that validates this rules and return an object of the status an error string, the rules are provided as objects { "collection": "alphanumeric_special_chars", "max_length": 35 }: [LAS REGLAS DEL CONTEXTO]

**Resultado:**

Me generó este código:

{% highlight javascript %}
function validate(value, rules) {
  // Initialize the result object with default values
  let result = {
    isValid: true,
    error: ""
  };

  // Check if the value is too long
  if (rules.max_length && value.length > rules.max_length) {
    result.isValid = false;
    result.error = `The value must not be longer than ${rules.max_length} characters.`;
  }

  // Check if the value is the correct length
  if (rules.length) {
    if (Array.isArray(rules.length)) {
      // If the length is an array, check if the value's length is one of the allowed lengths
      if (!rules.length.includes(value.length)) {
        result.isValid = false;
        result.error = `The value must be ${rules.length.join(" or ")} characters long.`;
      }
    } else {
      // If the length is not an array, check if the value's length matches the given length
      if (value.length !== rules.length) {
        result.isValid = false;
        result.error = `The value must be ${rules.length} characters long.`;
      }
    }
  }

  // Check if the value is in the correct collection
  if (rules.collection) {
    // Define the regular expression for each collection
    let regexes = {
      alphanumeric: /^[a-zA-Z0-9]+$/,
      numeric: /^[0-9]+$/,
      alphabetical: /^[a-zA-Z]+$/,
      free: /^[a-zA-Z0-9?().,'+ ]+$/,
      alphanumeric_special_chars: /^[a-zA-Z0-9?().,'+]+$/
    };

    // Check if the value matches the regular expression for the specified collection
    if (!regexes[rules.collection].test(value)) {
      result.isValid = false;
      result.error = `The value must be a ${rules.collection} collection.`;
    }
  }

  // Return the result object
  return result;
}
{% endhighlight %}

lo interesante vino cuando le dije que generase los tests para ese código en Jest con este prompt: `can you code me the jest tests for that code`. Le cambié los textos de error y me los generó:

{% highlight javascript %}
    test('validates text with length rule', () => {
      let text = '12345678';
      let rules = { length: [8,9] };
      let result = validateInput.text(text, rules);
      expect(result).toEqual({ valid: true, error: null });

      text = '1234567';
      rules = { length: 8 };
      result = validateInput.text(text, rules);
      expect(result).toEqual({ valid: false, error: 'must be of length 8.' });
    });

    test('validates text with max_length rule', () => {
      let text = 'abc';
      let rules = { max_length: 3 };
      let result = validateInput.text(text, rules);
      expect(result).toEqual({ valid: true, error: null });

      text = 'abcd';
      rules = { max_length: 3 };
      result = validateInput.text(text, rules);
      expect(result).toEqual({ valid: false, error: 'must be no longer than 3 characters.' });
    });

    test('validates text with collection rule - numeric', () => {
      let text = '123';
      let rules = { collection: 'numeric' };
      let result = validateInput.text(text, rules);
      expect(result).toEqual({ valid: true, error: null });

      text = '12a';
      rules = { collection: 'numeric' };
      result = validateInput.text(text, rules);
      expect(result).toEqual({ valid: false, error: 'must only contain numbers.' });
    });

    test('validates text with collection rule - alphabetical', () => {
      let text = 'abc';
      let rules = { collection: 'alphabetical' };
      let result = validateInput.text(text, rules);
      expect(result).toEqual({ valid: true, error: null });

      text = '12a';
      rules = { collection: 'alphabetical' };
      result = validateInput.text(text, rules);
      expect(result).toEqual({ valid: false, error: 'must only contain letters.' });
    });

    test('validates text with collection rule - alphanumeric_special_chars', () => {
      let text = '12a, 134';
      let rules = { collection: 'alphanumeric_special_chars' };
      let result = validateInput.text(text, rules);
      expect(result).toEqual({ valid: true, error: null });

      text = '12 & 34';
      rules = { collection: 'alphanumeric_special_chars' };
      result = validateInput.text(text, rules);
      expect(result).toEqual({ valid: false, error: 'must only contain letters, numbers, and the following special characters: ? ( ) ‘ , + .' });
    });

    test('validates text with collection rule - numeric', () => {
      let text = '123';
      let rules = { collection: 'numeric' };
      let result = validateInput.text(text, rules);
      expect(result).toEqual({ valid: true, error: null });

      text = '12a';
      rules = { collection: 'numeric' };
      result = validateInput.text(text, rules);
      expect(result).toEqual({ valid: false, error: 'must only contain numbers.' });
    });

    test('validates text with collection rule - alphabetical', () => {
      let text = 'abc';
      let rules = { collection: 'alphabetical' };
      let result = validateInput.text(text, rules);
      expect(result).toEqual({ valid: true, error: null });

      text = '12a';
      rules = { collection: 'alphabetical' };
      result = validateInput.text(text, rules);
      expect(result).toEqual({ valid: false, error: 'must only contain letters.' });
    });

    test('validates text with collection rule - alphanumeric_special_chars', () => {
      let text = '12a, 134';
      let rules = { collection: 'alphanumeric_special_chars' };
      let result = validateInput.text(text, rules);
      expect(result).toEqual({ valid: true, error: null });

      text = '12 & 34';
      rules = { collection: 'alphanumeric_special_chars' };
      result = validateInput.text(text, rules);
      expect(result).toEqual({ valid: false, error: 'must only contain letters, numbers, and the following special characters: ? ( ) ‘ , + .' });
    });
{% endhighlight %}

Tuve que adaptarlo para que fuese la función de un objeto y que lo aplicase el componente de React pero eso fue rápido. Casi toda la tarea era programar las reglas.

**Conclusión:** Muy útil. En la code review salió que el código era un poco complejo por la complejidad ciclómatica y que podía ser extraido en funciones más pequeñas pero acordamos intentar refactorizarlo con AI también.

</div>

{% include collapsible_fragment_end.html %}
