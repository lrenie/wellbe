class AddRepetionToExercises < ActiveRecord::Migration[6.0]
  def change
    add_column :exercises, :rep, :integer
  end
end
