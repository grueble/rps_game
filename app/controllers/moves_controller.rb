class MovesController < ApplicationController
  def new
    current_game.rounds.create
  end
  
  def create
    current_game.rounds.latest.update_attributes(:player1_move => params[:move], 
                                                 :player2_move => move_for_ai)
  end
  
  private
  
  def move_for_ai
    [ 'rock', 'paper', 'scissors' ].sample
  end
end