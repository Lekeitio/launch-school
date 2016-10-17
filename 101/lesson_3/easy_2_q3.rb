# easy_2_q3.rb

=begin
ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }

p ages.keep_if { |_, age| age < 100}

# Q4

munsters_description = "The Munsters are creepy in a good way."

p munsters_description.capitalize!
p munsters_description.swapcase!
p munsters_description.downcase!
p munsters_description.upcase!

#Q5

ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10 }
additional_ages = { "Marilyn" => 22, "Spot" => 237 }

ages.merge!(additional_ages)
p ages
p ages.values.min
p ages.values.max

#Q7
advice = "Few things in life are as important as house training your pet dinosaur."
p advice.match("Dino")
p advice.match("things")

=end

#Q8
flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)
p flintstones.index { |name| name[0, 2] == "Be" }

#Q9
flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)
p flintstones.map { |name| name[0..2]}

