def greatest_peaks(map)
  visited = map.map(&:dup)

  find_peaks(map, visited, 0)
  areas = visited.flatten.uniq
  counts = []
  i = 0
  while i < areas.size
    counts << visited.flatten.count { |x| x == areas[i] }
    i += 1
  end
  counts.minmax
end

def find_peaks(map, visited, pos)
  return if visited.flatten.none? { |i| (i.is_a? Integer) }

  peak = search(visited, max_peak(visited), 0, 0)
  mark_area(map,  peak[0..1], peak[2], visited, ('A'..'Z').to_a[pos])
  find_peaks(map, visited, pos + 1)
  visited
end

def max_peak(map)
  map.flatten.select { |i| (i.is_a? Integer) }.max
end

def search(map, max, col, row)
  return nil if row >= map.size || col >= map.size

  return [row, col, max] if map[row][col] == max

  search(map, max, row + 1, col) || search(map, max, row, col + 1)
end

def mark_area(map, position, peak, visited, mark)
  return nil if not_bounded?(position, map.size)

  row = position[0]
  col = position[1]
  return if (visited[row][col].is_a? String) ||
            invalid_area?(map, peak, row, col)

  visited[row][col] = mark
  mark_sides(map, row, col, visited, mark)
end

def not_bounded?(position, size)
  position.any? { |i| i.negative? || i >= size }
end

def invalid_area?(map, peak, row, col)
  peak < map[row][col] ||
    [check_col(map, peak, row, col), check_row(map, peak, row, col)].any?
end

def check_col(map, peak, row, col)
  [(!(col - 1).negative? && (peak < map[row][col - 1])),
   ((col + 1) < map.size && (peak < map[row][col + 1]))].any?
end

def check_row(map, peak, row, col)
  [(!(row - 1).negative? && (peak < map[row - 1][col])),
   ((row + 1) < map.size && (peak < map[row + 1][col]))].any?
end

def mark_sides(map, row, col, visited, mark)
  check_left_right(map, row, col, visited, mark)
  check_up_down(map, row, col, visited, mark)
end

def check_left_right(map, row, col, visited, mark)
  mark_area(map, [row, col - 1], map[row][col], visited, mark)
  mark_area(map, [row, col + 1], map[row][col], visited, mark)
end

def check_up_down(map, row, col, visited, mark)
  mark_area(map, [row - 1, col], map[row][col], visited, mark)
  mark_area(map, [row + 1, col], map[row][col], visited, mark)
end

p greatest_peaks(
  [
    [9, 8, 5], 
    [5, 6, 3], 
    [8, 4, 1]
  ]
)
# => [3, 6]

p greatest_peaks(
  [
    [8, 12], 
    [9, 3]
  ]
)
# => [1, 
