# frozen_string_literal: true

def full_merge_sort(array)
  arr = divide_merge_sort(array)
  sorted_array = []
  arr.each { |i| sorted_array << i.split(' ')[1] }
  sorted_array
end

def divide_merge_sort(array, left = 0, right = array.size - 1)
  return array if left >= right

  half = (left + right) / 2
  arr1 = divide_merge_sort(array[left..half])
  arr2 = divide_merge_sort(array[(half + 1)..right])
  f_merge_sort(arr1, arr2)
end

def f_merge_sort(arr1, arr2, arr = [], left = 0, right = 0)
  diff = f_compare_array(arr1, arr2, left, right)
  if diff
    left = f_merge_left(arr1, arr, left)
  else
    right = f_merge_right(arr2, arr, right)
  end

  return arr.concat(arr2[right..-1]) if left >= arr1.size
  return arr.concat(arr1[left..-1]) if right >= arr2.size

  f_merge_sort(arr1, arr2, arr, left, right)
end

def f_compare_array(arr1, arr2, left, right)
  diff = arr1[left].split(' ')[0].to_i - arr2[right].split(' ')[0].to_i
  !diff.positive?
end

def f_merge_left(arr1, arr, left)
  arr << arr1[left]
  left += 1
  left
end

def f_merge_right(arr2, arr, right)
  arr << arr2[right]
  right += 1
  right
end
