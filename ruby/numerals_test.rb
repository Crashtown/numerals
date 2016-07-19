require "./numerals.rb"
require "minitest/autorun"

class NumeralsTest < Minitest::Test

  def test_parses_number_by_thousand_pow_to_term
    assert_equal [[0, 0, 7],
                  [6, 5, 4],
                  [3, 2, 1]],
                 number_to_term(7_654_321)

    assert_equal [[0, 3, 7],
                  [6, 5, 4],
                  [3, 2, 1]],
                 number_to_term(37_654_321)

    assert_equal [[0, 0, 5],
                  [4, 3, 7],
                  [6, 5, 4],
                  [3, 2, 1]],
                 number_to_term(5_437_654_321)

    assert_equal [[0, 0, 5],
                  [4, 3, 7],
                  [0, 0, 0],
                  [3, 2, 1]],
                 number_to_term(5_437_000_321)

    assert_equal [[0, 0, 1],
                  [0, 0, 0]],
                 number_to_term(1_000)
  end

  def test_transform_ones_to_text
    assert_equal "one",   one_to_text(1)
    assert_equal "two",   one_to_text(2)
    assert_equal "three", one_to_text(3)
    assert_equal "four",  one_to_text(4)
    assert_equal "five",  one_to_text(5)
    assert_equal "six",   one_to_text(6)
    assert_equal "seven", one_to_text(7)
    assert_equal "eight", one_to_text(8)
    assert_equal "nine",  one_to_text(9)
    assert_equal "zero",  one_to_text(0)
  end

  def test_transform_tens_to_text
    assert_equal "twenty-two",   ten_to_text([2, 2])
    assert_equal "thirty-three", ten_to_text([3, 3])
    assert_equal "ten",          ten_to_text([1, 0])
    assert_equal "eleven",       ten_to_text([1, 1])
    assert_equal "eighteen",     ten_to_text([1, 8])
    assert_equal "sixteen",      ten_to_text([1, 6])
  end


  def test_transform_hundreds_to_text
    assert_equal "one hundred",            hundred_to_text([1, 0, 0])
    assert_equal "six hundred two",        hundred_to_text([6, 0, 2])
    assert_equal "one hundred nineteen",   hundred_to_text([1, 1, 9])
    assert_equal "one hundred twenty",     hundred_to_text([1, 2, 0])
    assert_equal "two hundred twenty-two", hundred_to_text([2, 2, 2])
  end

  def test_transform_hundreds_with_pow_to_text
    assert_equal "one",          hundred_with_pow_to_text([0, 0, 1], 0)
    assert_equal "one thousand", hundred_with_pow_to_text([0, 0, 1], 1)
    assert_equal "one million",  hundred_with_pow_to_text([0, 0, 1], 2)
    assert_equal "one billion",  hundred_with_pow_to_text([0, 0, 1], 3)
  end

  def test_transform_term_to_text
    assert_equal "seven million, six hundred fifty-four thousand, three hundred twenty-one",
                 term_to_text([[0, 0, 7],
                               [6, 5, 4],
                               [3, 2, 1]])
    assert_equal "five billion, four hundred thirty-seven million, three hundred twenty-one",
                 term_to_text([[0, 0, 5],
                               [4, 3, 7],
                               [0, 0, 0],
                               [3, 2, 1]])
  end

  def test_to_numeral
    assert_equal "seven million, six hundred fifty-four thousand, three hundred twenty-one",
                 to_numeral(7_654_321)
    assert_equal "five billion, four hundred thirty-seven million, six hundred fifty-four thousand, three hundred twenty-one",
                 to_numeral(5_437_654_321)
    assert_equal "zero", to_numeral(0)
  end

end
