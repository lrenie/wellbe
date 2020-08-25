class CreateBodyAreas < ActiveRecord::Migration[6.0]
  def change
    create_table :body_areas do |t|

      t.timestamps
    end
  end
end
