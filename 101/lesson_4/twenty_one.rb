# twenty_one.rb
require 'pry'

=begin
  1. Initialize Deck
  2. Deal cards to player and dealer
  3. Player turn: hit or stay
    - repeat unitl bust or stay
  4. If player bust, dealer wins
  5. Dealer turn: hit or stay
    - repeat until total >= 17
  6. If dealer bust, player wins
  7. Compare cards and declare winner
=end

# initial values
HEARTS = ['2h', '3h', '4h', '5h', '6h', '7h', '8h',
          '9h', '10h', 'Jh', 'Qh', 'Kh', 'Ah']
DIAMONDS = ['2d', '3d', '4d', '5d', '6d', '7d', '8d',
            '9d', '10d', 'Jd', 'Qd', 'Kd', 'Ad'].freeze
CLUBS = ['2c', '3c', '4c', '5c', '6c', '7c', '8c',
         '9c', '10c', 'Jc', 'Qc', 'Kc', 'Ac'].freeze
SPADES = ['2s', '3s', '4s', '5s', '6s', '7s', '8s',
          '9s', '10s', 'Js', 'Qs', 'Ks', 'As'].freeze
DECK = HEARTS.concat(DIAMONDS).concat(CLUBS).concat(SPADES)
NUMBER_DECKS = 1
CARD_SHOW = 0

def shuffle_deck!
  deck = []
  (1..NUMBER_DECKS).each do
    deck = deck.concat(DECK)
  end
  deck = deck.shuffle
end

def show_play_table(p_hand, d_hand)
  p_c = show_cards_table(p_hand, 'Player')
  d_c = show_cards_table(d_hand, 'Dealer')
  system 'clear'
  puts " "
  puts "Dealer Hand: #{d_c}"
  puts " "
  puts "----------------------------"
  puts " "
  puts "Player Hand: #{p_c}"
  puts "Player Hand Value: #{hand_value(p_hand)}"
  puts " "
end

def show_cards_table(hand, plyr = ' ')
  hand_cards = []
  player = plyr
  hand.each_with_index do |v, i|
    player == 'Dealer' && i == CARD_SHOW ? hand_value = 'X' : hand_value = v[0]
    hand_cards << hand_value
  end
  hand_cards.join(' ')
end

def card_value?(crd)
  card = crd[0]

  if card == 'J' ||
     card == 'Q' ||
     card == 'K' ||
     card == '1'
    10
  elsif card == 'A'
    11
  else
    crd[0].to_i
  end
end

def hand_value(hndv)
  sum = 0
  hndv.each do |v|
    sum += v[1]
    if v[0][0] == 'A'
      sum -= 10 if sum > 21
    end
  end
  sum
end

def initial_deal!(shd)
  hand = []
  2.times do
    dealed_car = deal_card!(shd)
    hand << [dealed_car, card_value?(dealed_car)]
  end
  hand
end

def play_deal!(shd)
  hand = []
  dealed_car = deal_card!(shd)
  hand.concat([dealed_car, card_value?(dealed_car)])
end

def deal_card!(deck)
  deck.pop
end

def busted?(hand)
  true if hand_value(hand) > 21
end

def show_end_mssg(player_hand, dealer_hand)
  puts "Player hand is: #{show_cards_table(player_hand)}," \
       " count is #{hand_value(player_hand)}"
  puts "Dealer hand is: #{show_cards_table(dealer_hand)}," \
       " count is #{hand_value(dealer_hand)}"
end

# game
shuffled_deck = shuffle_deck!
player_hand = []
dealer_hand = []

player_hand = initial_deal!(shuffled_deck)
dealer_hand = initial_deal!(shuffled_deck)

show_play_table(player_hand, dealer_hand)

loop do
  puts "(h)it or (s)tay?"
  answer = gets.chomp.downcase
  break if answer == 's' || busted?(player_hand)
  player_hand << play_deal!(shuffled_deck)
  break if busted?(player_hand)
  show_play_table(player_hand, dealer_hand)
end
show_play_table(player_hand, dealer_hand)
if busted?(player_hand)
  puts "So, sorry...."
else
  puts "You chose to stay"
end

loop do # dealer playing
  break if busted?(player_hand) || hand_value(dealer_hand) >= 17
  dealer_hand << play_deal!(shuffled_deck)
  break if busted?(dealer_hand)
  show_play_table(player_hand, dealer_hand)
end

# who won?
if ((hand_value(player_hand) <= 21) &&
   (hand_value(player_hand) > hand_value(dealer_hand))) ||
   busted?(dealer_hand)
  puts "Player wins"
  show_end_mssg(player_hand, dealer_hand)
elsif hand_value(dealer_hand) <= 21
  puts "Casino wins"
  show_end_mssg(player_hand, dealer_hand)
end