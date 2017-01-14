# Print 1 - 100 to the screen
# If number is divisible by 3, replace number with "mined"
for num in 1..100
  if num % 3 == 0
  	puts "mined"
  else
    puts num
  end
end