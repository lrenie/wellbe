class SessionsController < ApplicationController
  def choice
    @last_sessions = current_user.sessions.order(:date).last(3)
    @fav_session_participants = current_user.session_participants.where(favorite_status: true)
    @fav_sessions = []
    @fav_session_participants.each do |fav|
      @fav_sessions << Session.find(fav.session_id)
    end
  end

  def new
    @session = Session.new
  end

  def show
    @sessions = Session.all
    @session = Session.find(params[:id])
    @time = @session.total_time
    @times = []
    (@time/60).times do
      @times << 50
      @times << 10
    end
    raise
  end
end

# private

# # def fav?
#   @session = session.favorite_status
# # end
