# frozen_string_literal: true

class Node
  attr_accessor :value, :next_node, :prev_node

  def initialize(value, next_node = nil, prev_node = nil)
    @value = value
    @next_node = next_node
    @prev_node = prev_node
  end
end

class Stack
  def initialize
    @first = nil
  end

  def push(number)
    @first = Node.new(number, @first)
    @min = @first if @min.nil?
    @min = Node.new(number, @min) if number < min
  end

  def pop
    @min = @min.next_node if @min.value == @first.value
    @first = @first.next_node
    element = @first
    element.value
  end

  def min
    @min&.value
  end
end

stack = Stack.new
stack.push(3)
stack.push(5)
puts stack.min
# => 3

stack.pop
stack.push(7)
puts stack.min
# => 3

stack.push(2)
puts stack.min
# => 2

stack.pop
puts stack.min
# => 3
