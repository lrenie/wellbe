class Exercise < ApplicationRecord
  belongs_to :body_area
  has_many :sessions, dependant: :destroy
end
