= verbal

  http://trix.lighthouseapp.com/projects/14763-verbal

== DESCRIPTION:

  Converts numbers to words (its text presentation)
  Currently supported languages are:

  - English *
  - Polish

  NOTE: It's American English numbering system
  http://www.mazes.com/AmericanNumberingSystem.html

== FEATURES/PROBLEMS:



== SYNOPSIS:

1) NUMBERS:

  Verbal::Polish::Numbers.to_words(123_456_789)
  => "sto dwadzieścia trzy miliony czterysta pięćdziesiąt sześć tysiecy siedemset osiemdziesiąt dziewięć"

  Verbal::English::Numbers.to_words(123_456_789)
  => "one hundred twenty-three million four hundred fifty-six thousand seven hundred and eighty-nine"

  2) CURRENCIES:

  Verbal::Polish::Currency.to_words(123_456_789_00, 'PLN')
  => "sto dwadzieścia trzy miliony czterysta pięćdziesiąt sześć tysiecy siedemset osiemdziesiąt dziewięć złotych zero groszy"

  No Support for Verbal::English::Currency yet... Anybody?

== REQUIREMENTS:



== INSTALL:

  sudo gem install verbal

  or

  script/plugin install git://github.com/tomaszmazur/verbal.git

== LICENSE:

(The MIT License)

Copyright (c) 2008 Tomasz Mazur

Permission is hereby granted, free of charge, to any person obtaining
a copy of this software and associated documentation files (the
'Software'), to deal in the Software without restriction, including
without limitation the rights to use, copy, modify, merge, publish,
distribute, sublicense, and/or sell copies of the Software, and to
permit persons to whom the Software is furnished to do so, subject to
the following conditions:

The above copyright notice and this permission notice shall be
included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED 'AS IS', WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY
CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
