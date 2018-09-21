class Game
attr_reader :player1, :player2, :turn

  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @turn = player1
  end

  def attack(player)
    player.reduce_hp
  end

  def turn_switcher
    @turn == player2 ? @turn = player1 : @turn = player2
  end

  def winner?
    player1.hit_points <= 0 || player2.hit_points <= 0
  end

  def winner
    if player1.hit_points <= 0
      player2
    elsif player2.hit_points <= 0
      player1
    end
  end
end
