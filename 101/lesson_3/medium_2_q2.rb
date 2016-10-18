# medium_3_q2.rb

munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" }
}

#(Name) is a (age) year old (male or female).
munsters.each do |name, details|
  puts "#{name} is a #{details["age"]} year old #{details["gender"]}."
end