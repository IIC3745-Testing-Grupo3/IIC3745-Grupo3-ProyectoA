# frozen_string_literal: true

require_relative 'controller/minesweeper'
require_relative 'view/minesweeper_display'
require_relative 'model/board'

a = MinesweeperController.create_board(16, 43)
p a
