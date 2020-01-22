# frozen_string_literal: true

def sort_itself(array,   x_sort = array[1], index = 1, sort = [])
  # write your code here

  si_sort(array, x_sort, index)
  puts array.join(' ')
  unless index + 1 >= array.size
    sort_itself(array, array[index + 1], index + 1, sort)
  end
end

def si_sort(array, x_sort, index)
  return array[index] = x_sort if x_sort > array[index - 1] || index.zero?

  if !array[index - 1].nil? && x_sort < array[index - 1]
    array[index] = array[index - 1]
  end
  si_sort(array, x_sort, index - 1)
end

sort_itself([1, 4, 3, 6, 9, 2])
# => 1 4 3 6 9 2
#    1 3 4 6 9 2
#    1 3 4 6 9 2
#    1 3 4 6 9 2
#    1 2 3 4 6 9
