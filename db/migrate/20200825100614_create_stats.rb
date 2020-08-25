class CreateStats < ActiveRecord::Migration[6.0]
  def change
    create_table :stats do |t|
      t.integer :time
      t.integer :kcal
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
