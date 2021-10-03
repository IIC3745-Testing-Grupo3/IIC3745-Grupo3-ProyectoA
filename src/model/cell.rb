# frozen_string_literal: true

# models a Minesweeper Cell
class Cell
  attr_reader :value, :hidden, :marked

  def initialize(value)
    @value = value
    @hidden = true
    @marked = false
  end

  def reveal
    @hidden = false
    value
  end

  def to_s
    if @hidden
      '-'
    else
      @value.to_s
    end
  end

  def inspect
    to_s
  end
end
