class CreateSessions < ActiveRecord::Migration[6.0]
  def change
    create_table :sessions do |t|
      t.string :difficulty
      t.boolean :favorite_status
      t.string :mode
      t.datetime :date
      t.boolean :video
      t.integer :total_time
      t.references :user, null: false, foreign_key: true
      # t.references :warm_up, null: false, foreign_key: true
      # t.references :exercise, null: false, foreign_key: true
      # t.references :strech, null: false, foreign_key: true

      t.timestamps
    end
  end
end
