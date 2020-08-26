class Session < ApplicationRecord
  belongs_to :user
  belongs_to :warm_up
  belongs_to :exercise
  belongs_to :strech
  has_many :users, through: :session_participant, dependent: :destroy
  has_many :session_participants

  validates :difficulty, presence: true
  validates :mode, presence: true
  validates :total_time, presence: true
end
