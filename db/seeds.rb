# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts "Cleaning exercises..."
Exercise.destroy_all
puts "Cleaning body areas..."
BodyArea.destroy_all
puts "Cleaning session participants..."
SessionParticipant.destroy_all
puts "Cleaning session exercises"
SessionExercise.destroy_all
puts "Cleaning sessions..."
Session.destroy_all
puts "Cleaning users..."
User.destroy_all


puts "Creating body areas..."
BodyArea1 = { name: "haut du corps"}
BodyArea2 = { name: "bas du corps"}
BodyArea3 = { name: "général"}
bodyareas = []
[BodyArea1, BodyArea2, BodyArea3].each_with_index do |attributes, index|
    current_bodyarea = BodyArea.create!(attributes)
    bodyareas << current_bodyarea
end
puts "Created #{BodyArea.count} BodyAreas"

puts "Creating exercices..."
Exercise1 = { name: "exercise1", time: 3, diff_coef: 8, kcal: 250, body_area: bodyareas[0]}
Exercise2 = { name: "exercise2", time: 4, diff_coef: 5, kcal: 450, body_area: bodyareas[1]}
exercises = []
[Exercise1, Exercise2].each_with_index do |attributes, index|
    current_exercise = Exercise.create!(attributes)
    exercises << current_exercise
end
puts "Created #{Exercise.count} Exercises"

puts "Creating users..."
User1 = { email: "cheewy@gmail.com", password: "123456", first_name: "Cheewy", last_name: "Solo" }
User2 = { email: "loulou@gmail.com", password: "123456", first_name: "Loulou", last_name: "Leaddev" }
users = []
[User1, User2].each_with_index do |attributes, index|
 current_user = User.create!(attributes)
 users << current_user
end
puts "Created #{User.count} users"

puts "Creating sessions..."
Session1 = { difficulty: "débutant", mode: "solo", video: "false", total_time: 15, date: "2020-08-20 17:00:00", user: users[0] }
Session2 = { difficulty: "avancé", mode: "multi", video: "true", total_time: 20, date: "2020-08-20 17:00:00", user: users[1] }
Session3 = { difficulty: "intermédiaire", mode: "multi", video: "true", total_time: 20, date: "2020-08-20 17:00:00", user: users[0] }
Session4 = { difficulty: "débutant", mode: "multi", video: "true", total_time: 20, date: "2020-08-20 17:00:00", user: users[0] }
Session5 = { difficulty: "avancé", mode: "multi", video: "true", total_time: 20, date: "2020-08-20 17:00:00", user: users[0] }
sessions = []
[Session1, Session2, Session3, Session4, Session5].each_with_index do |attributes, index|
 current_session = Session.create!(attributes)
 sessions << current_session
end
puts "Created #{Session.count} Sessions" 

puts "Creating session participants..."
Session_participant1 = { user: users[0], session: sessions[0], favorite_status: true }
Session_participant2 = { user: users[1], session: sessions[1], favorite_status: false }
Session_participant3 = { user: users[0], session: sessions[2], favorite_status: true }
Session_participant4 = { user: users[0], session: sessions[3], favorite_status: false }
Session_participant5 = { user: users[0], session: sessions[3], favorite_status: false}
session_participants = []
[Session_participant1, Session_participant2, Session_participant3, Session_participant4, Session_participant5].each_with_index do |attributes, index|
    current_session_participant = SessionParticipant.create!(attributes)
    session_participants << current_session_participant
end
puts "Created #{SessionParticipant.count} Session Participants" 

puts "Creating session exercises"
sessionexercise1 = SessionExercise.new
sessionexercise1.exercise = exercises[0]
sessionexercise1.session = sessions[0]
sessionexercise1.save!

sessionexercise2 = SessionExercise.new
sessionexercise2.exercise = exercises[1]
sessionexercise2.session = sessions[1]
sessionexercise2.save!




# SessionExercise.create!(exercise: exercises[0], session: sessions[0])
# SessionExercise.create!(exercise: exercises[1], session: sessions[1])
# Session_exercise1 = { exercise: exercises[0], session: sessions[0]}
# Session_exercise2 = { exercise: exercises[1], session: sessions[1]}
# session_exercises = []
# [Session_exercise1, Session_exercise2].each_with_index do |attributes, index|
#     current_session_exercise = SessionExercise.create!(attributes)
#     session_exercises << current_session_exercise
# end
puts "Created #{SessionExercise.count} Session Exercise" 







# puts "Cleaning warmups..."
# WarmUp.destroy_all
# puts "Creating warmups..."
# WarmUp1 = { name: "exercise1", time: 3, kcal: 35, body_area: bodyareas[0] }
# WarmUp2 = { name: "exercise2", time: 5, kcal: 45, body_area: bodyareas[1] }
# warmups = []
# [WarmUp1, WarmUp2].each_with_index do |attributes, index|
#  current_warmup = WarmUp.create!(attributes)
#  warmups << current_warmup
# end
# puts "Created #{WarmUp.count} WarmUps"

# puts "Cleaning stretches..."
# Strech.destroy_all
# puts "Creating stretches..."
# Stretch1 = { name: "étirement1", time: 3, kcal: 10, body_area: bodyareas[0]}
# Stretch2 = { name: "étirement2", time: 2, kcal: 15, body_area: bodyareas[1]}
# stretches = []
# [Stretch1, Stretch2].each_with_index do |attributes, index|
#  current_stretch = Strech.create!(attributes)
#  stretches << current_stretch
# end
# puts "Created #{Strech.count} Streches"










