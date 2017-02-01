  def test_4_array_with_less_than_half_weighted_names_even_number_of_names_confirm_weighted_in_multiple_pairs
    results = random_pairs_weighted(["Abby","Bobby","*Cassy","Davey","*Emmie","Franky"])
    weighted_count = 0
    results.each do |pair|
      if pair[0].start_with?("*")
        weighted_count += 1
      end
    end
    assert_equal(2, weighted_count)
  end

  def test_5_array_with_less_than_half_weighted_names_odd_number_of_names_confirm_weighted_in_multiple_pairs
    results = random_pairs_weighted(["Abby","Bobby","*Cassy","Davey","*Emmie","Franky","Ginny"])
    weighted_count = 0
    results.each do |pair|
      if pair[0].start_with?("*")
        weighted_count += 1
      end
    end
    assert_equal(2, weighted_count)
  end