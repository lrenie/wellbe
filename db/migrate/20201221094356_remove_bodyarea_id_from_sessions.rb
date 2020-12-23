class RemoveBodyareaIdFromSessions < ActiveRecord::Migration[6.0]
  def change
    remove_reference(:sessions, :body_area, index: false)
  end
end
