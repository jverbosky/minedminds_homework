# Need to call ("values") or return ("return values")
# Using "print values" or "puts values" will error on test

# def minedmindskata()
#   values = []
#   (1..100).each { |num| values.push(num) }
#   values.map! { |value| (value % 3 != 0 || value % 5 != 0) ? value : "Mined Minds" }
#   values.map! { |value| value % 3 != 0 ? value : "Mined" }
#   values.map! { |value| value % 5 != 0 ? value : "Minds" }
#   values
# end

# puts minedmindskata()

def minedminds()
	range = []
	num = 1
	for item in (1..100)
		if item % 3 == 0
			range.push("Mined")
		else
			range.push(num)
		end	
        num += 1
	end
	return range
end

print minedminds()


