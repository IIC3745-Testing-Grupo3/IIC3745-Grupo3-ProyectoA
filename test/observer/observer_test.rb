# frozen_string_literal: true

require_relative '../test_helper'
require_relative '../../src/observer/observer'
require_relative '../../src/model/board'
require 'test/unit'

class ObserverTest < Test::Unit::TestCase
  def test_check_observer
    observer = Observer.new
    observable = Board.new(2, 1)
    expected_message = "Observer has not implemented method 'update'"
    assert_raise(NotImplementedError.new(expected_message)) { observer.update(observable) }
  end
end
