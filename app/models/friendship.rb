class Friendship < ApplicationRecord
  belongs_to :sender, class_name: "User"
  belongs_to :recipient, class_name: "User"

  validates :sender_id, uniqueness: true
  

 

  scope :accepted, -> { where(status: 'true') }
end
