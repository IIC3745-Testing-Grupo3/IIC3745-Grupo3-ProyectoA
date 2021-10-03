# frozen_string_literal: true

require_relative '../observer/observer'

# models the views and user interactions
class View < Observer
  def print_board(board)
    print "\n"
    range = board.dimensions - 1
    line = "  * *#{'  *' * range} *"
    p "    #{(1..board.dimensions).to_a.join('  ')}  "
    p line
    board.matrix_board.each_with_index { |x, index| p "#{(64 + index).chr} * #{x.join('  ')} *" }
    p line
  end

  def print_select_cell
    print 'Selecciona una casilla (Por ejemplo A2): '
  end

  def update(board)
    print_board(board)
  end
end
