class AddMoreFieldsToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :username, :string
    add_column :users, :bio, :text
    add_column :users, :phone, :integer
    add_column :users, :age, :integer
    add_column :users, :gender, :string
  end
end
