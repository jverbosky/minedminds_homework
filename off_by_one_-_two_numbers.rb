# Function that takes two numbers as strings and returns true if they are off by one digit
# Use case 1: If we pass '1234' and '1224' (1 digit off in tens place), the function should return true
# Use case 2: If we pass '1234' and '1325' (more than 1 digit off), the function should return false

def compare_numbers(num_1, num_2)
  # regex for numeric strings isn't working - need to research and test more
  if num_1 !=~ /\A\d+\z/ || num_2 !=~ /\A\d+\z/  # return false if either argument is not a numerical string
    return false
  else
    if num_1 == num_2  # return false if the numbers are identical
      return false
    else
      set_1 = num_1.split("")  # convert the first number into an array
      set_2 = num_2.split("")  # convert the second number into an array
      off_by_one = 0  # counter for digits that are off by one compared to the other digit in the pair
      greater_than_one = 0  # counter for digits off by more than one
      comparison_set = set_1.zip(set_2)  # use .zip method to pair up digits in multi-dimensional array
      comparison_set.each do |inner|  # iterate through each inner array (pair of digits) to compare
        if inner[0] != inner[1]  # check if the digits are identical and if they are not...
          if (inner[0].to_i - inner[1].to_i).abs == 1  # check if the digits are off by +/- 1
            off_by_one += 1  # if so, increment the off_by_one counter
          elsif (inner[0].to_i - inner[1].to_i).abs > 1  # check if the digits are off by more than 1
            greater_than_one += 1  # if so, increment the greater_than_one counter
          end  # restart the loop and compare the next pair of digits
        end
      end
      # if at least one digit is off by more than one
      # or if there are multiple digits off by one, return false
      if greater_than_one > 0 || off_by_one > 1
        return false
      # otherwise verify that only one digit is off by one and return true
      elsif off_by_one == 1
        return true
      end
    end
  end
end

# Sandbox testing
puts compare_numbers('test', '1235')  # false
puts compare_numbers('1234', 'word')  # false
puts compare_numbers('test', 'word')  # false
puts compare_numbers('1234', '1235')  # true
puts compare_numbers('1234', '1244')  # true
puts compare_numbers('1234', '1334')  # true
puts compare_numbers('1234', '2234')  # true
puts compare_numbers('1234', '1325')  # false
puts compare_numbers('1234', '3234')  # false
puts compare_numbers('1234', '1234')  # false