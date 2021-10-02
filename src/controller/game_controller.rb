# frozen_string_literal: true

# models a Controller for Minesweeper logic and interactions
class GameController
  def initialize(board_model, board_view)
    @model = board_model
    @view = board_view
  end

  def print_board
    @view.print_board(@model)
  end
end
