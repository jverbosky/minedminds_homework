# 2017-01-18 Random Pairing assignment
#
# Develop a function using Test Driven Devleopment that meets the following criteria:
# - takes an array of names
# - returns an array of arrays (multi-dimensional array)
# - if there is an odd number of names, adds the last name into one of the other sub-arrays
# - per assignment name, pairings should be randomly generated each time function runs

# Array containing 21 names
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
	"John Verbosky",
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
def array_test(object)
	if object.class == Array
		random_sort(object)
	end
end

# Function to randomly scramble items in the array
def random_sort(list)
  scrambled = list.shuffle
  if list != scrambled
  	random_pairs(scrambled)
  end
end

def random_pairs(items)
	inner_arrays = items.count / 2  # value for number of inner arrays to hold pairs
	multi = Array.new(inner_arrays) { Array.new(2) }  # create multi-dimensional arrays for each pair
	if items.count % 2 == 1
		return true
	else
		return false
	end
	print multi
end

puts array_test(names)
puts random_sort(names)
puts random_pairs(names)
