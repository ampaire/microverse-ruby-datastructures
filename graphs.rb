# frozen_string_literal: true

def graph(hash_graph)
  # write your code here
  array = [0]

  connected_node(array, 4, hash_graph, 0)
end

def connected_node(array, to_node, hash, index)
  return nil if index >= hash.size || index == to_node

  array << hash[index][0]
  connected_node(array, to_node, hash, hash[index][0])

  array
end

hash = {
  0 => [2],
  1 => [4],
  2 => [5, 0, 3],
  3 => [2],
  4 => [1, 5],
  5 => [4, 2]
}

p graph(hash)
# => [0, 2, 5, 4]
