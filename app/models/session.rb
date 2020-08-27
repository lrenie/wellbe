class Session < ApplicationRecord
  belongs_to :user

  has_many :session_exercises, dependent: :destroy
  # has_many :users, through: :session_participant, dependent: :destroy
  has_many :session_participants, dependent: :destroy

  validates :difficulty, presence: true
  validates :mode, presence: true
  validates :total_time, presence: true
end
