# frozen_string_literal: true

def valid_input(input, dimensions)
  x = input[0].upcase.ord - 65
  y = input[1].to_i - 1
  return false if (x.negative? || x > dimensions - 1) || (y.negative? || y > dimensions - 1)

  true
end
