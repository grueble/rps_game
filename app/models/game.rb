class Game < ActiveRecord::Base
  has_many :rounds
  
  ROUNDS = 3
  
  def number_of_rounds
    ROUNDS
  end
  
  def current_round_number
    rounds.count
  end
  
  def actual_round_number
    rounds.where("winner != ?", 'tie').count
  end
  
  def wins_for(player)
    rounds.where(:winner => player).count
  end
  
  def ties
    rounds.where(:winner => 'tie').count
  end
  
  def total_moves_for(player, move)
    rounds.where("#{player}_move" => move).count
  end
  
  def game_winner_number
    if wins_for('player1') > wins_for('player2')
      1
    elsif wins_for('player1') < wins_for('player2')
      2
    else
      0
    end
  end
  
  def over?
    actual_round_number < number_of_rounds
  end
end
