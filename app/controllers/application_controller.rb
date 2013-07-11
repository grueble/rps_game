class ApplicationController < ActionController::Base
  protect_from_forgery
  
  helper_method :current_game
  
  protected
  
  def current_game
    @current_game ||= Game.find_by_id(session[:current_game_id])
  end
  
  def current_round
    current_game.rounds.latest
  end
end
