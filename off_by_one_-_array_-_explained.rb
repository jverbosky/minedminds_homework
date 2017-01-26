# The off_by_one_-_array function with explanatory output

def compare_number_array(ticket, winning_numbers)
  winning_numbers_off_by_one_digit = []
  winning_numbers_no_match = []
  same_number = 0
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
      off_by_one = 0
      greater_than_one = 0
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
      puts "Off by one count: #{off_by_one}"
      puts "Greater than one count: #{greater_than_one}"
      puts "Winning ticket: #{winner}"
      print "\n"
      if greater_than_one > 0
        winning_numbers_no_match.push(winner)
      elsif off_by_one > 1
        winning_numbers_no_match.push(winner)
      elsif off_by_one == 1
        winning_numbers_off_by_one_digit.push(winner)
      end
    end
  end
  puts "Same number count: #{same_number}"
  print "Winning numbers no match: #{winning_numbers_no_match}"
  print "\n"
  print "Winning numbers off by one digit: #{winning_numbers_off_by_one_digit}"
  print "\n"
end

# Sandbox testing
puts compare_number_array('1234', ['9999', '5678', '1235', '1134', '1344'])  # ['1235', '1134']
# puts compare_number_array('1234', ['1234', '1235', '1236', '1244', '1334'])  # ['1235', '1244', '1334']
# puts compare_number_array('1234', ['2234', '3234', '1335', '1336'])  # ['2234']
# puts compare_number_array('1234', ['1111', '2222', '3333'])  # []