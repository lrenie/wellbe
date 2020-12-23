class AddRestTimeToExercises < ActiveRecord::Migration[6.0]
  def change
    add_column :exercises, :rest_time, :integer
  end
end
