require 'spec_helper'

describe Round do
  it { should belong_to(:game) }
  it { should allow_mass_assignment_of(:player1_move) }
  it { should allow_mass_assignment_of(:player2_move) }
  it { should allow_mass_assignment_of(:game_id) }
  it { should validate_presence_of(:game_id) }
  
  describe '.determine_winner' do
    subject { create(:round)}
    
    it 'identifies the winner of a given round' do
      subject.determine_winner.should == 1
    end
  end
end
