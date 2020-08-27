class BodyArea < ApplicationRecord
  BODY_AREAS = ["Général", "Haut du corps", "Bas du corps"]

  has_many :exercises

  validates :name, uniqueness: true, presence: true
end
