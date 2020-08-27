class AddComlumnBodyAreaToSession < ActiveRecord::Migration[6.0]
  def change
    add_reference :sessions, :body_area, foreign_key: true
  end
end
