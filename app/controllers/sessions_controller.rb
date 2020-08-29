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
    @session = Session.find(params[:id])
    @times = []
    @names = []
    @session.session_exercise_ids.each do |id|
        @names << Exercise.find(id).name
        if Exercise.find(id).id != @session.session_exercise_ids.last
          @names << "repos"
        end
        @times << Exercise.find(id).time
        if Exercise.find(id).id != @session.session_exercise_ids.last
          @times << 10
        end
      end
  end
end

# private

# # def fav?
#   @session = session.favorite_status
# # end
