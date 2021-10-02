# frozen_string_literal: true

def generate_permutations(dimensions, bombs)
  permutations = (0...dimensions).to_a.permutation(2)
  diagonal = (0...dimensions).to_a.map { |x| [x, x] }
  permutations += diagonal
  permutations.to_a.sample(bombs)
end

def count_surrounding(board, y_dim, x_dim)
  count = 0
  [
    [-1, 0], [0, -1], [-1, -1], [1, 0], [0, 1], [1, 1], [1, -1], [-1, 1]
  ].each do |y_offset, x_offset|
    next if out_of_bounds(board, y_dim + y_offset, x_dim + x_offset)

    cell = board.return_value(y_dim + y_offset, x_dim + x_offset)
    count += 1 if !cell.nil? && cell.value == 'B'
  end
  count
end

def out_of_bounds(board, y_dim, x_dim)
  x_dim.negative? || y_dim.negative? || x_dim >= board.dimensions || y_dim >= board.dimensions
end
