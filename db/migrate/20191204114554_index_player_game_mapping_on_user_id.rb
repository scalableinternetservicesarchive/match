class IndexPlayerGameMappingOnUserId < ActiveRecord::Migration[5.2]
  def change
    add_index :player_game_mappings, :user_id
  end
end
