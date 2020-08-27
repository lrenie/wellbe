class SessionsController < ApplicationController
  def choice
    @last_sessions = current_user.sessions.order(:date).last(2)
    @fav_session_participants = current_user.session_participants.where(favorite_status: true)
    @fav_sessions = []
    @fav_session_participants.each do |fav|
      @fav_sessions << Session.find(fav.session_id)
    end
  end

  def new
    @session = Session.new
    authorize @session
  end
end

# private

# # def fav?
#   @session = session.favorite_status
# # end
