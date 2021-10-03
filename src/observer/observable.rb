# frozen_string_literal: true

# This class emulates an observable item behaveour
class Observable
  attr_reader :observers

  def initialize
    @observers = []
  end

  def add_observer(observer)
    @observers << observer
  end

  def notify_all
    @observers.each { |observer| observer.update(self) }
  end
end
