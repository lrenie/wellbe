class ChatParticipantsController < ApplicationController

  def new
    @chatroom = Chatroom.last
    @chat_participant = ChatParticipant.new
  end
  
  def create
    @user = User.find(params[:user_id])
    @chatroom = Chatroom.last
    @chatparticipant = ChatParticipant.new
    @chatparticipant.user = @user
    @chatparticipant.chatroom = @chatroom
    @chatparticipant.save!
  end

  def destroy
    @chatroom = Chatroom.find(params[:id])
    @user = current_user
    @chat_participants = ChatParticipant.where(chatroom_id: @chatroom.id)
    @chat_participant = @chat_participants.where(user_id: @user.id)
    @chat_participant.destroy_all
    redirect_to chatrooms_path 
  end
end
