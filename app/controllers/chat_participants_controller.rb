class ChatParticipantsController < ApplicationController

  def new
    @chatroom = Chatroom.last
    @chat_participant = ChatParticipant.new
  end
  
  def create
    @user = User.find(params[:user_id])
    @chatroom = Chatroom.find(params[:chatroom_id])
    @chatparticipant = ChatParticipant.new
    @chatparticipant.user_id = @user
    @chatparticipant.chatroom_id = @chatroom
    @chatparticipant.save!

    # if @chatparticipant.save
    #   redirect_to sessions_choice_path
    # else
    #   redirect_to users_path
    # end
  end
end
