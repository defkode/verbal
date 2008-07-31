module Verbal

  module Currency

    # Grammatical Gender
    # http://en.wikipedia.org/wiki/Grammatical_gender#Masculine.2C_feminine.2C_and_neuter
    # 0 - masculine, 1 - feminine, 2 - neuter

    CURRENCIES = {
      'PLN' => [['złoty','złote','złotych'], ['grosz','grosze','groszy'], [0, 0]],
      'THB' => [['bat','baty','batów'], ['satang','satangi','satangów'], [0, 0]],
      'USD' => [['dolar amerykański','dolary amerykańskie','dolarów amerykańskich'], ['cent','centy','centów'], [0, 0]],
      'AUD' => [['dolar australijski','dolary australijskie','dolarów australijskich'], ['cent','centy','centów'], [0, 0]],
      'HKD' => [['dolar Hongkongu','dolary Hongkongu','dolarów Hongkongu'], ['cent','centy','centów'], [0, 0]],
      'CAD' => [['dolar kanadyjski','dolary kanadyjskie','dolarów kanadyjskich'], ['cent','centy','centów'], [0, 0]],
      'NZD' => [['dolar nowozelandzki','dolary nowozelandzkie','dolarów nowozelandzkich'], ['cent','centy','centów'], [0, 0]],
      'SGD' => [['dolar singapurski','dolary singapurskie','dolarów singapurskich'], ['cent','centy','centów'], [0, 0]],
      'EUR' => [['euro','euro','euro'], ['eurocent', 'eurocenty', 'eurocentów'], [2, 0]],
      'HUF' => [['forint','forinty','forintów'], ['filler','fillery','fillerów'], [0, 0]],
      'CHF' => [['frank szwajcarski','franki szwajcarskie','franków szwajcarskich'], ['rapp','rappy','rappów'], [0, 0]],
      'GBP' => [['funt szterling','funty szterlingi','funtów szterlingów'], ['pens','pensy','pensów'], [0, 0]],
      'UAH' => [['hrywna','hrywny','hrywien'], ['kopiejka','kopiejki','kopiejek'], [1, 1]],
      'JPY' => [['jen','jeny','jenów'], ['sen','seny','senów'], [0, 0]],
      'CZK' => [['korona czeska','korony czeskie','koron czeskich'], ['halerz','halerze','halerzy'], [1, 0]],
      'DKK' => [['korona duńska','korony duńskie','koron duńskich'], ['ore','ore','ore'], [1, 2]],
      'EEK' => [['korona estońska', 'korony estońskie','koron estońskich'], ['senti','senti','senti'], [1, 0]],
      'ISK' => [['korona islandzka','korony islandzkie','koron islandzkie'], ['aurar','aurar','aurar'], [1, 0]],
      'NOK' => [['korona norweska','korony norweskie','koron norweskich'], ['oere','oere','oere'], [1, 2]],
      'SKK' => [['korona słowacka','korony słowackie','koron słowackich'], ['halerz','halerze','halerzy'], [1, 0]],
      'SEK' => [['korona szwedzka','korony szwedzkie','koron szwedzkich'], ['oere','oere','oere'], [1, 2]],
      'HRK' => [['kuna','kuny','kun'], ['lipa','lipy','lip'], [1, 1]],
      'RON' => [['lej rumuński','leje rumuńskie','lejów rumuńskich'], ['bani','bani','bani'], [0, 2]],
      'BGN' => [['lew bułgarski','lewy bułgarskie','lewów bułgarskich'], ['stotinka','stotinki','stotinek'], [0, 1]],
      'TRY' => [['lira turecka','liry tureckie','lir tureckich'], ['gurusz','gurusze','guruszy'], [1, 0]],
      'LTL' => [['lit litewski','lity litewskie','litów litewskich'], ['sen','seny','senów'], [0, 0]],
      'LVL' => [['łat łotewski','łaty łotewskie','łatów łotewskich'], ['sentim','sentimy','sentimów'], [0, 0]],
      'PHP' => [['peso filipińskie','peso filipińskie','peso filipińskich'], ['centavos','centavos','centavos'], [2, 2]],
      'MXN' => [['peso meksykańskie','peso meksykańskie','peso meksykańskich'], ['centavos','centavos','centavos'], [2, 2]],
      'ZAR' => [['rand','randy','randów'], ['cent','centy','centów'], [0, 0]],
      'BRL' => [['real brazylijski','reale brazylijskie','realów brazylijskich'], ['centavos','centavos','centavos'], [0, 2]],
      'MYR' => [['ringgit malezyjski','ringgity malezyjskie','ringgitów malezyjskich'], ['sen','seny','senów'], [0, 0]],
      'RUB' => [['rubel','ruble','rubli'], ['kopiejka','kopiejki','kopiejek'], [0, 1]],
      'IDR' => [['rupia','rupie','rupii'], ['sen','seny','senów'], [1, 0]],
      'KRW' => [['won','wony','wonów'], ['dzon','dzony','dzonów'], [0, 0]],
      'CNY' => [['yuan renminbi','yuany renminbi','yuanów renminbi'], ['fen','feny','fenów'], [0, 0]],
    }


    def to_words(value, symbol = 'PLN')
      raise 'must be an integer' unless value.is_a?(Integer)
      raise 'currency is not in the list' unless CURRENCIES.include?(symbol)

      "#{Verbal::Numbers.to_words(value / 100, CURRENCIES[symbol][2][0])} #{CURRENCIES[symbol][0][Verbal::Numbers.variation(value / 100)]}" + " " + "#{Verbal::Numbers.to_words(value % 100, CURRENCIES[symbol][2][1])} #{CURRENCIES[symbol][1][Verbal::Numbers.variation(value % 100)]}"
    end

    module_function :to_words

  end
end