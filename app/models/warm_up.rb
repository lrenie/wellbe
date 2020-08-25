class WarmUp < ApplicationRecord
  belongs_to :body_area
  has_many :sessions, dependent: :destroy
end
