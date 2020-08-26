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
    end
  end
end
