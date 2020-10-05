class FriendshipsController < ApplicationController
  def create
    @friendship = Friendship.new(params[:friendship])
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

  private

  def friendship_params
    params.require(:friendship).permit(:sender_id, :recipient_id)
  end
end
