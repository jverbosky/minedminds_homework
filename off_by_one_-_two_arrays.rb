# Functions that takes an array of ticket numbers and an array of winning numbers
# 1) Returns an array of ticket numbers that exactly match the winning numbers
# 2) Returns an array of all of the winning numbers that are one digit off from the ticket number
# 3) Returns an array of all of the winning numbers that do not meet the first two conditions

# def find_winning_ticket_numbers(ticket_numbers, winning_numbers)
#   winning_numbers_match = []  # array for winning numbers that match ticket numbers
#   winning_numbers_match = ticket_numbers & winning_numbers  # array intersection for finding matching numbers
#   return winning_numbers_match  # return array of winning numbers that match ticket numbers
# end

# def find_ticket_numbers_off_by_one(ticket_numbers, winning_numbers)
#   ticket_numbers_off_by_one_digit = []  # array for ticket numbers to return

#   ticket_numbers.each do |ticket|  # iterate through each ticket number in the array

#     winning_numbers.each do |winner|  # iterate through each winning number in the array
#       set_1 = winner.split("")  # convert the current winning number into an array of digits
#       set_2 = ticket.split("")  # convert the ticket number into an array of digits
#       off_by_one = 0  # counter for winning number digits that are off by one compared to ticket number digit
#       greater_than_one = 0  # counter for winning number digits off by more than one
#       comparison_set = set_1.zip(set_2)  # use .zip method to pair up winning and ticket number digits in multi-d array

#       comparison_set.each do |inner|  # iterate through each inner array (pair of digits) to compare
#         if inner[0] != inner[1]  # check if the digits are identical and if they are not...
#           if (inner[0].to_i - inner[1].to_i).abs == 1  # check if the digits are off by +/- 1
#             off_by_one += 1  # if so, increment the off_by_one counter
#           elsif (inner[0].to_i - inner[1].to_i).abs > 1  # check if the digits are off by more than 1
#             greater_than_one += 1  # if so, increment the greater_than_one counter
#           end  # end the conditional counter increment statements
#         end  # restart the loop and compare the next pair of digits
#       end  # end the comparison_set.each loop

#       # if a single digit is off by one and there are no digits off by more than one
#       if off_by_one == 1 && greater_than_one == 0
#         ticket_numbers_off_by_one_digit.push(ticket)  # push the ticket number to the appropriate array
#       end  # start the next winning_numbers iteration to compare the ticket number against the next winning number

#     end  # start the next ticket_numbers iteration to compare the next ticket number against the winning numbers
#   end  # end the ticket_numbers.each loop

#   return ticket_numbers_off_by_one_digit  # return list of ticket numbers off by one for a single digit

# end

def find_unclaimed_winning_numbers(ticket_numbers, winning_numbers)
  unclaimed_winning_numbers = []  # array for winning numbers to return
  tn_counter = 1
  wn_counter = 1

  ticket_numbers.each do |ticket|  # iterate through each ticket number in the array
    print "\n"
    puts "Ticket_numbers loop iteration #{tn_counter} - ticket number: #{ticket}"

    winning_numbers.each do |winner|  # iterate through each winning number in the array
      puts "Winning number: #{winner}"
      set_1 = winner.split("")  # convert the current winning number into an array of digits
      set_2 = ticket.split("")  # convert the ticket number into an array of digits
      off_by_one = 0  # counter for winning number digits that are off by one compared to ticket number digit
      greater_than_one = 0  # counter for winning number digits off by more than one
      comparison_set = set_1.zip(set_2)  # use .zip method to pair up winning and ticket number digits in multi-d array

      comparison_set.each do |inner|  # iterate through each inner array (pair of digits) to compare
        if inner[0] != inner[1]  # check if the digits are identical and if they are not...
          if (inner[0].to_i - inner[1].to_i).abs == 1  # check if the digits are off by +/- 1
            off_by_one += 1  # if so, increment the off_by_one counter
          elsif (inner[0].to_i - inner[1].to_i).abs > 1  # check if the digits are off by more than 1
            greater_than_one += 1  # if so, increment the greater_than_one counter
          end  # end the conditional counter increment statements
        end  # restart the loop and compare the next pair of digits
        print "\n"
        print "Winning_numbers loop iteration #{wn_counter} - set_1: #{set_1}"
        print "\n"
        print "Winning_numbers loop iteration #{wn_counter} - set_2: #{set_2}"
        print "\n"
        print "Winning_numbers loop iteration #{wn_counter} - comparison_set: #{comparison_set}"
        print "\n"
        print "Winning_numbers loop iteration #{wn_counter} - off_by_one: #{off_by_one}"
        print "\n"
        print "Winning_numbers loop iteration #{wn_counter} - greater_than_one: #{greater_than_one}"
        print "\n"
      end  # end the comparison_set.each loop

      # if more than a single digit is off by one or if there are digits off by more than one
      if off_by_one > 1 || greater_than_one > 0
        unclaimed_winning_numbers.push(winner)  # push the winning number to the appropriate array
      end  # start the next winning_numbers iteration to compare the ticket number against the next winning number

    end  # start the next ticket_numbers iteration to compare the next ticket number against the winning numbers
  end  # end the ticket_numbers.each loop

  return unclaimed_winning_numbers  # return list of ticket numbers off by one for a single digit

end



# Sandbox testing
# print find_winning_ticket_numbers(['1234', '5678'], ['6678', '1235', '5679', '1134', '1234', '1344'])
# print "\n"
# print find_ticket_numbers_off_by_one(['1225', '1234', '5678', '6679'], ['6778', '2225', '6779', '1144', '1234', '1344'])
# print "\n"
print find_unclaimed_winning_numbers(['1225', '1234', '5678', '6679'], ['6778', '2225', '6779', '1144', '1234', '1344'])