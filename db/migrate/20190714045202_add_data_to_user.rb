class AddDataToUser < ActiveRecord::Migration[6.0]
  def up
    add_column :users, :username, :string, null: false
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string

    add_index :users, :username, unique: true
  end

  def down
    remove_column :users, :username, :string, null: false
    remove_column :users, :first_name, :string
    remove_column :users, :last_name, :string

    remove_index :users, :username, unique: true
  end

end
