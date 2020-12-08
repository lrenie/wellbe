class CounterNotificationChannel < ApplicationCable::Channel
  def subscribed
    stream_from "counter_notification:#{current_user.id}"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
