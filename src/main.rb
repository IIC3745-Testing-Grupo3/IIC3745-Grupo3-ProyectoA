# frozen_string_literal: true

require_relative 'controller/game_controller'
require_relative 'view/game_view'
require_relative 'model/board'

board = Board.new(5, 4)
view = View.new
game_controller = GameController.new(board, view)
board.add_observer(view)
game_controller.play
