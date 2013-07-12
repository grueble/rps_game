require 'spec_helper'

describe Round do
  subject { create(:round) }
  
  it { should belong_to(:game) }
  it { should allow_mass_assignment_of(:player1_move) }
  it { should allow_mass_assignment_of(:player2_move) }
  it { should allow_mass_assignment_of(:game_id) }
  it { should validate_presence_of(:game_id) }
  
  describe '#determine_winner' do
    it 'correctly calls an object of the WinnerDeterminer Class' do
      subject.update_attributes(:player1_move => 'rock', :player2_move => 'scissors')
      winner_determiner = stub(:winning_player_number => 1)
      WinnerDeterminer.should_receive(:new).with('rock', 'scissors').and_return(winner_determiner)
      subject.determine_winner
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
