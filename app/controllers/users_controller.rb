class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    if @user == current_user
      @time = 0
      @kcal = 0
      @user.stats.each do |stat|
        @time = @time + stat.time
        @kcal = @kcal + stat.kcal
      end
      @sessions_count = @user.sessions.count
    end
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
  end
end
