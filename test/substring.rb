# substring.rb

# write a method that will return a substring based on specified indices.

def substring(word, first_index, second_index = nil)
  return word[first_index] if !second_index
  array = []
  word.split("").each_with_index do | letter, index |
    array.push(letter) if index >= first_index && index <= second_index
  end
  array.join('')
end

def inner_substrings(word)
  length = word.size - 1
  array = []
  for index1 in (0..length)
    for index2 in ((index1+1)..length)
      array.push(substring(word, index1, index2))
    end
  end
  array
end

def palindrome(word)
  word_array = inner_substrings(word)
  palindrome_array = []
  word_array.each do |string|
    palindrome_array << string if string == string.reverse
  end
  palindrome_array
end

def largest_palindrome(word)
  string_array = palindrome(word)
  largest = ''
  string_array.each do |word|
    largest = word if word.size > largest.size
  end
  largest
end

p substring("honey", 0, 2) # => "hon"
p substring("honey", 1, 2) # => "on"
p substring("honey", 3, 9) # => "ey"
p substring("honey", 2)    # => "n"

#write a method that finds all substrings in a string. No 1 letter words.

 p inner_substrings("bond") # => "bo", "bon", "bond", "on", "ond", "nd" 
 p inner_substrings("world")
 p inner_substrings("ppop")

 # write a method that will return all substrings that are palindromes within a string

 p palindrome("ppop") # => ["pp", "pop"]

 # write a method that finds the largest palindrome within a string

 p largest_palindrome("ppop") # => ["pop"]