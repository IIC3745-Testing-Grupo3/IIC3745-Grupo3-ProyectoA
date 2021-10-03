# frozen_string_literal: true

require_relative '../observer/observer'

# models the views and user interactions
class View < Observer
  def print_board(board)
    p board
  end
end
