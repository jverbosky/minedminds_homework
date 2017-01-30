# Test for off_by_one_-_two_arrays.rb

require "minitest/autorun"
require_relative "off_by_one_-_two_arrays.rb"

class TestOffByOneTwoArrays < Minitest::Test

  def test_1_return_array_of_winning_numbers
    results = find_winning_ticket_numbers(['1234', '5678'], ['6778', '2225', '6779', '1144', '1234', '1344'])
    assert_equal(['1234'], results)
  end

  def test_2_return_array_of_winning_numbers_with_one_digit_off_by_one
    results = find_ticket_numbers_off_by_one(['1225', '1234', '5678', '6679'], ['6778', '2225', '6779', '1144', '1234', '1344'])
    assert_equal(['1225', '6679'], results)
  end

  def test_3_return_winning_numbers_with_no_matches_or_without_one_digit_off_by_one
    results = find_unclaimed_winning_numbers(['1225', '1234', '5678', '6679'], ['6778', '2225', '6779', '1144', '1234', '1344'])
    assert_equal(['6778', '1144', '1344'], results)
  end

end