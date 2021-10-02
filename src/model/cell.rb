# frozen_string_literal: true

# models a Minesweeper Cell
class Cell
  attr_reader :value, :hidden, :marked

  def initialize(value)
    @value = value
    @hidden = true
    @marked = false
  end

  def left_click
    @hidden = false
    value
  end

  def right_click
    @marked = !marked
  end

  def to_s
    @value.to_s
  end

  def inspect
    to_s
  end
end
