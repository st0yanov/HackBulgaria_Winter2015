def move_coordinates(current_x, current_y, directions)
  change = 1

  directions.split(//).each do |direction|
  	case direction
  	  when '^'
  	  	current_y += -1*change
  	  when 'v'
  	  	current_y += 1*change
  	  when '<'
  	  	current_x += -1*change
  	  when '>'
  	  	current_x += 1*change
  	  when '~'
  	  	change = change == 1 ? -1 : 1
  	end
  end

  [current_x, current_y]
end

puts move_coordinates(0, 0, '>v<>>>v^~><><~><><')