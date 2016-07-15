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

  def test_transform_thousand_node_to_words
    assert_equal "six hundred and two", thousand_node_to_words([6, 0, 2])
    assert_equal "thirty three", thousand_node_to_words([0, 3, 3])
    assert_equal "one", thousand_node_to_words([0, 0, 1])
  end

  def test_transform_teens
    assert_equal "eighteen", thousand_node_to_words([0, 1, 8])
    assert_equal "sixteen", thousand_node_to_words([0, 1, 6])
  end
end
