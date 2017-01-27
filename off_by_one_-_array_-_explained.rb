# The off_by_one_-_array function with explanatory output

def compare_number_array(ticket, winning_numbers)
  if ticket.to_i == 0 || winning_numbers.class != Array || winning_numbers == []
    return false
  else
    winning_numbers_off_by_one_digit = []
    winning_numbers_no_match = []  # not required - info only
    same_number = 0  # not required - info only
    count = 0  # not required - info only
    winning_numbers.each do |winner|
      if winner == ticket  # not required - info only
        same_number += 1  # not required - info only
      else  # not required - info only
        set_1 = winner.split("")
        set_2 = ticket.split("")
        puts "Iteration count: #{count}"  # not required - info only
        print "Set 1: #{set_1}"  # not required - info only
        print "\n"  # not required - info only
        print "Set 2: #{set_2}"  # not required - info only
        print "\n"  # not required - info only
        count += 1  # not required - info only
        off_by_one = 0
        greater_than_one = 0
        comparison_set = set_1.zip(set_2)
        puts "Comparison set:"  # not required - info only
        print comparison_set  # not required - info only
        print "\n"  # not required - info only
        comparison_set.each do |inner|
          if inner[0] != inner[1]
            puts (inner[0].to_i - inner[1].to_i).abs  # not required - info only
            if (inner[0].to_i - inner[1].to_i).abs == 1
              off_by_one += 1
            elsif (inner[0].to_i - inner[1].to_i).abs > 1
              greater_than_one += 1
            end
          end
        end
        puts "Off by one count: #{off_by_one}"  # not required - info only
        puts "Greater than one count: #{greater_than_one}"  # not required - info only
        puts "Winning ticket: #{winner}"  # not required - info only
        print "\n"  # not required - info only
        if off_by_one == 1 && greater_than_one == 0
          winning_numbers_off_by_one_digit.push(winner)
        else  # not required - info only
          winning_numbers_no_match.push(winner)  # not required - info only
        end
      end  # not required - info only
    end
    puts "SUMMARY RESULTS"
    puts "---------------"
    puts "Ticket number: #{ticket}"
    puts "Winning numbers: #{winning_numbers}"
    puts "Same number count: #{same_number}"  # not required - info only
    print "Winning numbers no match: #{winning_numbers_no_match}"  # not required - info only
    print "\n"  # not required - info only
    print "Winning numbers off by one digit: #{winning_numbers_off_by_one_digit}"
    print "\n"
  end
end

# Sandbox testing
# print compare_number_array('test', ['9999', '5678', '1235', '1134', '1344'])  # false
# print "\n"
# print compare_number_array('1234', '1235')  # false
# print "\n"
# print compare_number_array('1234', [])  # false
# print "\n"
print compare_number_array('1234', ['9999', '5678', '1235', '1134', '1344'])  # ['1235', '1134']
print "\n"
# print compare_number_array('1234', ['1234', '1235', '1236', '1244', '1334'])  # ['1235', '1244', '1334']
# print "\n"
# print compare_number_array('1234', ['2234', '3234', '1335', '1336'])  # ['2234']
# print "\n"
# print compare_number_array('1234', ['1111', '2222', '3333'])  # false
# print "\n"
# print compare_number_array('123456', ['999999', '567890', '123556', '113456', '134456'])  # ['1235', '1134']