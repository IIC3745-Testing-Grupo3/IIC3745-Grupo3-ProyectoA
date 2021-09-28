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
  attr_reader :matrix_board

  def self.from_file(path); end

  def self.randomized(dimensions, n_bombs)
    board = new(dimensions)
    permutations = (0...dimensions).to_a.permutation(2)
    diagonal = (0...dimensions).to_a.map { |x| [x, x] }
    permutations += diagonal
    bombs = permutations.to_a.sample(n_bombs)
    bombs.each do |y, x|
      board.matrix_board[y][x] = Cell.new('B')
    end
    board.generate_board_numbers
    board
  end

  def generate_board_numbers
    @matrix_board.each_with_index do |row, y|
      row.each_with_index do |cell, x|
        if cell.nil?
          count = count_surrounding(y, x)
          @matrix_board[y][x] = Cell.new(count)
        end
      end
    end
  end

  def inspect
    string = ''
    @matrix_board.each do |row|
      string += "#{row.inspect}\n"
    end
    string
  end

  private

  def initialize(dimensions)
    @matrix_board = Array.new(dimensions) { Array.new(dimensions, nil) }
    @dimensions = dimensions
  end

  def count_surrounding(cell_y, cell_x)
    # This method must be called only for non-bomb cell coordinates

    count = 0

    [[-1, 0], [0, -1], [-1, -1], [1, 0], [0, 1], [1, 1], [1, -1], [-1, 1]].each do |y_offset, x_offset|
      next if out_of_bounds(cell_y + y_offset, cell_x + x_offset)

      cell = @matrix_board[cell_y + y_offset][cell_x + x_offset]
      count += 1 if !cell.nil? && cell.value == 'B'
    end

    count
  end

  def out_of_bounds(cell_y, cell_x)
    cell_x.negative? || cell_y.negative? || cell_x >= @dimensions || cell_y >= @dimensions
  end
end
