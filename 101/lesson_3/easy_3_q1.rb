# easy_3_q1.rb
=begin
# flintstones = ["Fred", "Barney", "Wilma", "Betty", "BamBam", "Pebbles"]
flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)

# flintstones << "Dino"

# flintstones.push("Dino").push("Hoppy")

# flintstones.concat(%w(Dino Hoppy))

flintstones.push(%w(Dino Hoppy)) # introduce array

p flintstones

advice = "Few things in life are as important as house training your pet dinosaur."

advice.slice(0, advice.index("house"))
p advice
advice.slice!(0, advice.index("house"))
p advice


statement = "The Flintstones Rock & Roll tomorrow"
p statement.count("o")
p statement.scan "o"
p statement.scan("o").count
=end
title = "Flintstone Family Members"
p title.center(40)