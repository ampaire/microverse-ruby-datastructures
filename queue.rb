# frozen_string_literal: true

# Start with your code from LinkedList challenge.

class Queue
  def initialize
    @data = []
  end

  def add(item)
    @data << item
  end

  def remove
    if empty?
      -1

    else
      @data.shift
    end
  end

  def empty?
    @data.empty?
  end
end

queue = Queue.new

queue.add(3)
queue.add(5)
puts queue.remove
# => 3

queue.add(2)
queue.add(7)
puts queue.remove
# => 5

puts queue.remove
# => 2

puts queue.remove
# => 7

puts queue.remove
# => -1
