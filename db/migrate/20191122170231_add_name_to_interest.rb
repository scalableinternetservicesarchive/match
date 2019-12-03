class AddNameToInterest < ActiveRecord::Migration[5.2]
  def change
    add_column :interests, :name, :string
  end
end
