# frozen_string_literal: true

require_relative '../model/board'
require_relative '../utils/board_creators'
require 'dotenv/load'

# models a Controller for Minesweeper logic and interactions
class MinesweeperController
  def initialize; end

  def self.create_board(dimensions, bombs)
    board = Board.new(dimensions, bombs)
    if ENV['TEST']
      board.from_file(ENV['TEST_FILE_PATH'])
    else
      generate_permutations(dimensions, bombs).each do |y, x|
        board.matrix_board[y][x] = Cell.new('B')
      end
      board.matrix_board.each_with_index do |cell_list, y|
        cell_list.each_with_index do |cell_value, x|
          next unless cell_value.nil?

          count = count_surrounding(board, y, x)
          board.matrix_board[y][x] = Cell.new(count)
        end
      end
    end
    board
  end
end
