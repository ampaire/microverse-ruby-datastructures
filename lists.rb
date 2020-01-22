# frozen_string_literal: true

# Create your own LinkedList  class for storing integers which should include two methods:
# add(number) - Add a new Node to the end of the list with a value of number. Nothing needs to be returned.
# get(index) - Return the value of the Node at position `index` in the List.

# Example

# This is an example of a test case:

# list = LinkedList.new

# list.add(3)
# list.add(5)
# puts list.get(1)
# # => 5

# The 2 add operations create the list: [3, 5].
# The get operation, gets the number located at position 1.

class Node
  attr_accessor :value, :next_node

  def initialize(value, next_node = nil)
    @value = value
    @next_node = next_node
  end
end

class LinkedList
  # setup head and tail
  @head = nil
  @tail = nil

  def add(number)
    # your code here
    if @head.nil?
      new_node = Node.new(number)
      @head = new_node
      @tail = new_node
    else
      new_node = Node.new(number)
      @tail.next_node = new_node
      @tail = new_node
    end
  end

  def get(index)
    # your code here
    current = @head
    index.times do
      current = current.next_node
    end
    current.value
  end
end
list = LinkedList.new

list.add(3)
list.add(5)
puts list.get(1)
