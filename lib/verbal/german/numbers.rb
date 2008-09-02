module Verbal
  module German
  # German (deutsch)
    module Numbers

      EXPONENT_DE = {
        0 => '',
        3 => 'tausend',
        6 => 'million',
        9 => 'milliarde',
        12 => 'billion',
        15 => 'billiarde',
        18 => 'trillion',
        21 => 'trilliarde'
      }

      NUMBERS_DE = {
        0 => 'null',
        1 => 'eins',
        2 => 'zwei',
        3 => 'drei',
        4 => 'vier',
        5 => 'fünf',
        6 => 'sechs',
        7 => 'sieben',
        8 => 'acht',
        9 => 'neun',
        10 => 'zehn',
        20 => 'zwanzig',
        30 => 'dreißig',
        40 => 'vierzig',
        50 => 'fünfzig',
        60 => 'sechzig',
        70 => 'siebzig',
        80 => 'achtzig',
        90 => 'neunzig',
        11 => 'elf',
        12 => 'zwölf',
        13 => 'dreizehn',
        14 => 'vierzehn',
        15 => 'fünfzehn',
        16 => 'sechzehn',
        17 => 'siebzehn',
        18 => 'achtzehn',
        19 => 'neunzehn'
      }


      def to_words(value, gender = 0)
        raise 'value must be an integer' unless value.is_a?(Integer)
        @in_words = ''
        process_thousands(value).each do |exp, val|
          @in_words << if val < 100
            process_tens(val, exp)
          else
            process_hundreds(val, exp) + EXPONENT_DE[e]
          end
        end
        return @in_words.strip.squeeze('')
      end


      def process_tens(value, exponent)
        raise IncorrectInputValue unless (0..99).include?(value)
        and_string = '' #exponent > 0 ? '' : 'und'
        case value
        when 0..9
          return and_string + NUMBERS_DE[value]          
        when (value % 10) == 0
          return and_string + NUMBERS_DE[(value / 10) * 10]
        when 11..19
          return and_string + NUMBERS_DE[value]
        else
          return and_string + NUMBERS_DE[(value / 10) * 10] + NUMBERS_DE[value % 10]
        end
      end


      def process_hundreds(value, exponent)
        raise IncorrectInputValue unless (100..999).include?(value)
        hundreds_count = value / 100
        if (value % 100) == 0
          return handle_eins_problem(hundreds_count) + 'hundert'
        else
          return handle_eins_problem(hundreds_count) + 'hundert' + process_tens(value % 100, exponent)
        end
      end

      def process_thousands(value)
        exp  = exponent(value)
        readable_slices = []
        while exp > 0
          remainder ||= value
          readable_slices << [exp, (remainder / 10**exp)]
          remainder = remainder % 10**exp
          exp -= 3
        end
        readable_slices << [0, value % 10**3]
        return readable_slices.sort.reverse.delete_if {|k, v| v.zero?}
      end
      
      module_function :to_words, :process_thousands, :process_hundreds, :process_tens

  private
      def self.handle_eins_problem(value)
        value == 1 ? 'ein' : NUMBERS_DE[value]
      end
      

    end
  end
end