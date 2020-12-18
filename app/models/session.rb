require 'rubygems'
require 'twilio-ruby'

class Session < ApplicationRecord
  DIFFICULTY = ["Débutant", "Intermédiaire", "Avancé", "Confirmé"]

  belongs_to :user
  belongs_to :body_area

  has_many :session_exercises, dependent: :destroy
  has_many :exercises, through: :session_exercises

  # has_many :users, through: :session_participant, dependent: :destroy
  has_many :session_participants, dependent: :destroy

  # validates :difficulty, presence: true
  # validates :mode, presence: true
  # validates :total_time, presence: true
  after_create :create_twilio_room

  def create_twilio_room
    account_sid = ENV["ACCOUNT_SID"]
    auth_token = ENV["AUTH_TOKEN"]
    @client = Twilio::REST::Client.new(account_sid, auth_token)

    unless room_sid.present?
      twilio_room = @client.video.rooms.create(unique_name: "wellbe_session_#{id}")
      update(room_sid: twilio_room.sid)
    end
  end

  def room_name
    "wellbe_session_#{id}"
  end
end
