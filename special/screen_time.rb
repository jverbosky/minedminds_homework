# screen_time.rb
# Program to select people to demonstrate

names = [
  "Allen Weber",
  "Brian Lewis",
  "*Cummie Washington",
#  "Dover Hellfeldt",
  "Edwin Wells",
  "Frank Mugo",
#  "Frank Coleman",
#  "George Bruner",
  "Jayvon Harris",
  "*John Verbosky",
#  "Khalifa Cochran",
#  "Lee Brown",
  "Lisa Petrovich",
  "*Matt Teitz",
  "*Max Pokropowicz",
  "Mike Ciletti",
  "Pat Wehman",
#  "Patrick Roberts",
  "Sherri Dyson",
  "Takhir Salimov",
  "Teela Subba"
]

def screen_time(names)

	selection_pool = []
	already_selected = []

	names.each do |name|
		if name.start_with?("*")
	      already_selected.push(name)
	    else
	      selection_pool.push(name)
	    end
	end

	# Use .sample method to grab random item from array
	return selection_pool.sample

end

print screen_time(names)