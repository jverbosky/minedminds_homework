# 2016.01.13 Mined Minds webdev homework
#
# Variations to print 1 - 100 to the screen
#
# If number is divisible by 3, replace number with "Mined"
# If number is divisible by 5, replace number with "Minds"
# If number is divisible by 3 & 5 (15), replace number with "Mined Minds"

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

# Single line version of if_else() using semi-colons to continue
# Demo-only - not the most readable
def one_liner()
  for num in 1..100; if num % 3 == 0 && num % 5 == 0; puts "Mined Minds"; elsif num % 3 == 0; puts "Mined"; elsif num % 5 == 0; puts "Minds"; else puts num; end; end
end

# A variation using one line for conditional statement via chained logical operators
# Has more of a SQL feel to it (where ___ or ___ or ___)
def log_ops()
  for num in 1..100
    num = ("Mined Minds" if num % 3 == 0 && num % 5 == 0) || ("Mined" if num % 3 == 0) || ("Minds" if num % 5 == 0) || num
    puts num
  end
end

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

# Method to prompt user for method to use
def user_input()
  puts "\nMethod 1 - If/Else"
  puts "Method 2 - Single Line If/Else"
  puts "Method 3 - Chained Logical Operators"
  puts "Method 4 - Lambdas + Case Statement"
  print "\nSelect a method number and press Enter:"
  input = gets.chomp
  method_selection(input)
end

# Method to run selected method or reprompt for valid selection
# Not perfect - if input contains two valid numbers
# will execute lowest valid number specified
# Ex: If "23" is entered, method 2 will run
# Need to think more about this edge case...
def method_selection(selection)
  if selection.include? "1"
    puts "\nRunning Method 1 - If/Else..."
    puts "\n"
    if_else()
  elsif selection.include? "2"
    puts "\nRunning Method 2 - Single Line If/Else..."
    puts "\n"
    one_liner()
  elsif selection.include? "3"
    puts "\nRunning Method 3 - Chained Logical Operators..."
    puts "\n"
    log_ops()
  elsif selection.include? "4"
    puts "\nRunning Method 4 - Lambdas + Case Statement..."
    puts "\n"
    lambda_case()
  else
    puts "\nNo valid method number specified - please try again."
    user_input()
  end
end

user_input()