class Card
  attr_accessor :rank, :suit, :value

  def initialize(rank, suit)
    @rank = rank
    @suit = suit
    @value = 
    case rank
      when rank == "Ace", "Ace"
        @value = 1
      when rank == "Jack", "Queen", "King","Jack"
        @value = 10
      else
        @value = self.rank
    end
  end

  def show_card_value(player)
  puts "#{player.name} has drawn a #{self.rank} of #{self.suit} and it's worth #{self.value} points"
  end
end