class GameRules

  def initialize
  end

  def over_21?(player)
    if player.points.to_i > 21
      return true
    else
      return false
    end
  end

  def declare_winner(player1, dealer)
    if player1.points > dealer.points
      puts "Congratulations #{p1.name} you have won!"
    else
      puts "At the end of the day the House always win"
    end
  end

  def player_points(player)
  end
end