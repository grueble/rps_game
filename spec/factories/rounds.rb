# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :round do
    game
    game_id 1
    player1_move 'rock'
    player2_move 'scissors'
    winner 'player1'
  end
end
