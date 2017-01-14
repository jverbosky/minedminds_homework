# Print 1 - 100 to the screen
# If number is divisible by 3, replace number with "Mined"
# If number is divisible by 5, replace number with "Minds"
# If number is divisible by 3 & 5 (15), replace number with "Mined Minds"
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