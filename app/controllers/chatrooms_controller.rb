class ChatroomsController < ApplicationController
  def show
    @chatroom = Chatroom.find(params[:id])
    @chatrooms = Chatroom.all
    @chat_participant = ChatParticipant.where(chatroom_id: @chatroom.id)
    @message = Message.new
  end

  def index
    @chatrooms = Chatroom.all
    @chat_participants = ChatParticipant.all
  end

  def new
    @chatroom = Chatroom.new
    @friendships = current_user.all_friendships
    @friends = @friendships.map { |fs| fs.sender == current_user ? fs.recipient.id : fs.sender.id }
  end

end
