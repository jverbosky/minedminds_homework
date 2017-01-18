# Module for method variations
# Required by Method_Select.rb module

# Load the Custom_Modulos module in the same directory
$LOAD_PATH << '.'
require "Custom_Modulos.rb"

module Method_Variations

  # Method 1
  # "Standard" version using if/elsif/else construct
  def Method_Variations.if_else()
    for num in 1..100
      if num % 3 == 0 && num % 5 == 0
        puts "Mined Minds"
      elsif num % 3 == 0
        puts "Mined"
      elsif num % 5 == 0
        puts "Minds"
      else
        puts num
      end
    end
  end

  # Method 2
  # Single line version of if_else() using semi-colons to continue
  # Demo-only - not the most readable
  def Method_Variations.one_liner()
    for num in 1..100; if num % 3 == 0 && num % 5 == 0; puts "Mined Minds"; elsif num % 3 == 0; puts "Mined"; elsif num % 5 == 0; puts "Minds"; else puts num; end; end
  end

  # Method 3
  # A variation using one line for conditional statement via chained logical operators
  # Has more of a SQL feel to it (where ___ or ___ or ___)
  def Method_Variations.log_ops()
    for num in 1..100
      num = ("Mined Minds" if num % 3 == 0 && num % 5 == 0) || ("Mined" if num % 3 == 0) || ("Minds" if num % 5 == 0) || num
      puts num
    end
  end

  # Method 4
  # A variation using lambda literals with a case statement
  def Method_Variations.lambda_case()
    div_3 = ->(x) { x % 3 == 0 }
    div_5 = ->(x) { x % 5 == 0 }
    div_15 = ->(x) { x % 15 == 0 }
    for num in 1..100
      case num
        when div_15 then puts "Mined Minds"
        when div_3 then puts "Mined"
        when div_5 then puts "Minds"
        else puts num
      end
    end
  end

  # Method 5
  # A variation that uses a custom method to determine divisibility
  # instead of the modulo operator

  def Method_Variations.custom_modulo()
    for num in 1..100
      if Custom_Modulos.evenly_divisible(num, 3) && Custom_Modulos.evenly_divisible(num, 5)
        puts "Mined Minds"
      elsif Custom_Modulos.evenly_divisible(num, 3)
        puts "Mined"
      elsif Custom_Modulos.evenly_divisible(num, 5)
        puts "Minds"
      else
        puts num
      end
    end
  end

  # Method 6
  # A variation that uses list comprehension and map method to populate an array
  def Method_Variations.list_comprehension()
    values = []
    (1..100).each { |num| values.push(num) }
    values.map! { |value| (value % 3 != 0 || value % 5 != 0) ? value : "Mined Minds" }
    values.map! { |value| value % 3 != 0 ? value : "Mined" }
    values.map! { |value| value % 5 != 0 ? value : "Minds" }
    puts values
  end

  # Method 7
  # Another variation that uses a custom modulo method which converts each number
  # to a different base (base3, base5) and then evaluates the rightmost digit (slice)
  # to assess for divisibility
  def Method_Variations.base_conversion()
    for num in 1..100
      if Custom_Modulos.base_slice(num, 3) && Custom_Modulos.base_slice(num, 5)
        puts "Mined Minds"
      elsif Custom_Modulos.base_slice(num, 3)
        puts "Mined"
      elsif Custom_Modulos.base_slice(num, 5)
        puts "Minds"
      else
        puts num
      end
    end
  end

end