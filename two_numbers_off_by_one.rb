# Function that takes two numbers as strings and returns true if they are off by one digit
# Use case 1: If we pass '1234' and '1224' (1 digit off in tens place), the function should return true
# Use case 2: If we pass '1234' and '1325' (more than 1 digit off), the function should return false

number_1 = '1234'
number_2 = '1224'
number_3 = '1325'

def compare_numbers(num_1, num_2)
  set_1 = num_1.split("")
  print "\n"
  puts "Beginning comparison..."
  print set_1
  print "\n"
  set_2 = num_2.split("")
  print set_2
  print "\n"
  compare = set_1 & set_2
  print compare
  print "\n"
end

compare_numbers(number_1, number_2)
compare_numbers(number_1, number_3)