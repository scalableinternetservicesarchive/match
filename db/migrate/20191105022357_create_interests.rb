class CreateInterests < ActiveRecord::Migration[5.2]
  using(:games_db)
  def change
    create_table :interests do |t|

      t.timestamps
    end
  end
end
