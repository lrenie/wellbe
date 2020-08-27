class BodyArea < ApplicationRecord
  
  has_many :exercises
  

  validates :name, uniqueness: true, presence: true
end
