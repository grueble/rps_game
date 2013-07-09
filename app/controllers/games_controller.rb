class GamesController < ApplicationController
  def new
    @game = Game.new
  end
  
  def show
    @game = Game.find(session[:current_game_id])
  end
  
  def create
    @game = Game.create
    session[:current_game_id] = @game.id
    redirect_to new_move_url
  end
end
