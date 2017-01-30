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

  # def test_3_return_array_of_winning_numbers_with_one_digit_off_by_one_sorted
  #   results = find_winning_ticket_numbers(['1234', '5678'], ['6678', '1235', '5679', '1134', '1234', '1344'])
  #   assert_equal(['1134', '1235', '5679', '6678'], results)
  # end

  # def test_3_return_false_if_no_winning_numbers_have_digit_off_by_one_or_have_multiple_digits_off_by_one
  #   results = compare_ticket_array_to_winning_array('1234', ['9999', '5678', '2235', '1135', '1344'])
  #   assert_equal(false, results)
  # end

end