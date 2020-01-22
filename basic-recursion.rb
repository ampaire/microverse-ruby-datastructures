# frozen_string_literal: true

def sum(number)
  # Your code here
  (1..number).inject { |sum, number| sum + number }
end

puts sum(4)
puts sum(10)
