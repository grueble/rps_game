require 'spec_helper'

describe MovesController do
  let(:game) { create(:game) }
  before do 
    session[:current_game_id] = game.id
  end

  describe 'GET #new' do
    before { get :new }
    
    it { should respond_with(:success) }
    it { should render_template(:new) }
  end
  
  describe 'GET #create' do
    before { game.rounds.create }
    
    describe "response" do
      before { get :create, :move => 'rock' }
    
      it { should respond_with(:success) }
      it { should render_template(:create) }
    end
    
    it "should add a move to the round" do
      round = Round.latest
      expect {
         get :create, :move => 'rock'
      }.to change{ round.reload.player1_move }.to('rock')
    end
  end
end
