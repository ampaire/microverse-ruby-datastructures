# frozen_string_literal: true

def running_time(array)
  rt_sort_itself(array, 0)
end

def rt_sort_itself(arr, time, x_sort = arr[1], index = 1)
  time = running_time_sort(arr, time, x_sort, index)
  return time if index + 1 >= arr.size

  rt_sort_itself(arr, time, arr[index + 1], index + 1)
end

def running_time_sort(arr, time, x_sort, index)
  if x_sort > arr[index - 1] || index.zero?
    arr[index] = x_sort
    return time
  end

  if !arr[index - 1].nil? && x_sort < arr[index - 1]
    arr[index] = arr[index - 1]
    time += 1
  end
  running_time_sort(arr, time, x_sort, index - 1)
end
