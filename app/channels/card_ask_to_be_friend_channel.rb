class CardAskToBeFriendChannel < ApplicationCable::Channel
  def subscribed
    # stream_from "some_channel"
    stream_from "card_ask_to_be_friend:#{current_user.id}"
    puts "HELLO CARDASKTOBEFRIEND"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
