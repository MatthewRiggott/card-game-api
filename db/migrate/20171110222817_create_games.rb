class CreateGames < ActiveRecord::Migration[5.1]
  def change
    create_table :games, id: :uuid do |t|
      t.string :name
      t.jsonb :data

      t.timestamps
    end
  end
end
