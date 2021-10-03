# frozen_string_literal: true

# models a Controller for Minesweeper logic and interactions
class GameController
  def initialize(board_model, board_view)
    @model = board_model
    @view = board_view
    @is_playing = true
  end

  def print_board
    @view.print_board(@model)
  end

  def request_input
    @view.print_select_cell
    gets.chomp
  end

  def play
    print_board
    while @is_playing
      input = request_input
      @is_playing = false if input == 'exit'
      x = input[0].ord - 64
      y = input[1].to_i - 1
      select(x, y)
    end
  end

  def select(cord_x, cord_y)
    value = @model.reveal_cell(cord_x, cord_y)
    check_cell(value, cord_x, cord_y)
  end

  def check_cell(value, cord_x, cord_y)
    @model.notify_all
    if value == 'B'
      @is_playing = false
      @view.print_game_over
    else
      puts "#{(cord_x + 64).chr} #{cord_y + 1}"
    end
  end
end
