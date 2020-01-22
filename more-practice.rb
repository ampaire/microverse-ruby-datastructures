# frozen_string_literal: true

def find_pairs(array, k)
  # write your code here
  Array(array).combination(2).find_all { |x, y| x + y == k } || []
end
