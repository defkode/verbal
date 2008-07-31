== INSTALL:

script/plugin install git://github.com/tomaszmazur/verbal.git

== USAGE:

NUMBERS:

Verbal::Polish::Numbers.to_words(123_456_789)
=> "sto dwadzieścia trzy miliony czterysta pięćdziesiąt sześć tysiecy siedemset osiemdziesiąt dziewięć"

NOTE: It's American English numbering system 
http://www.mazes.com/AmericanNumberingSystem.html

Verbal::English::Numbers.to_words(123_456_789)
=> "one hundred twenty-three million four hundred fifty-six thousand seven hundred and eighty-nine"

CURRENCIES:

Verbal::Polish::Currency.to_words(123_456_789_00, 'PLN')
=> "sto dwadzieścia trzy miliony czterysta pięćdziesiąt sześć tysiecy siedemset osiemdziesiąt dziewięć złotych zero groszy"

No Support for Verbal::English::Currency yet... Anybody?