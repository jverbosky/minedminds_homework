# Function that takes a ticket number and an array of winning numbers
# Returns an array of all of the winning numbers that are one digit off from the ticket number
# If no winning numbers match this condition, returns false

def compare_number_array(ticket, winning_numbers)
  # return false if arguments passed in are the wrong type
  if ticket.to_i == 0 || winning_numbers.class != Array || winning_numbers == []
    return false
  else
    winning_numbers_off_by_one_digit = []  # array for numbers to return
    winning_numbers.each do |winner|  # iterate through each winning number
      set_1 = winner.split("")  # convert the current winning number into an array
      set_2 = ticket.split("")  # convert the ticket number into an array
      off_by_one = 0  # counter for winning number digits that are off by one compared to ticket number digit
      greater_than_one = 0  # counter for winning number digits off by more than one
      comparison_set = set_1.zip(set_2)  # use .zip method to pair up winning and ticket number digits in multi-d array
      comparison_set.each do |inner|  # iterate through each inner array (pair of digits) to compare
        if inner[0] != inner[1]  # check if the digits are identical and if they are not...
          if (inner[0].to_i - inner[1].to_i).abs == 1  # check if the digits are off by +/- 1
            off_by_one += 1  # if so, increment the off_by_one counter
          elsif (inner[0].to_i - inner[1].to_i).abs > 1  # check if the digits are off by more than 1
            greater_than_one += 1  # if so, increment the greater_than_one counter
          end
        end  # restart the loop and compare the next pair of digits
      end
      # if a single digit is off by one and there are no digits off by more than one
      if off_by_one == 1 && greater_than_one == 0
        winning_numbers_off_by_one_digit.push(winner)  # push the winning number to the appropriate array
      end  # compare the ticket number against the next winning number
    end
    if winning_numbers_off_by_one_digit.length > 0  # if there are winning numbers in the appropriate array
      return winning_numbers_off_by_one_digit  # return the array of desired winning numbers
    else  # or else there are none
      return false  # so return false
    end
  end
end

# Sandbox testing
# print compare_number_array('test', ['9999', '5678', '1235', '1134', '1344'])  # false
# print "\n"
# print compare_number_array('1234', '1235')  # false
# print "\n"
# print compare_number_array('1234', [])  # false
# print "\n"
# print compare_number_array('1234', ['9999', '5678', '1235', '1134', '1344'])  # ['1235', '1134']
# print "\n"
# print compare_number_array('1234', ['1234', '1235', '1236', '1244', '1334'])  # ['1235', '1244', '1334']
# print "\n"
# print compare_number_array('1234', ['2234', '3234', '1335', '1336'])  # ['2234']
# print "\n"
# print compare_number_array('1234', ['1111', '2222', '3333'])  # false
# print "\n"
# print compare_number_array('123456', ['999999', '567890', '123556', '113456', '134456'])  # ['123556', '113456']
# print "\n"