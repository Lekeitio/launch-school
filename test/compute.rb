# compute.rb

def compute(english)
  nums = {
    'zero' => 0,
    'one' => 1,
    'two' => 2,
    'three' => 3,
    'four' => 4,
    'five' => 5,
    'six' => 6,
    'seven' => 7,
    'eight' => 8,
    'nine' => 9
  }

  words = english.split(' ')
  first = nums[words.first]
  second = nums[words.last]
  operation = words[1]

  case operation
  when 'plus'
    first + second
  when 'minus'
    first - second
  end
end

p compute("two plus two")
p compute("seven minus six")
p compute("zero plus eight")