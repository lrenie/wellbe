class NotificationChannel < ApplicationCable::Channel
  def subscribed
    # stream_from "notification"
    puts "comment ca va?"
    # stream_for current_user
    user = User.find(params[:id])
    stream_for user
  end


  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
