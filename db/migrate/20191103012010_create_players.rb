class CreatePlayers < ActiveRecord::Migration[5.2]
  using(:games_db)
  def change
    create_table :players do |t|
      t.text :bio

      t.timestamps
    end
  end
end
