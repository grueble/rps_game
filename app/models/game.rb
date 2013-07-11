class Game < ActiveRecord::Base
  has_many :rounds
  
  ROUNDS = 3
  
  def number_of_rounds
    ROUNDS
  end
  
  def current_round_number
    rounds.count
  end
  
  def wins_for(player)
    rounds.where(:winner => player).count
  end
  
  def current_round
    rounds.order('created_at DESC').first
  end
  
  def ties
    rounds.where(:winner => 'tie').count
  end
  
  def total_moves_for(player, move)
    rounds.where("#{player}_move" => move).count
  end
end
