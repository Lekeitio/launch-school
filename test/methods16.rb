 # methods16.rb

status = ['awake', 'tired'].sample

value = if status == 'awake'
          "Be productive!"
        else
          "Go to sleep!"
        end

puts value