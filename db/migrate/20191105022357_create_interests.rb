class CreateInterests < ActiveRecord::Migration[5.2]
  def change
    create_table :interests do |t|

      t.timestamps
    end
  end
end
