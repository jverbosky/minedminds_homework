# Function to demonstrate Test Driven Design
# Paired with 2017_01_18_test.rb
#
# Populate an array with numbers 1 - 100, substitute with strings if divisible by 3, 5 or 15
#
# Note: Need to call ("values") or return ("return values")
# Using "print values" or "puts values" in function will error on test
#
# Original function written to populate array, not using Test Driven Design but still passes tests
def minedminds()
  values = []
  (1..100).each { |num| values.push(num) }
  values.map! { |value| (value % 3 != 0 || value % 5 != 0) ? value : "Mined Minds" }
  values.map! { |value| value % 3 != 0 ? value : "Mined" }
  values.map! { |value| value % 5 != 0 ? value : "Minds" }
  return values
end

# Function written using Test Driven Design in tandem with each test focus
# def minedminds()
# 	range = []
# 	num = 1
# 	for item in (1..100)
# 		if item % 3 == 0 && item % 5 == 0
# 			range.push("Mined Minds")
# 		elsif item % 3 == 0
# 			range.push("Mined")
# 		elsif item % 5 == 0
# 			range.push("Minds")
# 		else
# 			range.push(num)
# 		end	
#         num += 1
# 	end
# 	return range
# end

print minedminds()