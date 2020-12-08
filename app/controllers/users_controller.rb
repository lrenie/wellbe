class UsersController < ApplicationController
  def show

    @user = User.find(params[:id])
    @param = params[:param]
    # voir ds session_participants_controller

    if @user == current_user
      @time = 0
      @kcal = 0
      @user.stats.each do |stat|
        @time = @time + stat.time
        @kcal = @kcal + stat.kcal
      end
      @sessions_count = @user.sessions.count
    end

    session_participants = SessionParticipant.where(user: current_user, favorite_status: true)
    @sessions = session_participants.map {|s| s.session}
    @session = Session.new
    @sessions_dates = @user.sessions
                           .map { |session| session.date }
                           .uniq

    @friendships = current_user.all_friendships
    @friends = @friendships.map { |fs| fs.sender == current_user ? fs.recipient.id : fs.sender.id }
    @friend_requests = Friendship.where(recipient_id: current_user.id).where(status: "pending")
  end

  def index

    if params[:requete].present?
      sql_requete = " \
      users.first_name @@ :requete \
      OR users.last_name @@ :requete \
      "
      @users = User.where(sql_requete, requete: "%#{params[:requete]}%")
    else
      @users = User.all
    end
    @self_fdships = current_user.friendships.map(&:id) + current_user.recieved_friendships.map(&:id)

    @users = User.all
    User.all.each do |user|
      @user_fdships = user.friendships.map(&:id) + user.recieved_friendships.map(&:id)
    end

  end
end
