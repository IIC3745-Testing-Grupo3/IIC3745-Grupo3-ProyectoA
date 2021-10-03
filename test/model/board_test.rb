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

  def test_check_surroundings
    board = Board.new(3, 1, [
                        [1, 1, 1],
                        [1, 1, 1],
                        [1, 1, 'B']
                      ])

    board.check_surroundings(0, 0)
    assert_equal(3, board.cells_revealed)
    board.check_surroundings(2, 2)
    assert_equal(5, board.cells_revealed)
  end
end
