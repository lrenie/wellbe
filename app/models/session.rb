class Session < ApplicationRecord
  belongs_to :user
  belongs_to :warm_up
  belongs_to :exercice
  belongs_to :strech
  has_many :users through: :session_participant, dependent: :destroy
end
