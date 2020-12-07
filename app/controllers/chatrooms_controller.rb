class ChatroomsController < ApplicationController
  def show
    @chatroom = Chatroom.find(params[:id])
    @chatrooms = Chatroom.all
    @chat_participants = ChatParticipant.all
    @participants = ChatParticipant.where(chatroom_id: @chatroom.id)
    @message = Message.new
    @friendships = current_user.all_friendships
    @friends = @friendships.map { |fs| fs.sender == current_user ? fs.recipient.id : fs.sender.id }
    @chatroom_for_new_chat_participants = Chatroom.last.id
  end

  def index
    @chatrooms = Chatroom.all
    @chat_participants = ChatParticipant.all
    @chatroom = Chatroom.new
    @friendships = current_user.all_friendships
    @friends = @friendships.map { |fs| fs.sender == current_user ? fs.recipient.id : fs.sender.id }
    if @chatrooms.length > 0
      @chatroom_for_new_chat_participants = Chatroom.last.id
    else
      @chatroom_for_new_chat_participants = Chatroom.new(user_id: current_user.id, name: 'default').save!
    end
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

  def destroy
    @chatroom = Chatroom.find(params[:id])
    @chatroom.destroy
    redirect_to chatrooms_path
  end

  private

end
