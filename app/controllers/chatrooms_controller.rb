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
  end

  def new
    @chatroom = Chatroom.new
    @friendships = current_user.all_friendships
    @friends = @friendships.map { |fs| fs.sender == current_user ? fs.recipient.id : fs.sender.id }
  end

end
