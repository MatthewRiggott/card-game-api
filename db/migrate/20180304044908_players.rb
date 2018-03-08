class Players < ActiveRecord::Migration[5.1]
  def change
    remove_column :games, :players, :string
    remove_column :games,  :inputs, :jsonb

    create_table :players, id: :uuid do |t|
      t.string :name
      t.timestamps
    end
    add_index :players, 'lower(name)', name: 'index_users_on_lower_name', unique: true

    create_table :player_inputs do |t|
      t.references :game, type: :uuid
      t.references :player, type: :uuid

      t.boolean :is_host
      t.jsonb :action
      t.timestamps
    end
    add_index :player_inputs, [:game_id, :player_id], name: 'index_player_inputs', unique: true
  end
end
