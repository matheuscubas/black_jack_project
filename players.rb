class Player
  attr_accessor :name, :hand, :points, :dealer

  def initalize(name, hand = [], points = 0)
    @name = name
    @hand = hand
    @points = points
    @dealer = dealer
  end
end