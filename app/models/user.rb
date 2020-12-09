require 'twilio-ruby'

class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :friendships, class_name: 'Friendship', foreign_key: :sender_id
  has_many :recieved_friendships, class_name: 'Friendship', foreign_key: :recipient_id

  has_many :stats, dependent: :destroy
  has_many :session_participants, dependent: :destroy
  has_many :sessions, through: :session_participants, dependent: :destroy
  has_many :chat_participants, dependent: :destroy
  has_many :messages, dependent: :destroy
  has_many :chatrooms, dependent: :destroy

  has_one_attached :avatar
  has_one_attached :cover

  validates :last_name, presence: true
  validates :first_name, presence: true
  validates :email, uniqueness: true
  validates :last_name, uniqueness: true


  def regenerate_twilio_token
    # Required for any Twilio Access Token
    account_sid = ENV["ACCOUNT_SID"]
    api_key = ENV["API_KEY_SID"]
    api_secret = ENV["API_KEY_SECRET"]

    # Required for Video
    identity = self.id

    # Create Video grant for our token
    video_grant = Twilio::JWT::AccessToken::VideoGrant.new
    video_grant.room = 'cool room'

    # Create an Access Token
    token = Twilio::JWT::AccessToken.new(
      account_sid,
      api_key,
      api_secret,
      [video_grant],
      identity: identity
    )

    # Generate the token
    self.twilio_token = token.to_jwt
    self.twilio_expire = Time.now.utc + 3000
    self.save
  end

  def read_twilio_token
    regenerate_twilio_token if twilio_token.nil? || Time.now.utc > twilio_expire
    self.twilio_token
  end

  def all_friendships
    [self.friendships.accepted, self.recieved_friendships.accepted].flatten
  end
end
