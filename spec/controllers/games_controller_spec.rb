require 'spec_helper'

describe GamesController do
  let!(:game) { create(:game) }
  before do 
    session[:current_game_id] = game.id
  end
  
  describe 'POST #create' do 
    it 'successfully creates a game' do
      expect { post :create }.to change{ Game.count }.by(1)
    end
  end
  
  describe 'GET #new' do
    before { get :new }
    
    it { should respond_with(:success) }
    it { should render_template(:new) }
  end
  
  describe 'GET #show' do
    before { get :show }
    
    it { should respond_with(:success) }
    it { should render_template(:show) }
  end
end
