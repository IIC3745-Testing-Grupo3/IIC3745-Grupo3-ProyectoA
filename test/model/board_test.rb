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
end
