require 'spec_helper'

describe WinnerDeterminer do
  describe '#winning_player_number' do
    it 'correctly identifies player 2 as the winner' do
      described_class.new('rock', 'paper').winning_player_number.should == 2
    end
    
    it 'correctly identifies player 1 as the winner' do
      described_class.new('rock', 'scissors').winning_player_number.should == 1
    end
    
    it 'correctly identifies a tie' do
      described_class.new('rock', 'rock').winning_player_number.should == 0
    end
  end
end