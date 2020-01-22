# frozen_string_literal: true

def bfs(graph)
  # write your code here
  array = [0]
  connected_node(array, graph, 0)
end

def connected_node(array, hash, index)
  return nil if array.size >= hash.size || hash[index].nil?

  nodes = hash[index].reject { |i| array.include?(i) }

  array << nodes
  array.flatten!
  connected_node(array, hash, nodes[0]) unless nodes.nil?
  connected_node(array, hash, nodes[1]) if nodes.size > 1

  array
end

p bfs(
  0 => [2],
  1 => [4],
  2 => [5, 0, 3],
  3 => [2],
  4 => [1, 5],
  5 => [4, 2]
)
# => [0, 2, 5, 3, 4, 1]
