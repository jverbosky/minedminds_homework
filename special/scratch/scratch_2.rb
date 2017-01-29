names = [
  "Allen Weber",
  "Andrew Morgan",
  "Brian Lewis",
  "Cummie Washington",
  "Dover Hellfeldt",
  "Edwin Wells",
  "Frank Mugo",
  "Frank Coleman",
  "George Bruner",
  "Jayvon Harris",
  "*John Verbosky",
  "Khalifa Cochran",
  "Lisa Petrovich",
  "Matt Teitz",
  "*Max Pokropowicz",
  "*Mike Ciletti",
  "*Pat Wehman",
  "*Patrick Roberts",
  "*Sherri Dyson",
  "*Takhir Salimov",
  "Teela Subba"
]  # 21 names

weighted = []  # array for weighted names
not_weighted = []  # array for non-weighted names
odd_man_out = []  # array to hold name if odd number of names
paired = []  # array for paired names
half = names.length / 2  # integer division, so remainder dropped (if 21, will return 10)
true_up = 0  # variable to help with balancing size of weighted and non-weighted arrays
counter = 1

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
if not_weighted.length % 2 > 0
    odd_man_out = not_weighted.pop
elsif weighted.length % 2 > 0
    odd_man_out = weighted.pop
end

# Use .zip to pair up names from weighted and non-weighted arrays
paired = weighted.zip(not_weighted)

# Good up to here with no weighted names

# Check if odd_man_out is empty, if not then push to pair based on weightedness
# Goal is to make sure odd_man_out is paired with a weighted name if it is not weighted
if odd_man_out.empty? == false
  if odd_man_out.start_with?("*")  # If odd_man_out is weighted, push to last pair
    print "Weighted odd_man_out"
    paired.last.push(odd_man_out)
  else  #If odd_man_out is not weighted...
    paired.each do |pair|
      # Push to the first pair with a weighted name
      if pair[0].start_with?("*")
        pair.push(odd_man_out)
        break  # break out of loop so odd_man_out not pushed to every weighted pair
      # If there aren't any weighted names, push odd_man_out to the first pair
      else
        pair.push(odd_man_out)
        break  # break out of loop so odd_man_out not pushed to every non-weighted pair
      end
    end
  end
end

# If odd number of names, move the pair with three names to the end of the array
# to make the final output look nicer
if odd_man_out.empty? == false
  paired.each do |pair|
    if pair.length == 3
      position = paired.index(pair)  # position of the three-element inner array
      # Insert the pair with three names to the end and delete it from original position
      paired.insert(-1, paired.delete_at(position))
    end
  end
end

# Output names in easy-to-read format
paired.each do |pair|
  if pair.length == 2
    puts "Random Pair #{counter}: #{pair[0]}, #{pair[1]}"
    counter += 1
  else
    puts "Random Pair #{counter}: #{pair[0]}, #{pair[1]}, #{pair[2]}"
    counter += 1
  end
end


#  Test with:
#  Array with no weighted names - even # of names
#  Array with no weighted names - odd # of names
#  Array with < half weighted names - even # of names
#  Array with < half weighted names - odd # of names
#  Array with half weighted names - even # of names
#  Array with > half weighted names - even # of names
#  Array with > half weighted names - odd # of names