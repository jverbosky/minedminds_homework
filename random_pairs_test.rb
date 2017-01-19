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

  # # Test 1 - Verify that array_test() will accept an array as a parameter
  # def test_1_array_parameter
  # 	mock = MiniTest::Mock.new
  #   test_array = ["a","b","c","d","e","f"]
  #   mock.expect(:string_test, nil, ['array_test'])
  #   @class.stub :string_test, -> (arg) { mock.string_test arg } do
  #   	@class.array_test
  #   end
  #   assert mock.verify
  # end

  # Test 1 - Verify that array_test() will accept an array as a parameter
  def test_1_array_parameter
    test_array = ["a","b","c","d","e","f"]
    results = string_test(test_array)
    #test_array = "test"  # non-string test to verify test fails
    assert_equal(results,array_test(test_array))
  end

  # # Test 2 - Verify that all array members are strings
  # def test_2_string_test
  #   test_array = ["a","b","c","d","e","f"]
  #   #test_array = ["a","b",2]  # non-string member to verify test fails
  #   assert_equal(random_sort(test_array),string_test(test_array))
  # end

  # # Test 3 - Verify that random_sort() has scrambled the input array and array members haven't changed
  # def test_3_random_sort
  #   test_array = ["a","b","c","d","e","f"]
  #   assert_equal(pair_names(test_array),random_sort(test_array))
  #   #assert_equal(pair_names(test_array.shuffle),random_sort(test_array))
  # end

  # # Test 4 - Verify that a multi-dimensional array with paired inner arrays is returned by the function
  # def test_3_random_sort
  #   test_array = ["a","b","c","d","e","f","g","h","i","j","k"]
  #   test_array_paired = [["a", "b"], ["c", "d"], ["e", "f"]]
  #   assert_equal(test_array_paired,pair_names(test_array))
  # end

  # Test 5 - Verify that the merge_pairs_odd() functions is called if final inner array has one name

  # Test 6 - Verify that the list_pairs_even() functions is called if final inner array has two name

  # Test 7 - Verify that name pairs are printed when all inner arrays have two names

  # Test 8 - Verify that final inner array contains three names

  # Test 9 - Verify that name pairs are printed when final inner array has three names


end
