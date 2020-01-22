# frozen_string_literal: true

require 'set'

def find_duplicates(array, dup = [], set = Set.new)
  array.each do |i|
    dup << i if set.include? i
    set.add(i)
  end
  dup
end
p find_duplicates([1, 2, 3, 1, 5, 6, 7, 8, 5, 2])
# => [1, 5, 2]

p find_duplicates([3, 501, 17, 23, -43, 67, 5, 888, -402, 235, 77, 99, 311, 1, -43])
# => [-43]
