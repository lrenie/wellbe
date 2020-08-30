class Session < ApplicationRecord
  DIFFICULTY = ["Débutant", "Intermédiaire", "Avancé", "Confirmé"]

  belongs_to :user
  belongs_to :body_area

  has has_many :exercices, through: :session_exercises
  has_many :session_exercises, dependent: :destroy
  # has_many :users, through: :session_participant, dependent: :destroy
  has_many :session_participants, dependent: :destroy


  validates :difficulty, presence: true
  validates :mode, presence: true
  validates :total_time, presence: true
end
