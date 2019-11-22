class CreatePlayerGameMappings < ActiveRecord::Migration[5.2]
  def change
    create_table :player_game_mappings do |t|
      t.integer :user_id
      t.integer :game_id
      t.boolean :is_organizer

      t.timestamps
    end
  end
end
