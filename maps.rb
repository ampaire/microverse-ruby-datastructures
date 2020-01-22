# frozen_string_literal: true

def appears_most_times(array, hash = Hash.new(0))
  array.each do |i|
    hash[i] += 1
  end
  hash.key(hash.values.max)
end
