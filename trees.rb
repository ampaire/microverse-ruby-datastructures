# frozen_string_literal: true

def leftmost_nodes_sum(array)
  # your code here
  sum = 0
  x = 0
  while x < array.size
    sum += array[x]
    x = ((2 * x) + 1)
  end
  sum
end

puts leftmost_nodes_sum([2, 7, 5, 2, 6, 0, 9])
# => 11
