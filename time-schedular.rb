# frozen_string_literal: true

def time_scheduler(array)
  # write your code here
  array = sort_events(array)
  most_events(array)
end

def most_events(array, hash = [], perm = 0, arr = [])
  while perm < array.size
    arr = combinations(array, perm)
    hash = arr if hash.size < arr.size
    perm += 1
    return hash if hash.size >= array.size - perm
  end
  hash
end

def combinations(array, perm, index = perm, max_arr = [], arr = [])
  return max_arr if index >= array.size

  temp = index
  arr << array[perm]
  insert_array_combinations(arr, array, temp)
  max_arr = arr if max_arr.size < arr.size
  combinations(array, perm, index + 1, max_arr)
end

def insert_array_combinations(arr, insert_array, index)
  while index < insert_array.size - 1
    index += 1
    arr << insert_array[index] if arr.last[1] < insert_array[index][0]
  end
end

def sort_events(array, left = 0, right = array.size - 1)
  return array if array.size < 3

  half = find_half(left, right)
  arr1 = sort_events(array[left..half])
  arr2 = sort_events(array[(half + 1)..right])
  arr1 = [arr1] unless arr1[0].is_a? Array
  arr2 = [arr2] unless arr2[0].is_a? Array
  swap_events(arr1, arr2)
end

def find_half(left, right)
  half = (left + right) / 2
  half += 1 if half.even?
  half
end

def swap_events(arr1, arr2, arr = [], left = 0, right = 0)
  diff = compare_array(arr1, arr2, left, right)
  if diff
    left = insert_event(arr, arr1, left)
  else
    right = insert_event(arr, arr2, right)
  end
  return arr.concat(arr2[right..-1]) if left >= arr1.size
  return arr.concat(arr1[left..-1]) if right >= arr2.size

  swap_events(arr1, arr2, arr, left, right)
end

def compare_array(arr1, arr2, left, right)
  arr1[left][0] <= arr2[right][0]
end

def insert_event(arr, insert_array, insert_index)
  arr << insert_array[insert_index]
  insert_index += 1
  insert_index
end

p time_scheduler([4, 8, 1, 3, 7, 9, 5, 6])
# => [[1,3], [5,6], [7,9]]
