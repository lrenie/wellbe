class SessionParticipantsController < ApplicationController
  def update
    @session_participant = SessionParticipant.find(params[:id])
    @session_participant.favorite_status = !@session_participant.favorite_status
    @session_participant.save

    if request.referer.include?('sessions')
      redirect_to sessions_choice_path
    else
      redirect_to user_path(current_user, param: "update")
    end
  end
end
