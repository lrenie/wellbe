class SessionsController < ApplicationController
  def choice
    @last_sessions = current_user.sessions.order(date: :desc)
    @last_sessions = @last_sessions.where.not(body_area_id: nil)
    @fav_session_participants = current_user.session_participants.where(favorite_status: true)
    @fav_sessions = []
    @fav_session_participants.each do |fav|
      @fav_sessions << Session.find(fav.session_id)
    end
  end

  def new
    # @session = Session.new
    # # @session.video = "true"
    # @session.date = Date.today
    # @session.user = current_user
    # @session.save!
    # if @session.save!
    #  redirect_to edit_session_path(@session)
    # else
    #   alert("something goes wrong")
    # end



    # @fake_session = Session.new
    # @fake_session.difficulty = "intermédiaire"
    # @fake_session.mode = "multi"
    # @fake_session.video = "true"
    # @fake_session.total_time = 25
    # @fake_session.date = "2020-09-04 17:50:50"
    # @fake_session.user = User.find_by(first_name: "Loulou")
    # @fake_session.body_area_id = BodyArea.last.id
    # @fake_session.save!



    # @fake_session_participant1 = SessionParticipant.new
    # @fake_session_participant1.user = User.find_by(first_name: "Stephanie")
    # @fake_session_participant1.session = @fake_session
    # @fake_session_participant1.favorite_status = false
    # @fake_session_participant1.save!

    # @fake_session_participant2 = SessionParticipant.new
    # @fake_session_participant2.user = User.find_by(first_name: "Loulou")
    # @fake_session_participant2.session = @fake_session
    # @fake_session_participant2.favorite_status = false
    # @fake_session_participant2.save!

    # @fake_session_participant3 = SessionParticipant.new
    # @fake_session_participant3.user = User.find_by(first_name: "Corentin")
    # @fake_session_participant3.session = @fake_session
    # @fake_session_participant3.favorite_status = false
    # @fake_session_participant3.save!

    # @fake_session_participant4 = SessionParticipant.new
    # @fake_session_participant4.user = User.find_by(first_name: "Benoit")
    # @fake_session_participant4.session = @fake_session
    # @fake_session_participant4.favorite_status = false
    # @fake_session_participant4.save!

    # # @fake_session.session_participant_ids = [User.where(first_name: "Eugenie").ids, User.where(first_name: "Loulou").ids, User.where(first_name: "Corentin").ids, User.where(first_name: "Benoit").ids].flatten

    # @default_session_exercise1 = SessionExercise.new
    # @default_session_exercise1.session = Session.last
    # @default_session_exercise1.exercise = Exercise.second
    # @default_session_exercise1.save!
    # @default_session_exercise2 = SessionExercise.new
    # @default_session_exercise2.session = Session.last
    # @default_session_exercise2.exercise = Exercise.last
    # @default_session_exercise2.save!
  end

  def create
    @session = Session.new
    @session.video = "true"
    @session.mode = params[:mode]
    @session.date = Date.today
    @session.user = current_user
    @session.save!

    if @session.save!
     redirect_to edit_session_path(@session)
    else
      alert("something goes wrong")
    end
  end

  def edit
    @session = Session.find(params[:id])
    @session.user = current_user
    @friendships = current_user.all_friendships
    # @friends is a tab where we can found all the IDS of the friend of the current user (with its self-id)
    @friends = @friendships.map { |fs| fs.sender == current_user ? fs.recipient.id : fs.sender.id }
  end

  def update
    @session = Session.find(params[:id])
    @session.body_area.id = BodyArea.find_by(name: session_params["body_area"])
    @session.total_time = session_params["total_time"]
    @session.difficulty = session_params["difficulty"]
    @session.save!

    # @session_participant = SessionParticipant.new
    # @session_participant.session = @session
    # #@session_participant.user


    if @session.save!
     redirect_to my_session_path(@session)
    else
      alert("something goes wrong")
    end
  end

  def show

    @session = Session.find(params[:id])


    @times = []
    @names = []
    @images = []

    exercises = @session.exercises.all
    @names = exercises.flat_map { |exo| [exo.name, "Repos"] }.tap(&:pop)
    @times = exercises.flat_map { |exo| [exo.time, 10] }.tap(&:pop)
    @images = exercises.map.with_index { |exo, i| i == 0 ? @images << exo.photo.key : [exo.photo.key, exo.photo.key] }.flatten


    # @session.session_exercise_ids.each do |id|
    #     @names << Exercise.find(id).name
    #     if Exercise.find(id).id != @session.session_exercise_ids.last
    #       @names << "repos"
    #     end
    #     @times << Exercise.find(id).time
    #     if Exercise.find(id).id != @session.session_exercise_ids.last
    #       @times << 10
    #     end
    #   end
  end


  def fetch
    @user = User.find(params[:user])
    @date = Date.parse(params[:date])

    @last_sessions = @user.sessions.where(date: @date.beginning_of_day..@date.end_of_day)
    render json: { html: render_to_string(partial: 'shared/card_prev_session', locals: { sessions: @last_sessions })}
  end

  private

  def session_params
    params.require(:session).permit(:difficulty, :total_time, :body_area_id)
  end
end

