# frozen_string_literal: true

require_relative './cell'
require_relative '../observer/observable'
require_relative '../utils/board_creators'

# models a Minesweeper Board
class Board < Observable
  attr_accessor :matrix_board, :dimensions

  def initialize(dimensions, bombs)
    super()
    @matrix_board = Array.new(dimensions) { Array.new(dimensions, nil) }
    @dimensions = dimensions
    @bombs = bombs
    create_board
  end

  def from_file(path)
    lines = File.read(path).split
    dimensions, bombs = lines.pop(2).map(&:to_i)
    @dimensions = dimensions
    @bombs = bombs
    @matrix_board = lines.map { |line| line.split(',').map { |value| Cell.new(value) } }
  end

  def inspect
    string = ''
    @matrix_board.each do |row|
      string += "#{row.inspect}\n"
    end
    string
  end

  def return_value(y_dim, x_dim)
    @matrix_board[y_dim][x_dim]
  end

  def create_board
    generate_permutations(@dimensions, @bombs).each do |x, y|
      @matrix_board[x][y] = Cell.new('B')
    end
    @matrix_board.each_with_index do |cell_list, x|
      cell_list.each_with_index do |cell_value, y|
        next unless cell_value.nil?

        count = count_surrounding(self, x, y)
        @matrix_board[x][y] = Cell.new(count)
      end
    end
  end
end
