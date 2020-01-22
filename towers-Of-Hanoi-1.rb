# frozen_string_literal: true

def move(starting, goal)
  # your code here
  aux = (1..3).find { |n| n != starting && n != goal }
  "#{starting}->#{aux} #{starting}->#{goal} #{aux}->#{goal}"
end

puts move(1, 3)
# => 1->2 1->3 2->3

puts move(2, 3)
# => 2->1 2->3 1->3
