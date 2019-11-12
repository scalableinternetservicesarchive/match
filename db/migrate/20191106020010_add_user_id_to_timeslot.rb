class AddUserIdToTimeslot < ActiveRecord::Migration[5.2]
  def change
    add_column :timeslots, :user_id, :integer
  end
end
