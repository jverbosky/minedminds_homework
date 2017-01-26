# Test for off_by_one_-_array.rb

require "minitest/autorun"
require_relative "off_by_one_-_array.rb"

class TestOffByOneArray < Minitest::Test

  def test_1_return_true_if_digits_are_off_by_one
    results = compare_numbers('1234', ['9999', '5678', '1235', '1134', '1344')
    assert_equal(['1235', '1134'], results)
  end

  # def test_2_return_false_if_digits_are_off_by_more_than_one
  #   results = compare_numbers('1234', '1734')
  #   assert_equal(false, results)
  # end

  # def test_3_return_false_if_digits_are_all_the_same
  #   results = compare_numbers('1234', '1234')
  #   assert_equal(false, results)
  # end

end