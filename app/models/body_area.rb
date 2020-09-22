class BodyArea < ApplicationRecord
  BODY_AREAS = ["général", "haut du corps", "bas du corps"]

  has_many :exercises
  has_many :sessions

  validates :name, uniqueness: true, presence: true
end
