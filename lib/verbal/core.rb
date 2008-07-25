module Verbal

  module Numbers


    EXPONENT = {
      0 => ['', '', ''],
      3 => ['tysiac','tysiace','tysiecy'],
      6 => ['milion','miliony','milionow'],
      9 => ['miliard','miliardy','miliardów'],
      12 => ['bilion','biliony','bilionów'],
      15 => ['biliard','biliardy','biliardów'],
      18 => ['trylion','tryliony','trylionów'],
      21 => ['tryliard','tryliardy','tryliardów']
    }

    NUMBERS = {
      0 => 'zero',
      1 => 'jeden',
      2 => ['dwa', 'dwie'],
      3 => 'trzy',
      4 => 'cztery',
      5 => 'pięć',
      6 => 'sześć',
      7 => 'siedem',
      8 => 'osiem',
      9 => 'dziewięć',
      10 => 'dziesięć',
      20 => 'dwadzieścia',
      30 => 'trzydzieści',
      40 => 'czterdzieści',
      50 => 'pięćdziesiąt',
      60 => 'sześćdziesiąt',
      70 => 'siedemdziesiąt',
      80 => 'osiemdziesiąt',
      90 => 'dziewięćdziesiąt',
      11 => 'jedenaście',
      12 => 'dwanaście',
      13 => 'trzynaście',
      14 => 'czternaście',
      15 => 'piętnaście',
      16 => 'szesnaście',
      17 => 'siedemnaście',
      18 => 'osiemnaście',
      19 => 'dziewiętnaście',
      100 => 'sto',
      200 => 'dwieście',
      300 => 'trzysta',
      400 => 'czterysta',
      500 => 'pięćset',
      600 => 'sześćset',
      700 => 'siedemset',
      800 => 'osiemset',
      900 => 'dziewięćset'
    }

    def to_words(value, gender = 0)
      raise 'value must be an integer' unless value.is_a?(Integer)
      return NUMBERS[0] if value == 0
      @in_words = ''
      process_thousands(value).each do |e, v|
        # jesli 1_000 to 'tysiac' zamiast 'jeden tysiac'
        @in_words << "#{(e != 0 && v == 1)? '': process_number(v, gender)} #{EXPONENT[e][variation(v)]} "
      end
      return @in_words.strip.squeeze
    end

    def variation(value)
      return 0 if value == 1
      return 2 if (11..19).include?(value % 100)
      ((value % 10) >= 2 && (value % 10) < 5) ? 1 : 2
    end

    def exponent(value)
      ((value.to_s.length - 1) / 3) * 3
    end

    def process_number(value, gender)
      value < 100 ? process_tens(value, gender) : process_hundreds(value, gender)
    end

    def process_thousands(value)
      e  = exponent(value)
      readable_slices = []
      while e > 0
        remainder ||= value
        readable_slices << [e, (remainder / 10**e)]
        remainder = remainder % 10**e
        e -= 3
      end
      readable_slices << [0, value % 10**3]
      return readable_slices.sort.reverse.delete_if {|k, v| v.zero?}
    end

    def process_hundreds(value, gender)
    raise 'value is in incorrect range' unless (100..999).include?(value)
      if (value % 100) == 0
        return NUMBERS[value]
      else
        return NUMBERS[(value / 100) * 100] + ' ' + process_tens(value % 100, gender)
      end
    end

    def process_tens(value, gender)
      raise 'value is in incorrect range' unless (1..99).include?(value)
      return NUMBERS[value][gender] if value == 2
      return NUMBERS[value] if value < 9
      return NUMBERS[(value / 10) * 10] if (value % 10) == 0
      if (11..19).include?(value)
      return NUMBERS[value]
      else
        return NUMBERS[(value / 10) * 10] + ' ' + NUMBERS[value % 10]
      end
    end

    module_function :to_words, :variation, :exponent, :process_number, :process_thousands, :process_hundreds, :process_tens

  end
end