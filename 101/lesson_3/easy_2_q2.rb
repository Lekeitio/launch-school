# easy_2_q2.rb

=begin
ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10, "Marilyn" => 22, "Spot" => 237 }
p ages.values.inject(:+)
p ages.values

p %w[ant bear cat].all? { |word| word.length >= 3 }
p %w[ant bear cat].all? { |word| word.length >= 4 }
p %w[ant bear cat].all? { |word| word.length >= 2 }

[3, 1, 4, 1, 5, 9, 2, 6, 5, 3, 5, 6, 8, 10].chunk { |n|
  n.even?
}.each { |even, ary|
  p [even, ary]
}

p (1..100).detect { |i| i % 5 == 0 and i % 8 == 0 }

(1..10).each_cons(6) { |a| p a }

p (1..6).partition { |v| v.odd? }
=end

prueba = [1, 12, 23, 13, 45, 22]
p prueba
p prueba.sort
p prueba.sort.reverse
p prueba.shuffle
p prueba.shuffle





