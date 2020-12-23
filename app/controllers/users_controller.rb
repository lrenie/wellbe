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

  def update_cover
    @user = current_user
    @user.cover = params[:cover]
    @user.save
  end

  def update_avatar
    @user = current_user
    @user.avatar = params[:avatar]
    @user.save
    render json: { urlImg: Cloudinary::Utils.cloudinary_url(@user.avatar.key)}
    # pour plus de renseignement voir la recherche
    # "How generate a cloudinary URL from the rails controller"
  end
end
# on aurait pu mettre la ligne suivante pour transmettre l'url de l'cl_image_path
# urlIMG: view_context.cl_image_path(@user.avatar.key)}
# mais c'était surtout emplyé à Rails3
