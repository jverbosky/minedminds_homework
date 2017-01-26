# Function that takes two numbers as strings and returns true if they are off by one digit
# Use case 1: If we pass '1234' and '1224' (1 digit off in tens place), the function should return true
# Use case 2: If we pass '1234' and '1325' (more than 1 digit off), the function should return false

# def compare_number_array(ticket, winning_numbers)


#   if num_1 == num_2
#     return false
#   else
#     set_1 = num_1.split("")
#     set_2 = num_2.split("")
#     off_by_one = 0
#     greater_than_one = 0
#     comparison_set = set_1.zip(set_2)
#     comparison_set.each do |inner|
#       if inner[0] != inner[1]
#         if (inner[0].to_i - inner[1].to_i).abs == 1
#           off_by_one += 1
#         elsif (inner[0].to_i - inner[1].to_i).abs > 1
#           greater_than_one += 1
#         end
#       end
#     end
#     if greater_than_one > 0
#       return false
#     elsif off_by_one > 0
#       return true
#     end
#   end
# end

# Sandbox testing in progress...

winning_numbers = ['9999', '5678', '1235', '1134', '1344']
ticket = '1234'

winning_numbers_off_by_one_digit = []
same_number = 0
off_by_one = 0
greater_than_one = 0
count = 0

winning_numbers.each do |winner|
  if winner == ticket
    same_number += 1
  else
    set_1 = winner.split("")
    set_2 = ticket.split("")
    puts "Iteration count: #{count}"
    print "Set 1: #{set_1}"
    print "\n"
    print "Set 2: #{set_2}"
    print "\n"
    count += 1

    # off_by_one = 0
    # greater_than_one = 0
    comparison_set = set_1.zip(set_2)
    puts "Comparison set:"
    print comparison_set
    print "\n"
    comparison_set.each do |inner|
      if inner[0] != inner[1]
        if (inner[0].to_i - inner[1].to_i).abs == 1
          off_by_one += 1
        elsif (inner[0].to_i - inner[1].to_i).abs > 1
          greater_than_one += 1
        end
      end
    end
    # if greater_than_one > 0
    #   return false
    # elsif off_by_one > 1
    #   return false
    # elsif off_by_one == 1
    #   winning_numbers_off_by_one_digit.push(winner)
    # end
  end
end

#puts same_number
#print winning_numbers_off_by_one_digit

# Sandbox testing
# puts compare_number_array('1234', ['9999', '5678', '1235', '1134', '1344'])  # ['1235', '1134']
# puts compare_number_array('1234', ['1234', '1235', '1236', '1244', '1334'])  # ['1235', '1244', '1334']
# puts compare_number_array('1234', ['2234', '3234', '1335', '1336'])  # ['2234']
# puts compare_number_array('1234', ['1111', '2222', '3333'])  # []

# off_by_one_-_two_numbers function (for reference)

# def compare_number_array(ticket, winning_numbers)
  # if num_1 == num_2
  #   return false
  # else
  #   set_1 = num_1.split("")
  #   set_2 = num_2.split("")
  #   off_by_one = 0
  #   greater_than_one = 0
  #   comparison_set = set_1.zip(set_2)
  #   comparison_set.each do |inner|
  #     if inner[0] != inner[1]
  #       if (inner[0].to_i - inner[1].to_i).abs == 1
  #         off_by_one += 1
  #       elsif (inner[0].to_i - inner[1].to_i).abs > 1
  #         greater_than_one += 1
  #       end
  #     end
  #   end
  #   if greater_than_one > 0
  #     return false
  #   elsif off_by_one > 0
  #     return true
  #   end
  # end
# end

# Sandbox testing
# puts compare_number_array('1234', ['9999', '5678', '1235', '1134', '1344'])  # ['1235', '1134']
# puts compare_number_array('1234', ['1234', '1235', '1236', '1244', '1334'])  # ['1235', '1244', '1334']
# puts compare_number_array('1234', ['2234', '3234', '1335', '1336'])  # ['2234']
# puts compare_number_array('1234', ['1111', '2222', '3333'])  # []