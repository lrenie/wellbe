class AddColumnAccessToken < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :twilio_token, :string
    add_column :users, :twilio_expire, :datetime
  end
end
