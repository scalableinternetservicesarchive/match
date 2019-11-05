class AddInterestToGames < ActiveRecord::Migration[5.2]
  def change
    add_column :games, :interest, :string
  end
end
