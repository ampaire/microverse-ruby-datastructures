# frozen_string_literal: true

def hash_table(arr)
  hash = []
  arr.each do |i|
    hash[i.abs % 11] = hash[i.abs % 11] ? hash[i.abs % 11].push(i) : [i]
  end
  hash.compact.flatten
end
