class CreateExercises < ActiveRecord::Migration[6.0]
  def change
    create_table :exercises do |t|
      t.string :name
      t.integer :time
      t.integer :diff_coef
      t.integer :kcal
      t.references :body_area, null: false, foreign_key: true

      t.timestamps
    end
  end
end
