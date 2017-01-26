# Test for two_numbers_off_by_one.rb

require "minitest/autorun"
require_relative "two_numbers_off_by_one.rb"

class TestOffByOne < Minitest::Test

  def test_1_return_true_if_array_intersection_returns_true
    results = compare_numbers('1234', '1244')
    assert_equal(true, results)
  end

end