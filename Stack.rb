# frozen_string_literal: true

# Start with your code from LinkedList.rb
class Node
  attr_accessor :value, :next_node

  def initialize(value, next_node)
    @value = value
    @next_node = next_node
  end
end

class Stack
  attr_reader :data

  def initialize
    @data = nil
  end

  def push(value)
    @data = Node.new(value, @data)
  end

  def pop
    raise 'Stack is empty' if is_empty?

    value = @data.value
    @data = @data.next_node
    value
   end

  def is_empty?
    @data.nil?
  end
  end
stack = Stack.new
stack.push(3)
stack.push(5)
puts stack.pop
# => 5

stack.push(2)
stack.push(7)
puts stack.pop
# => 7

puts stack.pop
# => 2

puts stack.pop
# => 3
