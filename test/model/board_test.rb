# frozen_string_literal: true

require_relative '../test_helper'
require_relative '../../src/model/board'
require 'test/unit'

class BoardTest < Test::Unit::TestCase
  def test_reveal_cell
    board = Board.new(2, 1, [
                        [1, 1],
                        [1, 'B']
                      ])
    board.reveal_cell(0, 0)
    assert_equal(board.matrix_board[0][0].hidden, false)
  end

  def test_no_extra_reveals
    board = Board.new(2, 1, [
                        [1, 1],
                        [1, 'B']
                      ])
    board.reveal_cell(0, 1)
    board.make_chain(0, 1)
    assert_false(board.completed)
  end

  def test_cells_revealed_counter
    board = Board.new(3, 2, [
                        [0, 2, 'B'],
                        [0, 2, 'B'],
                        [0, 1, 1]
                      ])
    board.make_chain(0, 0)
    board.reveal_cell(0, 1)
    value = board.cells_revealed
    assert_equal(6, value)
  end
end
