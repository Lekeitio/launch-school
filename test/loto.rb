# loto.rb

c = []
d = []
a = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49]
b = a.combination(6).to_a
n = 0
loop do
  c = b.sample
  suma = c.inject(:+)
  pares = c.count{ |x| x.even? }
  impares = c.count{ |x| x.odd? }
  if suma > 100 || suma < 210
    if pares < 2 || pares > 4
      next
    else
      p c
      n = n + 1
    end
  end
  break if n == 5
end