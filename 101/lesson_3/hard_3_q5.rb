# hard_3_q4.rb

def is_an_ip_number?(word)
  return false unless (0 <= word.to_i && word.to_i <= 255)
  true
end

def dot_separated_ip_address?(input_string)
  dot_separated_words = input_string.split(".")
  return false unless dot_separated_words.size == 4

  while dot_separated_words.size > 0 do
    word = dot_separated_words.pop
    return false unless is_an_ip_number?(word)
  end
  true
end

p dot_separated_ip_address?("128.144.144.256")
p dot_separated_ip_address?("128.144.144.-1")
p dot_separated_ip_address?("128.144.144")
p dot_separated_ip_address?("128.144.144.255.255")
p dot_separated_ip_address?("128.144.144.255")