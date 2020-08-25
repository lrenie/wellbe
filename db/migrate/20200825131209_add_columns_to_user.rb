class AddColumnsToUser < ActiveRecord::Migration[6.0]
  def change
    add_column :user, :first_name
    add_comumn :user, :last_name
    remove_column :user, :name
  end
end
