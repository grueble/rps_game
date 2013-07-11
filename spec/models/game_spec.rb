require 'spec_helper'

describe Game do 
  it { should have_many(:rounds) }
  
  subject { create(:game) }
  let!(:round1) { create(:round, :game_id => subject.id, 
                         :created_at => 10.seconds.ago, 
                         :player1_move => 'rock',
                         :player2_move => 'scissors') }
  let!(:round2) { create(:round, :game_id => subject.id, 
                         :created_at => 5.seconds.ago, 
                         :player1_move => 'rock',
                         :player2_move => 'scissors') }
  
  describe '#current_round_number' do
    it 'correctly returns the current round number' do
      subject.current_round_number.should == 2
    end
  end
  
  describe '#wins_for' do
    it 'calculates the number of wins for a given player' do
      subject.wins_for('player1').should == 2
    end
  end
  
  describe '#ties' do
    let!(:round3) { create(:round, :game_id => subject.id, :winner => 'tie')}
    
    it 'correctly returns the number of ties in a given Game' do
      subject.ties.should == 1
    end
  end
  
  describe '#total_moves_for' do
    it 'sums the number of moves of a certain type for a certain player' do
      subject.total_moves_for('player1', 'rock').should == 2
      subject.total_moves_for('player2', 'scissors').should == 2
    end
  end 
end 
