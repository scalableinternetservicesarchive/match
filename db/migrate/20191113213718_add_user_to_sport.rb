class AddUserToSport < ActiveRecord::Migration[5.2]
  def change
    add_column :sports, :user_id, :integer
  end
end
