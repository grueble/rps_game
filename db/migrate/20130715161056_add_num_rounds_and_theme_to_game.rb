class AddNumRoundsAndThemeToGame < ActiveRecord::Migration
  def change
    add_column :games, :num_rounds, :integer, :null => false, :default => 3
    add_column :games, :theme, :string, :null => false, :default => 'classic'
  end
end
 