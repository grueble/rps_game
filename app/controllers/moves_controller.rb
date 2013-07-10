class MovesController < ApplicationController
  def new
    current_game.rounds.create
  end
  
  def create
    current_game.current_round.update_attributes(:player1_move => params[:move], 
                                                 :player2_move => move_for_ai)
    current_game.current_round.determine_winner
  end
  
  private
  
  def move_for_ai
    RpsBot.new(params[:move]).move
  end
end