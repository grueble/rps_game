class RpsBot
  attr_reader :params
  
  def initialize(params)
    @params = params
  end
  
  def move
    if params == { :move => 'rock' }
      'paper'
    elsif params == { :move => 'paper' }
      'scissors'
    else params == { :move => 'scissors' }
      'rock'
    end
  end
end