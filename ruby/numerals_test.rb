require "./numerals.rb"
require "minitest/autorun"

class NumeralsTest < Minitest::Test

  def test_parses_number_by_thousands
    assert_equal [[0, 0, 7],
                  [6, 5, 4],
                  [3, 2, 1]],
                 to_abstract_tree(7_654_321)

    assert_equal [[0, 3, 7],
                  [6, 5, 4],
                  [3, 2, 1]],
                 to_abstract_tree(37_654_321)

    assert_equal [[0, 0, 5],
                  [4, 3, 7],
                  [6, 5, 4],
                  [3, 2, 1]],
                 to_abstract_tree(5_437_654_321)
  end

  def test_handle_empty_thousand_pow_as_empty_thousand_node
    assert_equal [[0, 0, 5],
                  [4, 3, 7],
                  :empty,
                  [3, 2, 1]],
                 to_abstract_tree(5_437_000_321)
  end

  def test_transform_ones_to_text
    assert_equal "one", one_to_text(1)
    assert_equal "two", one_to_text(2)
    assert_equal "three", one_to_text(3)
    assert_equal "four", one_to_text(4)
    assert_equal "five", one_to_text(5)
    assert_equal "six", one_to_text(6)
    assert_equal "seven", one_to_text(7)
    assert_equal "eight", one_to_text(8)
    assert_equal "nine", one_to_text(9)
    assert_equal "zero", one_to_text(0)
  end

  def test_transform_tens_to_text
    assert_equal "twenty-two", ten_to_text([2, 2])
    assert_equal "thirty-three", ten_to_text([3, 3])
    assert_equal "ten", ten_to_text([1, 0])
    assert_equal "eleven", ten_to_text([1, 1])
    assert_equal "eighteen", ten_to_text([1, 8])
    assert_equal "sixteen", ten_to_text([1, 6])
  end


  def test_transform_hundreds_to_words
    assert_equal "one hundred", hundred_to_text([1, 0, 0])
    assert_equal "six hundred and two", hundred_to_text([6, 0, 2])
    assert_equal "one hundred and nineteen", hundred_to_text([1, 1, 19])
  end
end
