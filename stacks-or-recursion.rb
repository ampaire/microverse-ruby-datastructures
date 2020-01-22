# frozen_string_literal: true

def tree_height(tree_as_list)
  # your code here
  height = 1
  i = 1
  while i < tree_as_list.size

    height += 1

    i += 2 * i + 1
  end
  height
end
