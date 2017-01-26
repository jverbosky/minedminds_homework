# Test for off_by_one_-_array.rb

require "minitest/autorun"
require_relative "off_by_one_-_array.rb"

class TestOffByOneArray < Minitest::Test

  def test_1_return_array_of_winning_numbers_with_one_digit_off_by_one
    results = compare_number_array('1234', ['9999', '5678', '1235', '1134', '1344'])
    assert_equal(['1235', '1134'], results)
  end

  def test_2_return_false_if_no_winning_numbers_have_digit_off_by_one_or_have_multiple_digits_off_by_one
    results = compare_number_array('1234', ['9999', '5678', '2235', '1135', '1344'])
    assert_equal(false, results)
  end

end