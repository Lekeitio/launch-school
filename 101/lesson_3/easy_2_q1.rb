# easy_2_q1.rb

ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }

p ages.key?("Spot")
p ages.key?("Herman")

p ages.include?("Spot")
p ages.include?("Herman")

p ages.member?("Spot")
p ages.member?("Herman")