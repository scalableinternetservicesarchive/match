class AddInterestToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :interest, :string
  end
end
