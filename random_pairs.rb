# 2017-01-18 Random Pairing assignment
#
# Develop a function using Test Driven Devleopment that meets the following criteria:
# - takes an array of names
# - returns an array of arrays (multi-dimensional array)
# - if there is an odd number of names, adds the last name into one of the other sub-arrays
# - per assignment name, pairings should be randomly generated each time function runs

# Array containing 21 names of Pittsburgh TechHire web dev training team
names = [
  "Allen Weber",
  "Brian Lewis",
  "Cummie Washington",
  "Dover Hellfeldt",
  "Edwin Wells",
  "Frank Mugo",
  "Frank Coleman",
  "George Bruner",
  "Jayvon Harris",
  "John Verbosky",  # comment out to test for even number of array items
  "Khalifa Cochran",
  "Lee Brown",
  "Lisa Petrovich",
  "Matt Teitz",
  "Max Pokropowicz",
  "Mike Ciletti",
  "Pat Wehman",
  "Patrick Roberts",
  "Sherri Dyson",
  "Takhir Salimov",
  "Teela Subba"
]

# Function to verify that object being passed in is an array
# Corresponds to test_1_array_parameter
def array_test(a)
  if a.class == Array
    #puts "Run string_test(a)..."  # inline test
    return true   # for testing, comment out for production
    #string_test(a)  # for production, comment out for testing
  end
end

# Function to verify that all array members are strings
# Corresponds to test_2_string_test
def string_test(b)
  test = []
  b.each do |item|
    if item.class == String
      test.push true
    else
      test.push false
    end
  end
  if test.include? false
    return false
  else
    #puts "Run random_sort(b)..."  # inline test
    return true   # for testing, comment out for production
    #random_sort(b)  # for production, comment out for testing
  end
end

# Function to randomly scramble items in the array and verify that array members haven't changed
# Corresponds to test_3_random_sort
def random_sort(c)
  scrambled = c.shuffle
  if c - scrambled == [] && scrambled - c == []
  	#puts "Run pair_names(scrambled)..."  # inline test
  	return true   # for testing, comment out for production
  	#pair_names(scrambled)  # for production, comment out for testing
  end
end

# Function to change array into a multi-dimensional array with an inner array for every two names
# Ex: [[name1,name2],[name3,name4],[name5,name6]]
# Corresponds to test_4_pair_names
def pair_names(d)
  paired = d.each_slice(2).to_a
  #puts "Run evaluate_pairs(paired)..."  # inline test
  return paired  # for testing, comment out for production
  #evaluate_pairs(paired)  # for production, comment out for testing
end

# Function to determine if the final inner array is paired or solitary
# If paired call list_pairs_even(), if solitary, call list_pairs_odd()
# Corresponds to test_5_evaluate_odd
# and test_6_evaluate_even
def evaluate_pairs(e)
  last = e.count - 1
  if e[last].count == 1
  	#puts "Run merge_pairs_odd(e)..."  # inline test
  	return true  # for testing, comment out for production
    #merge_pairs_odd(e)  # for production, comment out for testing
  else
  	#puts "Run list_pairs_even(e)..."  # inline test
  	return false  # for testing, comment out for production
    #list_pairs_even(e)  # for production, comment out for testing
  end
end

# Function to list array pairs when final inner array has two names
# Only use in production
def list_pairs_even(pairs)
  counter = 1
  pairs.each do |name1, name2| 
    puts "Random Pair #{counter}: #{name1}, #{name2}"
    counter += 1
  end
end

# Function to combine last two inner arrays when final inner array has one name
# Final inner array will then have 3 members
# Corresponds to test_7_merge_pairs_odd
def merge_pairs_odd(multi)
  last = multi.count - 1
  next_to_last = multi.count - 2
  # Perform a union on the last two arrays
  # Google: set operators with Ruby arrays
  together = multi[next_to_last] | multi[last]
  # Assign the next-to-the-last inner array the union value (3 items)
  multi[next_to_last] = together
  # Delete the last inner array
  multi.delete_at(last)
  #puts "Run list_pairs_odd(multi)..."  # inline test
  return multi # for testing, comment out for production
  #list_pairs_odd(multi)  # for production, comment out for testing
end

# Function to list array pairs when final inner array has an three names
# Only use in production
def list_pairs_odd(merged)
  pairs = merged[0..-2]
  final = merged.count - 1
  counter = 1
  pairs.each do |name1, name2| 
    puts "Random Pair #{counter}: #{name1}, #{name2}"
    counter += 1
  end
  puts "Random Pair #{counter}: #{merged[final][0]}, #{merged[final][1]}, #{merged[final][2]}"
end

array_test(names)