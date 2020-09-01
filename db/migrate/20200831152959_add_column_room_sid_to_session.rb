class AddColumnRoomSidToSession < ActiveRecord::Migration[6.0]
  def change
    add_column :sessions, :room_sid, :string
  end
end
