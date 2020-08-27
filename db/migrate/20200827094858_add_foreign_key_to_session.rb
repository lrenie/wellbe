class AddForeignKeyToSession < ActiveRecord::Migration[6.0]
  def change
    add_reference :sessions, :session_exercise, index: true 
  end
end
