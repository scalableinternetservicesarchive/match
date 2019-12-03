class AddInterestToGames < ActiveRecord::Migration[5.2]
  using(:games_db)
  def change
    add_column :games, :interest, :string
  end
end
