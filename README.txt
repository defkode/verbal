== INSTALL:

script/plugin install git://github.com/tomaszmazur/verbal.git


== USAGE:

Verbal::Numbers.to_words(123_456_789)
=> "sto dwadzieścia trzy miliony czterysta pięćdziesiąt sześć tysiecy siedemset osiemdziesiąt dziewięć"

# NOTE: accepts only integers, value must be provided in 'grosze' 1zł = 100gr
Verbal::Currency.to_words(123_456_789_00, 'PLN')
=> "sto dwadzieścia trzy miliony czterysta pięćdziesiąt sześć tysiecy siedemset osiemdziesiąt dziewięć złotych zero groszy"


