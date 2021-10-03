# frozen_string_literal: true

require_relative '../test_helper'
require_relative '../../src/observer/observer'
require_relative '../../src/model/board'
require 'test/unit'

class ObserverTest < Test::Unit::TestCase
  def test_check_observer
    observer = Observer.new
    observable = Board.new(2, 1)
    assert_raise(NotImplementedError.new("Observer has not implemented method 'update'")) { observer.update(observable) }
  end
  
end
