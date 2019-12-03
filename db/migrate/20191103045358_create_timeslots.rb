class CreateTimeslots < ActiveRecord::Migration[5.2]
  using(:users_db)
  def change
    create_table :timeslots do |t|
      t.time :time

      t.timestamps
    end
  end
end
