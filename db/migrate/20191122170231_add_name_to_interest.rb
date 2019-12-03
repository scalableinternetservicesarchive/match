class AddNameToInterest < ActiveRecord::Migration[5.2]
  using(:games_db)
  def change
    add_column :interests, :name, :string
  end
end
