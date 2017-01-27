# Test for off_by_one_-_two_numbers.rb

require "minitest/autorun"
require_relative "off_by_one_-_two_numbers.rb"

class TestOffByOne < Minitest::Test

  def test_1_return_false_if_either_argument_is_not_a_numerical_string
    results = compare_numbers('word', '1224')
    assert_equal(false, results)
  end

  def test_2_return_true_if_digits_are_off_by_one
    results = compare_numbers('1234', '1224')
    assert_equal(true, results)
  end

  def test_3_return_false_if_digits_are_off_by_more_than_one
    results = compare_numbers('1234', '1325')
    assert_equal(false, results)
  end

  def test_4_return_false_if_digits_are_all_the_same
    results = compare_numbers('1234', '1234')
    assert_equal(false, results)
  end

end