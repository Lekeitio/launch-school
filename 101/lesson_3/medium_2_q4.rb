# medium_3_q4.rb

sentence = "Humpty Dumpty sat on a wall."

words = sentence.split(/\W/)
words.reverse!
sentence = words.join(" ") + "."

puts sentence
