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
  "John Verbosky", # comment out to test list_pairs_even()
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
    string_test(a)
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
    random_sort(b)
  end
end

# Function to randomly scramble items in the array and verify that array members haven't changed
# Corresponds to test_3_random_sort
def random_sort(c)
  scrambled = c.shuffle
  if c - scrambled == [] && scrambled - c == []
  	#puts "Run pair_names(scrambled)..."  # inline test
  	pair_names(scrambled)
  end
end

# Function to change array into a multi-dimensional array with an inner array for every two names
# Ex: [[name1,name2],[name3,name4],[name5,name6]]
# Corresponds to test_4_ - this is where testing started breaking...
def pair_names(d)
  paired = d.each_slice(2).to_a
  #puts "Run evaluate_pairs(paired)..."  # inline test
  evaluate_pairs(paired)
end

# Function to determine if the final inner array is paired or solitary
# If paired call list_pairs_even(), if solitary, call list_pairs_odd()
# Corresponds to test_5_evaluate_odd
# and test_6_evaluate_even
def evaluate_pairs(e)
  last = e.count - 1
  if e[last].count == 1
  	#puts "Run merge_pairs_odd(e)..."  # inline test
    merge_pairs_odd(e)
  else
  	#puts "Run list_pairs_even(e)..."  # inline test
    list_pairs_even(e)
  end
end

# Function to list array pairs when final inner array has two names
# Corresponds to test_7_
def list_pairs_even(pairs)
  counter = 1
  pairs.each do |name1, name2| 
    puts "Random Pair #{counter}: #{name1}, #{name2}"
    counter += 1
  end
end

# Function to combine last two inner arrays when final inner array has one name
# Final inner array will then have 3 members
# Corresponds to test_8_
def merge_pairs_odd(multi)
  last = multi.count - 1
  next_to_last = multi.count - 2
  together = multi[next_to_last] | multi[last]
  multi[next_to_last] = together
  multi.delete_at(last)
  #puts "Run list_pairs_odd(multi)..."  # inline test
  list_pairs_odd(multi)
end

# Function to list array pairs when final inner array has an three names
# Corresponds to test_9_
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