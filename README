== USAGE:

Verbal::Numbers.to_words(123_456_789)
=> "sto dwadzieścia trzy miliony czterysta pięćdziesiąt sześć tysiecy siedemset osiemdziesiąt dziewięć"

# NOTE: accepts only integers, value must be provided in 'grosze' 1zł = 100gr
Verbal::Currency.to_words(123_456_78900, 'PLN')
=> "sto dwadzieścia trzy miliony czterysta pięćdziesiąt sześć tysiecy siedemset osiemdziesiąt dziewięć złotych zero groszy"


== CHANGELOG:
25/07/2008:  currency_in_words now recognizes grammatical gender of currency
             '2 PLN' => dwa złote, but '2 SKK' => dwie korony słowackie (not 'dwa korony słowackie')
25/07/2008:  Changed squish method to strip (as squish is specific for Rails)
             Added TODO tasks
