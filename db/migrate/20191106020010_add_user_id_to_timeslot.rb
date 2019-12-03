class AddUserIdToTimeslot < ActiveRecord::Migration[5.2]
  using(:users_db)
  def change
    add_column :timeslots, :user_id, :integer
  end
end
