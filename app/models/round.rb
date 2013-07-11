class Round < ActiveRecord::Base
  attr_accessible :player1_move, :player2_move, :game_id
  
  validates :game_id, :presence => true

  before_save :store_winner, :if => :round_over?
  
  belongs_to :game
  
  def self.latest
    order('created_at DESC').first
  end
  
  def round_over?
    player1_move? && player2_move?
  end
  
  def determine_winner
    WinnerDeterminer.new(player1_move, player2_move).winning_player_number
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
