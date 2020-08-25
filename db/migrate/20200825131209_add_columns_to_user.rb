class AddColumnsToUser < ActiveRecord::Migration[6.0]
  def change
    add_column :user, :first_name, :string
    add_column :user, :last_name, :string
    remove_column :user, :name, :string
  end
end
