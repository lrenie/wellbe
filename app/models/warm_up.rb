class WarmUp < ApplicationRecord
  belongs_to :body_area
  has_many :sessions, dependent: :destroy

  validates :name, :time, :kcal, presence: true
  validates :name, uniqueness: true

end
