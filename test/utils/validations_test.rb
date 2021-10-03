# frozen_string_literal: true

require_relative '../test_helper'
require 'test/unit'

class ValidationsTest < Test::Unit::TestCase
  def test_out_of_range_full_input
    assert_false(valid_input('Z9', 5))
  end

  def test_out_of_range_x
    assert_false(valid_input('Z1', 5))
  end

  def test_out_of_range_y
    assert_false(valid_input('A9', 5))
  end

  def test_valid_range
    assert_true(valid_input('A1', 5))
  end
end
