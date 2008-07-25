module Verbal

  module Currency

    # Grammatical Gender
    # http://en.wikipedia.org/wiki/Grammatical_gender#Masculine.2C_feminine.2C_and_neuter
    # 0 - neuter or masculine, 1 - feminine

    CURRENCIES = {
      'PLN' => [['złoty','złote','złotych'], ['grosz','grosze','groszy'], [0, 0]],
      'USD' => [['dolar','dolary','dolarów'], ['cent','centy','centów'], [0, 0]],
      'EUR' => [['euro','euro','euro'], ['eurocent', 'eurocenty', 'eurocentów'], [0, 0]],
      'CZK' => [['korona czeska','korony czeskie','koron czeskich'], ['halerz','halerze','halerzy'], [1, 0]],
      'CHF' => [['frank szwajcarski','franki szwajcarskie','franków szwajcarskich'], ['rapp','rappy','rappów'], [0, 0]],
      'GBP' => [['funt szterling','funty szterlingi','funtów szterlingów'], ['pens','pensy','pensów'], [0, 0]],
      'JPY' => [['jen','jeny','jenów'], ['sen','seny','senów'], [0, 0]],
      'RUB' => [['rubel','ruble','rubli'], ['kopiejka','kopiejki','kopiejek'], [0, 1]],
      'SEK' => [['korona szwedzka','korony szwedzkie','koron szwedzkich'], ['oere','oere','oere'], [1, 0]],
      'SKK' => [['korona słowacka','korony słowackie','koron słowackich'], ['halerz','halerze','halerzy'], [1, 0]],
      }

    def to_words(value, symbol = 'PLN')
      raise 'must be an integer' unless value.is_a?(Integer)
      raise 'currency is not in the list' unless CURRENCIES.include?(symbol)

      "#{Verbal::Numbers.to_words(value / 100, CURRENCIES[symbol][2][0])} #{CURRENCIES[symbol][0][Verbal::Numbers.variation(value / 100)]}" + " " + "#{Verbal::Numbers.to_words(value % 100, CURRENCIES[symbol][2][1])} #{CURRENCIES[symbol][1][Verbal::Numbers.variation(value % 100)]}"
    end

    module_function :to_words

  end
end