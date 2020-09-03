class SessionsController < ApplicationController
  def choice
    @last_sessions = Session.where(user_id: current_user.id).order(date: :desc)
    @fav_session_participants = current_user.session_participants.where(favorite_status: true)
    @fav_sessions = []
    @fav_session_participants.each do |fav|
      @fav_sessions << Session.find(fav.session_id)
    end
  end

  def new
    @session = Session.new
    @friendships = current_user.all_friendships
    @friends = @friendships.map { |fs| fs.sender == current_user ? fs.recipient.id : fs.sender.id }

    @fake_session = Session.new
    @fake_session.difficulty = "intermédiaire"
    @fake_session.mode = "multi"
    @fake_session.video = "true"
    @fake_session.total_time = 25
    @fake_session.date = "2020-09-04 17:50:50"
    @fake_session.user = User.find_by(first_name: "Loulou")
    @fake_session.body_area_id = BodyArea.first.id
    @fake_session.save!

    @fake_session_participant1 = SessionParticipant.new
    @fake_session_participant1.user = User.find_by(first_name: "Eugenie")
    @fake_session_participant1.session = @fake_session

    @fake_session_participant2 = SessionParticipant.new
    @fake_session_participant2.user = User.find_by(first_name: "Loulou")
    @fake_session_participant2.session = @fake_session

    @fake_session_participant3 = SessionParticipant.new
    @fake_session_participant3.user = User.find_by(first_name: "Corentin")
    @fake_session_participant3.session = @fake_session

    @fake_session_participant4 = SessionParticipant.new
    @fake_session_participant4.user = User.find_by(first_name: "Benoit")
    @fake_session_participant4.session = @fake_session

    # @fake_session.session_participant_ids = [User.where(first_name: "Eugenie").ids, User.where(first_name: "Loulou").ids, User.where(first_name: "Corentin").ids, User.where(first_name: "Benoit").ids].flatten

    @default_session_exercise1 = SessionExercise.new
    @default_session_exercise1.session = Session.last
    @default_session_exercise1.exercise = Exercise.second
    @default_session_exercise1.save!
    @default_session_exercise2 = SessionExercise.new
    @default_session_exercise2.session = Session.last
    @default_session_exercise2.exercise = Exercise.last
    @default_session_exercise2.save!

  end

  def create
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
end

# private

# # def fav?
#   @session = session.favorite_status
# # end
