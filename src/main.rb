# frozen_string_literal: true

require_relative 'controller/minesweeper'
require_relative 'view/minesweeper_display'
require_relative 'model/board'

a = Board.randomized(16, 43)
p a

b = Board.from_file('../boards/board_01.txt')
p b
