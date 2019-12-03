class AddDayToTimeslot < ActiveRecord::Migration[5.2]
  def change
    add_column :timeslots, :day, :string
  end
end
