class FriendshipsController < ApplicationController
  def create
    @friendship = Friendship.new
    @friendship.status = "pending"
    @friendship.recipient_id = params[:recipient_id]
    @friendship.sender_id = params[:sender_id]
    @friendship.save
    if @friendship.save
      respond_to do |format|
        format.js
      end

    else
      redirect_to "/#"
    end
  end

  def update
    @friendship = Friendship.find(params[:id])
    @friendship.status = "true"
    @friendship.save
    redirect_to user_path(current_user.id)

  end

  def destroy
    @friendship = Friendship.find(params[:id])
    @friendship.destroy
    redirect_to user_path(current_user.id)
  end

  private

  def friendship_params
    params.require(:friendship).permit(:sender_id, :recipient_id, :status)
  end
end
