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

def random_pairs(list)
	if list.class == Array
		return true
	end
end

puts random_pairs(names)
