class AddStateKeyToGame < ActiveRecord::Migration[5.1]
  def change
    add_column :games, :current_state, :uuid
  end
end
