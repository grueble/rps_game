class ApplicationController < ActionController::Base
  protect_from_forgery
  
  helper_method :current_game, :total_moves_for
  
  protected
  
  def current_game
    @current_game ||= Game.find_by_id(session[:current_game_id])
  end
  
  def current_round
    current_game.current_round
  end
  
  def total_moves_for(player, move)
    current_game.rounds.where("#{player}_move" => move).count
  end
end
