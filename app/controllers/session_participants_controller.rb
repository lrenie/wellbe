class SessionParticipantsController < ApplicationController
  def update
    @session_participant = SessionParticipant.find(params[:id])
    @session_participant.favorite_status = !@session_participant.favorite_status
    @session_participant.save
    redirect_to sessions_choice_path
  end
end
