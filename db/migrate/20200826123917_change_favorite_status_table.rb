class ChangeFavoriteStatusTable < ActiveRecord::Migration[6.0]
  def change
    remove_column :sessions, :favorite_status
    add_column :session_participants, :favorite_status, :boolean
  end
end
