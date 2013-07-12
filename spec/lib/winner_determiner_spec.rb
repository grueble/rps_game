require 'spec_helper'

describe WinnerDeterminer do
  describe '#winning_player_number' do
    context 'when player1 picks rock' do
      it 'identifies the winner when player2 picks rock' do
        described_class.new('rock', 'rock').winning_player_number.should == 0 
      end
      
      it 'identifies the winner when player2 picks paper' do
        described_class.new('rock', 'paper').winning_player_number.should == 2
      end
      
      it 'identifies the winner when player2 picks scissors' do
        described_class.new('rock', 'scissors').winning_player_number.should == 1
      end
    end
    
    context 'when player1 picks paper' do
      it 'identifies the winner when player2 picks rock' do
        described_class.new('paper', 'rock').winning_player_number.should == 1
      end
      
      it 'identifies the winner when player2 picks paper' do
        described_class.new('paper', 'paper').winning_player_number.should == 0 
      end
      
      it 'identifies the winner when player2 picks scissors' do
        described_class.new('paper', 'scissors').winning_player_number.should == 2
      end
    end
    
    context 'when player1 picks scissors' do
      it 'identifies the winner when player2 picks rock' do
        described_class.new('scissors', 'rock').winning_player_number.should == 2
      end
      
      it 'identifies the winner when player2 picks paper' do
        described_class.new('scissors', 'paper').winning_player_number.should == 1
      end
      
      it 'identifies the winner when player2 picks scissors' do
        described_class.new('scissors', 'scissors').winning_player_number.should == 0
      end
    end
  end
end