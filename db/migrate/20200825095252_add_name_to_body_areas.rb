class AddNameToBodyAreas < ActiveRecord::Migration[6.0]
  def change
    add_column :body_areas, :name, :string
  end
end
