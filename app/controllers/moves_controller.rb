class MovesController < ApplicationController
  def new
    current_game.rounds.create
  end
  
  def create
    current_game.current_round.update_attributes(:player1_move => params[:move], 
                                                 :player2_move => 'rock')
  end
end