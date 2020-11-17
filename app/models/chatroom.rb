class Chatroom < ApplicationRecord
  has_many :messages
  has_many :chat_participants, dependent: :destroy
  belongs_to :user
end
