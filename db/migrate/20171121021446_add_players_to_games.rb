class AddPlayersToGames < ActiveRecord::Migration[5.1]
  def change
    add_column :games, :players, :string, array: true, default: []
    add_column :games, :inputs, :jsonb
  end
end
