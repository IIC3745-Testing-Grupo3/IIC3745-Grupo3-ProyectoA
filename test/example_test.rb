# frozen_string_literal: true

require_relative 'test_helper'
require 'test/unit'

class ExampleTest < Test::Unit::TestCase
  def test_example
    number = 1
    number += 1
    assert_equal(2, number)
  end
end
