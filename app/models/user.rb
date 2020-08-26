class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :friendships
  has_many :stats
  has_many :sessions, through: :session_participants, dependent: :destroy

  validates :last_name, presence: true
  validates :first_name, presence: true
  validates :last_name, uniqueness: true
end
