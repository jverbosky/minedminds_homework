# Print 1 - 100 to the screen
# If number is divisible by 3, replace number with "mined"
# If number is divisible by 5, replace number with "minds"
for num in 1..100
  if num % 3 == 0
  	puts "mined"
  elsif num % 5 == 0
  	puts "minds"
  else
    puts num
  end
end