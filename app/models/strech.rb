class Strech < ApplicationRecord
  belongs_to :body_area
  has_many :sessions, dependent: :destroy

  validates :name, presence: true
  validates :name, uniqueness: true
  validates :time, presence: true
  validates :kcal, presence: true
end
