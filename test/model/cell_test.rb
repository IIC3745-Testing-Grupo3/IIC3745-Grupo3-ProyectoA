# frozen_string_literal: true

require_relative '../test_helper'
require_relative '../../src/model/cell'
require 'test/unit'

class CellTest < Test::Unit::TestCase
  def test_reveal
    cell = Cell.new(0)
    cell.reveal
    assert_equal(cell.hidden, false)
  end

  def test_to_s
    cell = Cell.new(0)
    assert_equal(cell.to_s, '-')
    cell.reveal
    assert_equal(cell.to_s, '0')
  end

  def test_inspect
    cell = Cell.new(0)
    assert_equal(cell.inspect, '-')
  end
end
