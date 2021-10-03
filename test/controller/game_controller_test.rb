# frozen_string_literal: true

require_relative '../test_helper'
require_relative '../../src/controller/game_controller'
require_relative '../../src/model/board'
require_relative '../../src/view/game_view'
require 'test/unit'
require 'stringio'

class GameControllerTest < Test::Unit::TestCase
  def setup
    board = Board.new(2, 1, [
                        [1, 1],
                        [1, 'B']
                      ])
    view = View.new
    board.add_observer(view)
    @controller = GameController.new(board, view)
  end

  def test_play_win
    input = StringIO.new
    input.puts 'A1'
    input.puts 'A2'
    input.puts 'B1'
    input.rewind
    $stdin = input
    @controller.play
    assert_false(@controller.is_playing)
  end

  def test_play_lose
    $stdin = StringIO.new('B2')
    @controller.play
    assert_false(@controller.is_playing)
  end

  def test_request_input
    $stdin = StringIO.new('A1')
    value = @controller.request_input
    assert_equal('A1', value)
  end

  def test_check_cell_b
    @controller.check_cell('B', 0, 1)
    assert_false(@controller.is_playing)
  end

  def test_check_cell_completed
    @controller.select(0, 0)
    @controller.select(0, 1)
    @controller.select(1, 0)
    @controller.check_cell(0, 1, 0)
    assert_true(@controller.model.completed)
    assert_false(@controller.is_playing)
  end
end
