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
  test_input(input)
end

# Method to evaluate user input for multiple or invalid method numbers
def test_input(selection)
  valid_methods = ["1", "2", "3", "4", "5", "6", "7"]
  compare = selection.split("")
  intersection = valid_methods & compare
  if intersection.size > 1
    puts "\nYour input contained multiple valid method numbers - please try again."
    user_input()
  elsif intersection.empty? == false
    user_selection(intersection.join)
  else
    puts "\nNo valid method number specified - please try again."
    user_input()
  end
end

# Method to confirm user input and advise on method being run
def user_selection(method)
  methods_text = { 
    "1" => "1 - If/Else...",
    "2" => "2 - Single Line If/Else...",
    "3" => "3 - Chained Logical Operators...",
    "4" => "4 - Lambdas + Case Statement...",
    "5" => "5 - Custom Modulo...",
    "6" => "6 - List Comprehension...",
    "7" => "7 - Base Conversion..."
  }
  puts "\nYour input contained '#{method}' - running Method #{methods_text[method]}"
  puts "\n"
  run_method(method)
end

# Method to run the selected method
def run_method(item)
  case item
    when "1" then if_else()
    when "2" then one_liner()
    when "3" then log_ops()
    when "4" then lambda_case()
    when "5" then custom_modulo()
    when "6" then list_comprehension()
    when "7" then base_conversion()    
  end
end

user_input()