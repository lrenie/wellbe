class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :num_in_notif


  def default_url_options
    { host: ENV["DOMAIN"] || "localhost:3000" }
  end

  private

  def num_in_notif
    if user_signed_in?
      @friend_requests = Friendship.where(recipient_id: current_user.id).where(status: "pending")
    end
  end

end
