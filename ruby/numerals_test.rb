require "./numerals.rb"
require "minitest/autorun"

class NumeralsTest < Minitest::Test
  def setup
  end

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
end
