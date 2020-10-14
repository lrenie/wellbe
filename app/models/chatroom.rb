class Chatroom < ApplicationRecord
  has_many :messages
  has_many :chat_participants
  belongs_to :user
end
