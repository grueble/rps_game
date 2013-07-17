require 'spec_helper'

describe Game do 
  it { should allow_mass_assignment_of(:num_rounds) }
  it { should allow_mass_assignment_of(:theme) }
  it { should validate_presence_of(:num_rounds) }
  it { should validate_presence_of(:theme) }
  
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
  let!(:round3) { create(:round, :game_id => subject.id, 
                         :created_at => 15.seconds.ago, 
                         :player1_move => 'rock',
                         :player2_move => 'rock') }
  
  describe '#current_round_number' do
    it 'correctly returns the current round number' do
      subject.current_round_number.should == 3
    end
  end
  
  describe '#actual_round_number' do
    it 'correctly returns the actual round number (ties are ignored)' do
      subject.actual_round_number.should == 2
    end
  end
  
  describe '#wins_for' do
    it 'calculates the number of wins for a given player' do
      subject.wins_for('player1').should == 2
    end
  end
  
  describe '#ties' do
    it 'correctly returns the number of ties in a given Game' do
      subject.ties.should == 1
    end
  end
  
  describe '#total_moves_for' do
    it 'sums the number of moves of a certain type for a certain player' do
      subject.total_moves_for('player1', 'rock').should == 3
      subject.total_moves_for('player2', 'scissors').should == 2
    end
  end 
  
  describe '#game_winner_number' do
    it 'returns the numerical value of the winning player' do
      subject.game_winner_number.should == 1
    end
    
    context 'when there is a tie' do
      let!(:round4) { create(:round, :game_id => subject.id, 
                            :player1_move => 'paper',
                            :player2_move => 'scissors') }
      let!(:round5) { create(:round, :game_id => subject.id, 
                            :player1_move => 'paper',
                            :player2_move => 'scissors') }
      it 'returns 0' do
        subject.game_winner_number.should == 0
      end
    end
  end
end 
