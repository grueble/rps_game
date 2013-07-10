class Round < ActiveRecord::Base
  attr_accessible :player1_move, :player2_move, :game_id
  
  validates :game_id, :presence => true

  before_save :store_winner, :if => :round_over?
  
  belongs_to :game
  
  def round_over?
    player1_move? && player2_move?
  end
  
  def determine_winner
    if player1_move == 'rock'
      if player2_move == 'rock'
        0
      elsif player2_move == 'paper'
        2
      elsif player2_move == 'scissors'
        1
      end
    elsif player1_move == 'paper'
      if player2_move == 'rock'
        1
      elsif player2_move == 'paper'
        0
      elsif player2_move == 'scissors'
        2
       end
    else player1_move == 'scissors'
      if player2_move == 'rock'
        2
      elsif player2_move == 'paper'
        1
      elsif player2_move == 'scissors'
        0
      end
    end
  end
  
  private
  
  def store_winner
    if determine_winner == 1
      self.winner = 'player1'
    elsif determine_winner == 2
      self.winner = 'player2'
    else
      self.winner = 'tie'
    end
  end
end
