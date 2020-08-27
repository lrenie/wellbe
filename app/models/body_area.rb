class BodyArea < ApplicationRecord
  has_many :exercises
  has_many :sessions

  validates :name, uniqueness: true, presence: true
end
