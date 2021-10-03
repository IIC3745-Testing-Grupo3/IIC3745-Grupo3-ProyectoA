# frozen_string_literal: true

require_relative './cell'
require_relative '../observer/observable'
require_relative '../utils/board_creators'

# models a Minesweeper Board
class Board < Observable
  attr_accessor :matrix_board, :dimensions, :completed

  def initialize(dimensions, bombs, game = nil)
    super()
    @matrix_board = Array.new(dimensions) { Array.new(dimensions, nil) }
    @dimensions = dimensions
    @bombs = bombs
    @bombs_cordinates = []
    @completed = false
    @cells_revealed = 0
    game.nil? && create_board
    @matrix_board = game.map { |line| line.map { |value| Cell.new(value) } } unless game.nil?
  end

  def return_value(y_dim, x_dim)
    @matrix_board[y_dim][x_dim]
  end

  def create_board
    generate_permutations(@dimensions, @bombs).each do |x, y|
      @matrix_board[x][y] = Cell.new('B')
      @bombs_cordinates.push([x, y])
    end
    @matrix_board.each_with_index do |cell_list, x|
      cell_list.each_with_index do |cell_value, y|
        next unless cell_value.nil?

        @matrix_board[x][y] = Cell.new(count_surrounding(self, x, y))
      end
    end
  end

  def reveal_cell(cord_x, cord_y)
    value = @matrix_board[cord_x][cord_y].reveal
    value == 'B' && @bombs_cordinates.each { |x, y| @matrix_board[x][y].reveal }
    @cells_revealed += 1
    @completed = true if @cells_revealed == @dimensions**2 - @bombs
    value
  end

  def make_chain(cord_x, cord_y)
    check_surroundings(cord_x, cord_y) if @matrix_board[cord_x][cord_y].value.to_s == '0'
    notify_all
  end

  def check_surroundings(cord_x, cord_y)
    neighbors = [[-1, 0], [0, -1], [-1, -1], [1, 0], [0, 1], [1, 1], [1, -1], [-1, 1]]
    neighbors.each do |x, y|
      new_x = cord_x + x
      new_y = cord_y + y
      cell = @matrix_board[new_x][new_y] if new_x.between?(0, @dimensions - 1) && new_y.between?(0, @dimensions - 1)
      next unless cell&.hidden

      reveal_cell(new_x, new_y)
      cell.value.zero? && check_surroundings(new_x, new_y)
    end
  end
end
