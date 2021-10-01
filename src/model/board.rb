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

  def to_s
    @value.to_s
  end

  def inspect
    to_s
  end
end

# models a Minesweeper Board
class Board
  attr_accessor :matrix_board, :dimensions

  def initialize(dimensions, bombs)
    @matrix_board = Array.new(dimensions) { Array.new(dimensions, nil) }
    @dimensions = dimensions
    @bombs = bombs
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

end
