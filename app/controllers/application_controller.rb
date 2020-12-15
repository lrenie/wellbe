class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :num_in_notif
  before_action :configure_permited_parameters, if: :devise_controller?

  def num_in_notif
    if user_signed_in?
      @friend_requests = Friendship.where(recipient_id: current_user.id).where(status: "pending")
    end
  end

  def default_url_options
    { host: ENV["DOMAIN"] || "localhost:3000" }
  end

  def configure_permited_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :avatar, :cover])
    devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name, :avatar, :cover, :email, :password])
  end


end
