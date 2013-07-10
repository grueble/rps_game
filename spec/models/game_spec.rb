require 'spec_helper'

describe Game do 
  it { should have_many(:rounds) }
  
  subject { create(:game, :id => 1) }
  let!(:round1) { create(:round, :game_id => 1, 
                         :created_at => 10.seconds.ago, 
                         :winner => 'player1') }
  let!(:round2) { create(:round, :game_id => 1, 
                         :created_at => 5.seconds.ago, 
                         :winner => 'player1') }
  
  describe '.current_round_number' do
    it 'correctly returns the current round number' do
      subject.current_round_number.should == 2
    end
  end
  
  describe '.wins_for' do
    it 'calculates the number of wins for a given player' do
      subject.wins_for('player1').should == 2
    end
  end
  
  describe '.current_round' do
    it 'properly returns a Round object for the current round' do
      subject.current_round.should == round2
    end
  end
  
  describe '.ties' do
    let!(:round3) { create(:round, :game_id => 1, :winner => 'tie')}
    
    it 'correctly returns the number of ties in a given Game' do
      subject.ties.should == 1
    end
  end
end 
