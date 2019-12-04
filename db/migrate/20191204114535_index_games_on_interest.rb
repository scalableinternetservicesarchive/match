class IndexGamesOnInterest < ActiveRecord::Migration[5.2]
  def change
    add_index :games, :interest
  end
end
