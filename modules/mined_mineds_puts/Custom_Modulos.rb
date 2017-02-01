# Module for custom modulo methods
# Required by Method_Variations.rb module

module Custom_Modulos

  # Custom modulo method that targets remainder after float division
  def Custom_Modulos.evenly_divisible(dividend, divisor)
    quotient = dividend.to_f / divisor
    remainder = quotient - quotient.to_int
    if remainder > 0
      return false
    else
      return true
    end
  end

  # Custom modulo method that uses base conversion and index slicing
  def Custom_Modulos.base_slice(number, base)
    converted = number.to_s(base)
    ones_place = converted[-1]
    if ones_place.to_i == 0
      return true
    else
      return false
    end
  end

end