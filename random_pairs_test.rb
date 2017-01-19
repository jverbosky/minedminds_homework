# Test for code in mined_minds_array.rb
#
# Unit Test example
# Write code to test and make sure your code does what you say it does
#
# Include minitest gem
# http://ruby-doc.org/stdlib-2.0.0/libdoc/minitest/rdoc/MiniTest.html
require "minitest/autorun"

# Link test file and production file together
require_relative "random_pairs.rb"

# Class to create a new instance for test
class TestMinedMindsHomework < Minitest::Test

	# Test 1 - Verify that array_test() will accept an array as a parameter
	def test_1_array_parameter
		eleven = ["a","b","c","d","e","f","g","h","i","j","k"]
		assert_equal(true,array_test(eleven))
	end

	# Test 2 - Verify that random_sort() has scrambled the input array
	def test_2_random_sort
		eleven = ["a","b","c","d","e","f","g","h","i","j","k"]
		assert_equal(true,random_sort(eleven))
	end

	# Test 3 - Verify that a multi-dimensional array is returned by the function


	# Test 4 - Verify that multi-dimensional items are randomly paired


	# Test 5 - Count array items and if odd, verify that one of the 
	# multi-dimensional array contains an odd number of items

end
