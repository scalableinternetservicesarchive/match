class AddDayToTimeslot < ActiveRecord::Migration[5.2]
  using(:users_db)
  def change
    add_column :timeslots, :day, :string
  end
end
