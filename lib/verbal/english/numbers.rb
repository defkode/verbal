module Verbal
  module English

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
        40 => 'forty',
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

      def to_words(value)
        raise 'value must be an integer' unless value.is_a?(Integer)
        @exponent            = Verbal::Core::exponent(value)
        @extracted_exponents = Verbal::Core::process_thousands(value)
        @in_words = ''
        @extracted_exponents.each do |e, v|
          @in_words << "#{process_hundreds(v, e, @exponent)} #{EXPONENT_EN[e]} "
        end
        return @in_words.strip.squeeze(' ')
      end

      def process_hundreds(value, current_exponent, value_exponent)
      raise 'value should be in range: 0.999' unless (0..999).include?(value)
        if value > 100

          hundreds_count = value / 100
          if value % 100 == 0
            return NUMBERS_EN[hundreds_count] + ' hundred'
          else
            prefix = "#{(value_exponent != 0 && current_exponent == 0) ? ' and ': ''}"
            return NUMBERS_EN[hundreds_count] + ' hundred  ' + process_tens(value % 100, prefix)
          end

        else
          prefix = "#{(value_exponent != 0 && current_exponent == 0) ? ' and ': ''}"
          return process_tens(value % 100, prefix)
        end
      end

      def process_tens(value, prefix)
        raise 'value should be in range: 0..99' unless (0..99).include?(value)
        case value
        when 0..9
          return prefix + NUMBERS_EN[value]
        when (value % 10) == 0
          return prefix + NUMBERS_EN[(value / 10) * 10]
        when 11..19
          return prefix + NUMBERS_EN[value]
        else
          return prefix + NUMBERS_EN[(value / 10) * 10] + '-' + NUMBERS_EN[value % 10]
        end
      end

      module_function :to_words, :process_hundreds, :process_tens

    end
  end
end