class WinnerDeterminer
  def initialize(player1_move, player2_move)
    @player1_move = player1_move
    @player2_move = player2_move
  end
  
  def winning_player_number
    if beats?(@player1_move, @player2_move)
      1
    elsif beats?(@player2_move, @player1_move)
      2
    else
      0
    end
  end
  
  private
  
  def beats?(first, second)
    case first
    when 'rock'
      second == 'scissors'
    when 'paper'
      second == 'rock'
    when 'scissors'
      second == 'paper'
    end
  end
end