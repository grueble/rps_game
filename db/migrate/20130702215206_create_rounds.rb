class CreateRounds < ActiveRecord::Migration
  def change
    create_table :rounds do |t|
      t.string :player1_move
      t.string :player2_move
      t.integer :game_id, :null => false
      t.string :winner

      t.timestamps
    end
  end
end
