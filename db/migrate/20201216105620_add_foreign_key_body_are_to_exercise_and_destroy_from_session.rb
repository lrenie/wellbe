class AddForeignKeyBodyAreToExerciseAndDestroyFromSession < ActiveRecord::Migration[6.0]
  def change
    remove_foreign_key :sessions, :body_areas
  end
end
