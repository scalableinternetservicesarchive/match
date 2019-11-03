class CreateGames < ActiveRecord::Migration[5.2]
  def change
    create_table :games do |t|
      t.int :status
      t.string :venue
      t.date :date
      t.time :start_time
      t.time :end_time
      t.string :result
      t.text :description

      t.timestamps
    end
  end
end
