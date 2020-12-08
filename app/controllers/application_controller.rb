class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :num_in_notif
  # before_action :counter_broadcasting

  def num_in_notif
    if user_signed_in?
      @friend_requests = Friendship.where(recipient_id: current_user.id).where(status: "pending")
    end
  end

  # def counter_broadcasting
  #   if user_signed_in?
  #     CounterNotificationChannel.broadcast_to(
  #       current_user,
  #       # render_to_string(partial: "red_counter", locals: {friend_requests: @friend_requests })
  #       { friend_requests: @friend_requests}
  #     )
  #   end
  # end

  def default_url_options
    { host: ENV["DOMAIN"] || "localhost:3000" }
  end





end
