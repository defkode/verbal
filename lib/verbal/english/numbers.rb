module Verbal
  module English
  # American English
    module Numbers

      EXPONENT_EN = {
        0 => '',
        3 => 'thousand',
        6 => 'million',
        9 => 'billion',
        12 => 'trillion',
        15 => 'quadrillion',
        18 => 'quintillion',
        21 => 'sextillion'
      }

      NUMBERS_EN = {
        0 => 'zero',
        1 => 'one',
        2 => 'two',
        3 => 'three',
        4 => 'four',
        5 => 'five',
        6 => 'six',
        7 => 'seven',
        8 => 'eight',
        9 => 'nine',
        10 => 'ten',
        20 => 'twenty',
        30 => 'thirty',
        40 => 'fourty',
        50 => 'fifty',
        60 => 'sixty',
        70 => 'seventy',
        80 => 'eighty',
        90 => 'ninety',
        11 => 'eleven',
        12 => 'twelve',
        13 => 'thirteen',
        14 => 'fourteen',
        15 => 'fifteen',
        16 => 'sixteen',
        17 => 'seventeen',
        18 => 'eighteen',
        19 => 'nineteen'
      }

      def to_words(value, gender = 0)
        raise 'value must be an integer' unless value.is_a?(Integer)
        @in_words = ''
        Verbal::Core.process_thousands(value).each do |e, v|
          @in_words << "#{v < 100 ? process_tens(v, e) : process_hundreds(v, e)} #{EXPONENT_EN[e]} "
        end
        return @in_words.strip.squeeze(' ')
      end

      def process_hundreds(value, exponent)
      raise IncorrectInputValue unless (100..999).include?(value)
      hundreds_count = value / 100
        if (value % 100) == 0
          return NUMBERS_EN[hundreds_count] + ' hundred'
        else
          return NUMBERS_EN[hundreds_count] + ' hundred  ' + process_tens(value % 100, exponent)
        end
      end

      def process_tens(value, exponent)
        raise IncorrectInputValue unless (0..99).include?(value)
        and_string = exponent > 0 ? '' : 'and '
        return and_string + NUMBERS_EN[value] if value < 9
        return and_string + NUMBERS_EN[(value / 10) * 10] if (value % 10) == 0
        if (11..19).include?(value)
          return and_string + NUMBERS_EN[value]
        else
          return and_string + NUMBERS_EN[(value / 10) * 10] + '-' + NUMBERS_EN[value % 10]
        end
      end

      module_function :to_words, :process_hundreds, :process_tens

    end
  end
end