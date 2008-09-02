module Verbal
  
  VERSION = '1.0.0'

  module Core

    def exponent(value)
      ((value.to_s.length - 1) / 3) * 3
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

    module_function :process_thousands, :exponent

  end
end