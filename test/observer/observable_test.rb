# frozen_string_literal: true

require_relative '../test_helper'
require_relative '../../src/observer/observer'
require_relative '../../src/observer/observable'
require 'test/unit'

class ObservableTest < Test::Unit::TestCase
  def setup
    @observer = Observer.new
    @observable = Observable.new
  end

  def test_add_observers
    assert_equal(@observable.observers.length, 0)
    @observable.add_observer(@observer)
    assert_equal(@observable.observers[0], @observer)
    assert_equal(@observable.observers.length, 1)
  end

  def test_notify_all
    @observable.add_observer(@observer)
    assert_raise(NotImplementedError.new("Observer has not implemented method 'update'")) { @observable.notify_all }
  end
end
