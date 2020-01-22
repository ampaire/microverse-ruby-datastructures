# frozen_string_literal: true

def sqrt(number)
  sqrt_recursive(number, 0, number)
end

def sqrt_recursive(number, min_interval, max_interval)
  # Your code here
  while min_interval <= max_interval
    midpoint = (max_interval + min_interval) / 2
    square = midpoint * midpoint
    if square > number
      max_interval = midpoint
    elsif square < number
      min_interval = midpoint
    else
      return midpoint
    end
  end
end

puts sqrt(25)
puts sqrt(7056)
