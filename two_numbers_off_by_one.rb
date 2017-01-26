# Function that takes two numbers as strings and returns true if they are off by one digit
# Use case 1: If we pass '1234' and '1224' (1 digit off in tens place), the function should return true
# Use case 2: If we pass '1234' and '1325' (more than 1 digit off), the function should return false

def compare_numbers(num_1, num_2)
  set_1 = num_1.split("")
  set_2 = num_2.split("")
  off_by_one = 0
  greater_than_one = 0
  comparison_set = set_1.zip(set_2)
  comparison_set.each do |inner|
    if inner[0] != inner[1]
      if (inner[0].to_i - inner[1].to_i).abs == 1
        off_by_one += 1
      elsif (inner[0].to_i - inner[1].to_i).abs > 1
        greater_than_one += 1
      end
    end
  end
  if greater_than_one > 0
    return false
  elsif off_by_one > 0
    return true
  end
end

# puts compare_numbers('1234', '1224')  # true
# puts compare_numbers('1234', '1325')  # true
# puts compare_numbers('1234', '3234')  # false