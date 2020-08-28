class BodyArea < ApplicationRecord

  BODY_AREAS = ["Général", "Haut du corps", "Bas du corps"]

  has_many :exercises
  has_many :sessions

  validates :name, uniqueness: true, presence: true
end
