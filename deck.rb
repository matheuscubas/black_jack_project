require "card.rb"

class Deck
  attr_accessor :hand

  def initialize
    @deck = []
    suits = ["Spades", "Diamonds", "Hearts", "Clubs"]
    ranks = ["Ace","2","3","4","5","6","7","8","9","10","Jack","Queen","King"]
    
    suits.each do |suit|
      ranks.each do |rank|
        card = Card.new(rank, suit)
        @deck << card
      end
    end
  end

  def deck_shuffle 
    @deck.shuffle!
  end

  def draw
    @deck.pop
  end
end