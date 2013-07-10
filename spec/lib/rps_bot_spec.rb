require 'spec_helper'

describe RpsBot do
  describe '#move' do
    it 'returns rock if move is rock' do
      described_class.new({:move => 'rock'}).move.should eq('paper')
    end
    
    it 'returns paper if move is paper' do
      described_class.new({:move => 'paper'}).move.should eq('scissors')
    end
    
    it 'returns scissors if move is scissors' do
      described_class.new({:move => 'scissors'}).move.should eq('rock')
    end
  end
end