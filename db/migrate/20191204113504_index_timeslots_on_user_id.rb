class IndexTimeslotsOnUserId < ActiveRecord::Migration[5.2]
  def change
    add_index :timeslots, :user_id
  end
end
