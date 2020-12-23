class BodyArea < ApplicationRecord
  BODY_AREAS = ["général", "haut du corps", "bas du corps"]

  has_many :exercises

  validates :name, uniqueness: true, presence: true
end
