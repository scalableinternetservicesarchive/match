class IndexPlayerInterestMappingOnUserId < ActiveRecord::Migration[5.2]
  def change
    add_index :player_interest_mappings, :user_id
  end
end
