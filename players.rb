class Player
  attr_accessor :name, :hand, :points, :dealer

  def initalize(name, dealer = false, hand = [], points = 0)
    @name = name
    @hand = hand
    @points = points
    @dealer = dealer
  end
end