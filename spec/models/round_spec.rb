require 'spec_helper'

describe Round do
  subject { create(:round) }
  
  it { should belong_to(:game) }
  it { should allow_mass_assignment_of(:player1_move) }
  it { should allow_mass_assignment_of(:player2_move) }
  it { should allow_mass_assignment_of(:game_id) }
  it { should validate_presence_of(:game_id) }
  
  describe '#determine_winner' do
    context 'when player1 picks rock' do
      it 'identifies the winner when player2 picks rock' do
        subject.update_attributes(:player1_move => "rock", :player2_move => "rock")
        subject.determine_winner.should == 0
      end
      
      it 'identifies the winner when player2 picks paper' do
        subject.update_attributes(:player1_move => "rock", :player2_move => "paper")
        subject.determine_winner.should == 2
      end
      
      it 'identifies the winner when player2 picks scissors' do
        subject.update_attributes(:player1_move => "rock", :player2_move => "scissors")
        subject.determine_winner.should == 1
      end
    end
    
    context 'when player1 picks paper' do
      it 'identifies the winner when player2 picks rock' do
        subject.update_attributes(:player1_move => "paper", :player2_move => "rock")
        subject.determine_winner.should == 1
      end
      
      it 'identifies the winner when player2 picks paper' do
        subject.update_attributes(:player1_move => "paper", :player2_move => "paper")
        subject.determine_winner.should == 0
      end
      
      it 'identifies the winner when player2 picks scissors' do
        subject.update_attributes(:player1_move => "paper", :player2_move => "scissors")
        subject.determine_winner.should == 2
      end
    end
    
    context 'when player1 picks scissors' do
      it 'identifies the winner when player2 picks rock' do
        subject.update_attributes(:player1_move => "scissors", :player2_move => "rock")
        subject.determine_winner.should == 2
      end
      
      it 'identifies the winner when player2 picks paper' do
        subject.update_attributes(:player1_move => "scissors", :player2_move => "paper")
        subject.determine_winner.should == 1
      end
      
      it 'identifies the winner when player2 picks scissors' do
        subject.update_attributes(:player1_move => "scissors", :player2_move => "scissors")
        subject.determine_winner.should == 0
      end
    end
  end
  
  it "does not store a winner if the round is not over" do
    subject.update_attribute(:player1_move, "rock")
    subject.winner.should be_nil
  end
  
  it "stores the winner when the round is over" do
    subject.update_attributes(:player1_move => "rock", :player2_move => "scissors")
    subject.winner.should == 'player1'
  end
  
  describe '#round_over?' do
    it 'correctly identifies when a round is over' do
      subject.update_attributes(:player1_move => "rock", :player2_move => "scissors")
      subject.round_over?.should == true
    end
  end
end
