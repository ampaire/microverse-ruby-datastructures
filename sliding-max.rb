# frozen_string_literal: true

def sliding_maximum(k, array)
  array.each_cons(k).map(&:max)
end

sliding_maximum(3, [1, 3, 5, 7, 9, 2])
# => [5, 7, 9, 9]
