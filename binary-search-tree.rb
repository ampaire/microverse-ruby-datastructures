# frozen_string_literal: true

class Node
  attr_reader :data
  attr_accessor :left, :right

  def initialize(data)
    @data = data
  end
end

def array_to_binary_search_tree(root_node, array, i)
  return nil if i >= array.length || array[i].zero?

  root_node = Node.new(array[0]) if root_node.nil?
  node = Node.new(array[i])
  insert_node(root_node, node)

  array_to_binary_search_tree(root_node, array, i + 1)
  root_node
end

def insert_node(root_node, new_node)
  loop do
    if root_node.data >= new_node.data
      break root_node.left = new_node if root_node.left.nil?

      root_node = root_node.left
    else
      break root_node.right = new_node if root_node.right.nil?

      root_node = root_node.right
    end
  end
  root_node
end

def pre_order(node)
  return '' if node.nil?

  result = "#{node.data} "
  result += pre_order(node.left)
  result + pre_order(node.right)
end

def binary_search_tree(array)
  # your code here
  tree = array_to_binary_search_tree(nil, array, 1)
  pre_order(tree).strip
end

puts binary_search_tree([8, 3, 10, 1, 6, 14, 4, 7, 13])
# => "8 3 1 6 4 7 10 14 13"
