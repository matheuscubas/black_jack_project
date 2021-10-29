require 'card.rb'
require 'deck.rb'
require 'players.rb'

p1 = Player.new
dealer = Player.new
game_deck = Deck.new

puts "\n"
puts "Wellcome, you're playing a Black Jack game designed and developd by Matheus Vidal".center(100)
puts "Thanks for your time, enjoy the game.".center(55)
puts "A quick guide before you start, the goal here is to beat de Dealer".center(85)
puts "You will receive a pair of cards in the beggining of the game".center(80)
puts "Each card has a value 2~10 has it's number as it's value".center(74)
puts "Ex: if have a hand of 10 and 8, you got 18 points.".center(68)
puts "\n"
puts "The Dealer will draw one then you decide if you stop quit or ask for 1 more card".center(98)
puts "The limit is 21 points, so if you go over 21 you lose the game".center(81)
puts "After you are done with your play, the Dealer receives his final card".center(88)
puts "Whoever has the most points whitout going over 21 Wins!".center(74)
puts "\n"
puts "Now good luck and enjoy the game.".center(80)
puts "\n"
puts "What's your name?"
p1.name = gets.chomp
p1.hand = []
p1.points = 0
p1.dealer = false
dealer.name = 'Dealer'
dealer.hand = []
dealer.points = 0
dealer.dealer = true
puts "#{p1.name} now the #{dealer.name} will shuffle the deck"
puts "keep yours eyes open!"
game_deck.deck_shuffle
puts "All set, let's draw"
dealer.hand.push(game_deck.draw)
dealer.hand[0].show_card_value(dealer)
dealer.points += dealer.hand[0].value.to_i
puts "the #{dealer.name} has a total of #{dealer.points} points!"