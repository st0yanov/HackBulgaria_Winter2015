def count_word_occurances(word, data)
  occurances = 0

  # First let's check the rows
  data.each do |row|
  	row_string = row.join('')
  	occurances += 1 if row_string.include?(word) or row_string.include?(word.reverse)
  end

  # After that we can continue with the cols
  table_width = data[0].length
  table_height = data.length

  (0..table_width).map do |i|
  	col_string = ''
  	(0..table_height).map do |k|
  	  unless (data[k].nil? or data[k][i].nil?) then col_string += data[k][i] end
    end
  	occurances += 1 if col_string.include?(word) or col_string.include?(word.reverse)
  end

  # Finally let's see the diagonals
  word_length = word.length # We won't need to check the diagonals which lengths are less than the word's length
  diagonals, current_diagonal = [], []

  # Start with diagonals from top left to bottom right
  (0..table_height).map do |y|
    x = 0
    (y == 0 ? data : data.drop(y)).each do |row|
      current_diagonal.push(row[x])
      x += 1
    end
    diagonals.push(current_diagonal.clone)
    current_diagonal.clear
  end

  (1..table_width).map do |x|
    y=0
    (x..table_width).map do |i|
      current_diagonal.push(data[y][i])
      y += 1
    end
    diagonals.push(current_diagonal.clone)
    current_diagonal.clear
  end

  # Now let's get the diagonals from top right to bottom left
  (0..table_height).map do |y|
    x = table_width
    (y == 0 ? data : data.drop(y)).each do |row|
      current_diagonal.push(row[x])
      x -= 1
    end
    diagonals.push(current_diagonal.clone)
    current_diagonal.clear
  end

  (((0..table_width-1).to_a).reverse).map do |x|
    y=0
    (((0..x).to_a).reverse).map do |i|
      current_diagonal.push(data[y][i])
      y += 1
    end
    diagonals.push(current_diagonal.clone)
    current_diagonal.clear
  end

  diagonals.each do |row|
    diag_string = row.join('')
    occurances += 1 if diag_string.include?(word) or diag_string.include?(word.reverse)
  end

  occurances

end

data_table = [
  ['i','v','a','n'],
  ['e','v','n','h'],
  ['i','n','a','v'],
  ['m','v','v','n'],
  ['q','r','i','t']
]

puts count_word_occurances('ivan', data_table)