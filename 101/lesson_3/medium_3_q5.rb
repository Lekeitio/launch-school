# medium_3_q5.rb

def color_valid(color)
  if color == "blue" || color == "green"
    true
  else
    false
  end
end

def color_valid_new(color)
  color == "blue" || color == "green"
end

puts color_valid("blue")
puts color_valid_new("blue")

puts color_valid("white")
puts color_valid_new("white")