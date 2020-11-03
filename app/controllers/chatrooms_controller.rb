class ChatroomsController < ApplicationController
  def show
    @chatroom = Chatroom.find(params[:id])
    @chatrooms = Chatroom.all
    @chat_participants = ChatParticipant.all
    @participants = ChatParticipant.where(chatroom_id: @chatroom.id)
    @message = Message.new
  end

  def index
    @chatrooms = Chatroom.all
    @chat_participants = ChatParticipant.all
    @chatroom = Chatroom.new
    # @chatroom = Chatroom.find(params[:chatroom_id])
    @friendships = current_user.all_friendships
    @friends = @friendships.map { |fs| fs.sender == current_user ? fs.recipient.id : fs.sender.id }
    @chatroom_for_new_chat_participants = Chatroom.last.id + 1
  end

  def new
    @chatroom = Chatroom.new
    @friendships = current_user.all_friendships
    @friends = @friendships.map { |fs| fs.sender == current_user ? fs.recipient.id : fs.sender.id }
  end

  def create
    @chatroom = Chatroom.new
    @chatroom.user = current_user
    @chatroom.name = 'default'
    @chatroom.save
    @current_user = current_user
    @chat_participant = ChatParticipant.new(user_id: @current_user.id, chatroom_id: @chatroom.id)
    @chat_participant.save
  end

  private

  # def chatroom_params
  #   params.require(:chatroom).permit(:name)
  # end
end
