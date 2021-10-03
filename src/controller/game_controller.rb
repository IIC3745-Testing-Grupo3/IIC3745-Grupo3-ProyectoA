# frozen_string_literal: true

# models a Controller for Minesweeper logic and interactions
class GameController
  attr_accessor :model, :view, :is_playing

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
      if input == 'exit'
        @is_playing = false
        break
      end
      select(input[0].upcase.ord - 65, input[1].to_i - 1)
    end
  end

  def select(cord_x, cord_y)
    value = @model.reveal_cell(cord_x, cord_y)
    check_cell(value, cord_x, cord_y)
  end

  def check_cell(value, cord_x, cord_y)
    @model.make_chain(cord_x, cord_y)
    if value == 'B'
      @is_playing = false
      @view.print_game_over
    elsif @model.completed
      @is_playing = false
      @view.print_win
    end
  end
end
