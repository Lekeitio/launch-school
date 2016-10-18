# medium_1_q8.rb

def titleize(phrase)
  titleize_phrase = []
  get_words = phrase.split(" ")
  get_words.each do |word|
    titleize_phrase << word.capitalize
  end
  titleize_phrase = titleize_phrase.join(' ')
end
title = "it's a new title for the blog"

p titleize(title)

title.split.map { |word| word.capitalize }.join(' ')