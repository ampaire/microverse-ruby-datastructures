# frozen_string_literal: true

def partition(array)
  # write your code here
  left = []
  right = []
  pivot = [array.first]
  array.each do |i|
    right.push(i) if i > array.first
    left.push(i) if i < array.first
  end
  left + pivot + right
end

p partition([4, 5, 3, 9, 1])
# => [3, 1, 4, 5, 9]
