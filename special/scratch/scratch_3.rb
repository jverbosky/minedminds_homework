# Function to create random pairs based on homework completion
#
# Use "*" before a name to weight it
# For example:  "*Edwin Wells"
#
# For a list of use cases, please see Use Case Tests section below function

names = [
  "*Allen Weber",
  "*Andrew Morgan",
  "*Brian Lewis",
  "*Cummie Washington",
  "*Dover Hellfeldt",
  "*Edwin Wells",
  "*Frank Mugo",
  "*Frank Coleman",
  "*George Bruner",
  "*Jayvon Harris",
  "John Verbosky",
  "Khalifa Cochran",
  "Lisa Petrovich",
  "Matt Teitz",
  "Max Pokropowicz",
  "Mike Ciletti",
  "Pat Wehman",
  "Patrick Roberts",
  "Sherri Dyson",
  "Takhir Salimov",
  "Teela Subba"
]  # 21 names

def random_pairs_weighted(names)

  weighted = []  # array for weighted names
  not_weighted = []  # array for non-weighted names
  odd_man_out = []  # array to hold name if odd number of names
  paired = []  # array for paired names
  half = names.length / 2  # integer division, so remainder dropped (if 21, will return 10)
  true_up = 0  # variable to help with balancing size of weighted and non-weighted arrays
  counter = 1  # counter variable for string interpolation in final output

  # Loop to populate weighted and non-weighted arrays with weighted and non-weighted names
  names.each do |name|
    if name.start_with?("*")
      weighted.push(name)
    else
      not_weighted.push(name)
    end
  end

  # Determine which array is larger and then balance them
  if weighted.length < not_weighted.length
    true_up = half - weighted.length
    weighted += not_weighted.slice!(0, true_up)
  else
    true_up = half - not_weighted.length
    not_weighted += weighted.slice!(0, true_up)
  end

  # Randomize names in balanced arrays
  weighted = weighted.shuffle
  not_weighted = not_weighted.shuffle

  # Since .zip will drop the last name if name count is odd, save it to odd_man_out
  if names.length % 2 > 0  # Determine if name count is odd and if so...
    # If not_weighted has more names, it has the odd name count, so pop a name from it
    if not_weighted.length > weighted.length
      odd_man_out = not_weighted.pop
    # Otherwise weighted has more names, so pop a name from it
    else
      odd_man_out = weighted.pop
    end
  end

  # Use .zip to pair up names from weighted and non-weighted arrays
  paired_names = weighted.zip(not_weighted)

  # Check if odd_man_out is empty, if not then push to pair based on weightedness
  # Goal is to make sure odd_man_out is paired with a weighted name if it is not weighted
  if odd_man_out.empty? == false
    if odd_man_out.start_with?("*")  # If odd_man_out is weighted, push to last pair
      paired_names.last.push(odd_man_out)
    else  # If odd_man_out is not weighted...
      paired_names.each do |pair|
        # Push to the first pair with a weighted name
        if pair[0].start_with?("*")
          pair.push(odd_man_out)
          odd_man_out = ""  # Clear odd_man_out so next if statement is false
          break  # Break out of loop so odd_man_out not pushed to every weighted pair
        end
      end
      # If there aren't any weighted names, push odd_man_out to the last pair
      if odd_man_out != ""
        paired_names.last.push(odd_man_out)
      end
    end
  end

  # If odd number of names, move the pair with three names to the end of the array
  # to make the final output look nicer
  if names.length % 2 > 0
    paired_names.each do |pair|
      if pair.length == 3
        position = paired_names.index(pair)  # Position of the pair with three names
        # Insert the pair with three names to the end and delete it from original position
        paired_names.insert(-1, paired_names.delete_at(position))
      end
    end
  end

  # Output names in easy-to-read format
  paired_names.each do |pair|
    if pair.length == 2
      puts "Random Pair #{counter}: #{pair[0]}, #{pair[1]}"
      counter += 1
    else
      puts "Random Pair #{counter}: #{pair[0]}, #{pair[1]}, #{pair[2]}"
      counter += 1
    end
  end

end

random_pairs_weighted(names)

# Use Case Tests
# Uncomment all of the following lines to run:
puts "\n"
puts "Use case 1: Array with no weighted names - even # of names"
case_1 = ["Allen Weber", "Andrew Morgan", "Brian Lewis", "Cummie Washington", "Dover Hellfeldt", "Edwin Wells"]
random_pairs_weighted(case_1)
puts "\n"
puts "Use case 2: Array with no weighted names - odd # of names"
case_2 = ["Allen Weber", "Andrew Morgan", "Brian Lewis", "Cummie Washington", "Dover Hellfeldt", "Edwin Wells", "Frank Mugo",]
random_pairs_weighted(case_2)
puts "\n"
puts "Use case 3: Array with < half weighted names - even # of names"
case_3 = ["Allen Weber", "*Andrew Morgan", "Brian Lewis", "Cummie Washington", "*Dover Hellfeldt", "Edwin Wells"]
random_pairs_weighted(case_3)
puts "\n"
puts "Use case 4: Array with < half weighted names - odd # of names"
case_4 = ["Allen Weber", "*Andrew Morgan", "Brian Lewis", "Cummie Washington", "*Dover Hellfeldt", "Edwin Wells", "Frank Mugo",]
random_pairs_weighted(case_4)
puts "\n"
puts "Use case 5: Array with half weighted names - even # of names (one weighted name in every pair)"
case_5 = ["Allen Weber", "*Andrew Morgan", "*Brian Lewis", "Cummie Washington", "*Dover Hellfeldt", "Edwin Wells"]
random_pairs_weighted(case_5)
puts "\n"
puts "Use case 6: Array with half weighted names - odd # of names (one weighted name in every pair)"
case_6 = ["Allen Weber", "*Andrew Morgan", "*Brian Lewis", "Cummie Washington", "*Dover Hellfeldt", "Edwin Wells", "Frank Mugo",]
random_pairs_weighted(case_6)
puts "\n"
puts "Use case 7: Array with > half weighted names - even # of names"
case_7 = ["Allen Weber", "*Andrew Morgan", "*Brian Lewis", "*Cummie Washington", "*Dover Hellfeldt", "Edwin Wells"]
random_pairs_weighted(case_7)
puts "\n"
puts "Use case 8: Array with > half weighted names - odd # of names"
case_8 = ["Allen Weber", "*Andrew Morgan", "*Brian Lewis", "*Cummie Washington", "*Dover Hellfeldt", "Edwin Wells", "Frank Mugo",]
random_pairs_weighted(case_8)
puts "\n"