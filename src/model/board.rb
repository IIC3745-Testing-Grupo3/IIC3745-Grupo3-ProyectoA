# frozen_string_literal: true

# models a Minesweeper Cell
class Cell
  attr_reader :value, :hidden, :marked

  def initialize(value)
    @value = value
    @hidden = true
    @marked = false
  end

  def left_click
    @hidden = false
    value
  end

  def right_click
    @marked = !marked
  end
end

# models a Minesweeper Board
class Board
  attr_reader :matrix_board

  def self.from_file(path); end

  def self.randomized(height, n_bombs)
    board = new(height)
    permutations = (0...height).to_a.permutation(2)
    bombs = permutations.to_a.sample(n_bombs)
    bombs.each do |x, y|
      board.matrix_board[x][y] = Cell.new('B')
    end
    board
  end

  private

  def initialize(height)
    @matrix_board = Array.new(height) { Array.new(height, Cell.new(0)) }
  end
end
