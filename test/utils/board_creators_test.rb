# frozen_string_literal: true

require_relative '../test_helper'
require_relative '../../src/model/board'
require 'test/unit'

class BoardCreatorTest < Test::Unit::TestCase
  def test_permutation_numbers
    permutations = generate_permutations(3, 4)
    inside = []
    permutations.each { |tuple| inside |= tuple }
    assert_block do
      inside.all? { |num| num < 3 && num >= 0 }
    end
  end

  def test_permutation_length
    permutations = generate_permutations(3, 4)
    assert_equal(4, permutations.length)
  end

  def test_permutation_inside
    permutations = generate_permutations(3, 4)
    assert_block do
      permutations.any? { |tuple| tuple.length == 2 }
    end
  end

  def test_count_surrounding
    board = Board.new(3, 2, [[1, 'B', 2], [1, 2, 'B'], [0, 1, 1]])
    board_values = []
    board.matrix_board.each_with_index do |cell_list, x|
      cell_list.each_with_index do |_cell_value, y|
        board_values << count_surrounding(board, x, y)
      end
    end
    assert_equal([1, 1, 2, 1, 2, 1, 0, 1, 1], board_values)
  end

  def test_out_of_bounds
    board = Board.new(3, 2, [[1, 'B', 2], [1, 2, 'B'], [0, 1, 1]])
    assert_false(out_of_bounds(board, 0, 1))
    assert_true(out_of_bounds(board, 3, 0))
  end
end
