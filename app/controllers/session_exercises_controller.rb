class SessionExercisesController < ApplicationController

    def create
        @session_exercise = SessionExercise.new
        @session_exercise.session_id = Session.find(params[:id])
        @session_exercise.exercise_id = Exercise.last
        @session_exercise.save!

        if @session_exercise.save 
            redirect_to edit_session_path
        else
            alert("something goes wrong")
        end 
        
    end
end
