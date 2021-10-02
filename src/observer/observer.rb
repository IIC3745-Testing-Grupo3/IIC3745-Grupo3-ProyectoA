# frozen_string_literal: true

# This class emulates an observer that watch the observable objects
class Observer
  def update(_board)
    raise NotImplementedError, "#{self.class} has not implemented method '#{__method__}'"
  end
end
