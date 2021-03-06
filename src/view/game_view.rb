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
    board.matrix_board.each_with_index { |x, index| p "#{(65 + index).chr} * #{x.join('  ')} *" }
    p line
  end

  def print_select_cell
    print "\nSelecciona una casilla (Por ejemplo A2): "
  end

  def print_game_over
    puts "\nOh no, has perdido"
  end

  def print_win
    puts "\n¡Has ganado!\n"
  end

  def print_invalid
    p 'El valor ingresado no esta permitido'
  end

  def update(board)
    print_board(board)
  end
end
