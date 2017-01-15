# 2016.01.13 Mined Minds webdev homework
#
# Variations to print 1 - 100 to the screen
#
# If number is divisible by 3, replace number with "Mined"
# If number is divisible by 5, replace number with "Minds"
# If number is divisible by 3 & 5 (15), replace number with "Mined Minds"

# Method 1
# "Standard" version using if/elsif/else construct
def if_else()
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
def one_liner()
  for num in 1..100; if num % 3 == 0 && num % 5 == 0; puts "Mined Minds"; elsif num % 3 == 0; puts "Mined"; elsif num % 5 == 0; puts "Minds"; else puts num; end; end
end

# Method 3
# A variation using one line for conditional statement via chained logical operators
# Has more of a SQL feel to it (where ___ or ___ or ___)
def log_ops()
  for num in 1..100
    num = ("Mined Minds" if num % 3 == 0 && num % 5 == 0) || ("Mined" if num % 3 == 0) || ("Minds" if num % 5 == 0) || num
    puts num
  end
end

# Method 4
# A variation using lambda literals with a case statement
def lambda_case()
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
def evenly_divisible(dividend, divisor)
  quotient = dividend.to_f / divisor
  remainder = quotient - quotient.to_int
  if remainder > 0
    return false
  else
    return true
  end
end

def custom_modulo()
  for num in 1..100
    if evenly_divisible(num, 3) && evenly_divisible(num, 5)
      puts "Mined Minds"
    elsif evenly_divisible(num, 3)
      puts "Mined"
    elsif evenly_divisible(num, 5)
      puts "Minds"
    else
      puts num
    end
  end
end

# Method 6
# A variation that uses list comprehension and map method to populate an array
def list_comprehension()
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
def base_slice(number, base)
  converted = number.to_s(base)
  ones_place = converted[-1]
  if ones_place.to_i == 0
    return true
  else
    return false
  end
end

def base_conversion()
  for num in 1..100
    if base_slice(num, 3) && base_slice(num, 5)
      puts "Mined Minds"
    elsif base_slice(num, 3)
      puts "Mined"
    elsif base_slice(num, 5)
      puts "Minds"
    else
      puts num
    end
  end
end

# Method to prompt user for method to use
def user_input()
  puts "\nMethod 1 - If/Else"
  puts "Method 2 - Single Line If/Else"
  puts "Method 3 - Chained Logical Operators"
  puts "Method 4 - Lambdas + Case Statement"
  puts "Method 5 - Custom Modulo"
  puts "Method 6 - List Comprehension"
  puts "Method 7 - Base Conversion"
  print "\nSelect a method number and press Enter:"
  input = gets.chomp
  method_selection(input)
end

# Method to run selected method or reprompt for valid selection
def method_selection(selection)
  # Array intersection used to detect
  # if multiple method numbers entered
  valid_methods = ["1", "2", "3", "4", "5", "6", "7"]
  compare = selection.split("")
  intersection = valid_methods & compare
  if intersection.size > 1
    puts "\nMultiple valid method numbers specified - please try again."
    user_input()
  elsif selection.include? "1"
    puts "\nYour input contained '1' - running Method 1 - If/Else..."
    puts "\n"
    if_else()
  elsif selection.include? "2"
    puts "\nYour input contained '2' - running Method 2 - Single Line If/Else..."
    puts "\n"
    one_liner()
  elsif selection.include? "3"
    puts "\nYour input contained '3' - running Method 3 - Chained Logical Operators..."
    puts "\n"
    log_ops()
  elsif selection.include? "4"
    puts "\nYour input contained '4' - running Method 4 - Lambdas + Case Statement..."
    puts "\n"
    lambda_case()
  elsif selection.include? "5"
    puts "\nYour input contained '5' - running Method 5 - Custom Modulo..."
    puts "\n"
    custom_modulo()
  elsif selection.include? "6"
    puts "\nYour input contained '6' - running Method 6 - List Comprehension..."
    puts "\n"
    list_comprehension()
  elsif selection.include? "7"
    puts "\nYour input contained '7' - running Method 7 - Base Conversion..."
    puts "\n"
    base_conversion()
  else
    puts "\nNo valid method number specified - please try again."
    user_input()
  end
end

user_input()