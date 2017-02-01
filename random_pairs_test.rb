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
class TestMinedMindsRandomPairs < Minitest::Test

  # Test 1 - Verify that array_test() will accept an array as a parameter
  def test_1_array_parameter
    test_array = ["a","b","c","d","e","f"]
    #test_array = "test"  # non-string test to verify test fails
    assert_equal(true,array_test(test_array))
  end

  # Test 2 - Verify that all array members are strings
  def test_2_string_test
    test_array = ["a","b","c","d","e","f"]
    #test_array = ["a","b",2]  # non-string member to verify test fails
    assert_equal(true,string_test(test_array))
  end

  # Test 3 - Verify that random_sort() has scrambled the input array and array members haven't changed
  def test_3_random_sort
    test_array = ["a","b","c","d","e","f"]
    assert_equal(true,random_sort(test_array))
  end

  # Test 4 - Verify that a multi-dimensional array with paired inner arrays is returned by the function
  def test_4_pair_names
    test_array = ["a","b","c","d","e","f"]
    test_array_paired = [["a","b"], ["c","d"], ["e","f"]]
    #test_array_paired = [["a","b","c"], ["d","e","f"]]  # multi-dimensional array in triplets to verify test fails
    assert_equal(test_array_paired,pair_names(test_array))
  end

  # Test 5 - Verify that the merge_pairs_odd() function is called if final inner array has one name
  def test_5_evaluate_odd
    test_array = [["a", "b"], ["c", "d"], ["e", "f"], ["g"]]  # array with final odd array
    #test_array = [["a", "b"], ["c", "d"], ["e", "f"]]  # array with even pairs to verify test fails
    assert_equal(true,evaluate_pairs(test_array))
  end

  # Test 6 - Verify that the list_pairs_even() function is called if final inner array has two names
  def test_6_evaluate_even
    test_array = [["a", "b"], ["c", "d"], ["e", "f"]]  # array with even pairs
    #test_array = [["a", "b"], ["c", "d"], ["e", "f"], ["g"]]  # array with final odd array to verify test fails
    assert_equal(false,evaluate_pairs(test_array))
  end

  # Test 7 - Verify that final inner array contains merge of last two inner arrays
  def test_7_merge_pairs_odd
  	test_array = [["a", "b"], ["c", "d"], ["e", "f"], ["g"]]
  	test_array_merged = [["a", "b"], ["c", "d"], ["e", "f", "g"]]
  	#test_array_merged = [["a", "b","c", "d"], ["e", "f", "g"]]  # array with two merged arrays to verify test fails
  	assert_equal(test_array_merged,merge_pairs_odd(test_array))
  end

end