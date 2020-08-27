# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


require "open-uri"



puts "Cleaning users..."
User.destroy_all
puts "Creating users..."
User1 = { email: "cheewy@gmail.com", password: "123456", first_name: "Cheewy", last_name: "Solo" }
User2 = { email: "loulou@gmail.com", password: "123456", first_name: "Loulou", last_name: "Leaddev" }
users = []
[User1, User2].each_with_index do |attributes, index|
 current_user = User.create!(attributes)
 users << current_user
end
puts "Created #{User.count} users"

  
cover = URI.open('https://images.unsplash.com/photo-1439853949127-fa647821eba0?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60')
avatar = URI.open('https://images.unsplash.com/photo-1518020382113-a7e8fc38eac9?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60')
user = User.new
user.first_name = "bob"
user.last_name = "johnny"
user.email = "bob.j@hotmail.fr"
user.password = "123456"
user.cover.attach(io: cover, filename: 'cover.jpg', content_type: 'image/jpg')
user.avatar.attach(io: avatar, filename: 'avatar.jpg', content_type: 'image/jpg')
user.save!

puts "Cleaning body areas..."
BodyArea.destroy_all
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



puts "Cleaning exercises..."
Exercise.destroy_all
puts "Creating exercices..."
Exercise1 = { name: "exercise1", time: 3, diff_coef: 8, kcal: 250, body_area: bodyareas[0]}
Exercise2 = { name: "exercise2", time: 4, diff_coef: 5, kcal: 450, body_area: bodyareas[1]}
exercises = []
[Exercise1, Exercise2].each_with_index do |attributes, index|
 current_exercise = Exercise.create!(attributes)
 exercises << current_exercise
end
puts "Created #{Exercise.count} Exercises"

puts "Cleaning warmups..."
WarmUp.destroy_all
puts "Creating warmups..."
WarmUp1 = { name: "exercise1", time: 3, kcal: 35, body_area: bodyareas[0] }
WarmUp2 = { name: "exercise2", time: 5, kcal: 45, body_area: bodyareas[1] }
warmups = []
[WarmUp1, WarmUp2].each_with_index do |attributes, index|
 current_warmup = WarmUp.create!(attributes)
 warmups << current_warmup
end
puts "Created #{WarmUp.count} WarmUps"

puts "Cleaning stretches..."
Strech.destroy_all
puts "Creating stretches..."
Stretch1 = { name: "étirement1", time: 3, kcal: 10, body_area: bodyareas[0]}
Stretch2 = { name: "étirement2", time: 2, kcal: 15, body_area: bodyareas[1]}
stretches = []
[Stretch1, Stretch2].each_with_index do |attributes, index|
 current_stretch = Strech.create!(attributes)
 stretches << current_stretch
end
puts "Created #{Strech.count} Streches"

puts "Cleaning sessions..."
Session.destroy_all
puts "Creating sessions..."
Session1 = { difficulty: "débutant", mode: "solo", video: "false", total_time: 15, date: "2020-08-20 17:00:00", user: users[0], warm_up: warmups[0], exercise: exercises[0], strech: stretches[0] }
Session2 = { difficulty: "avancé", mode: "multi", video: "true", total_time: 20, date: "2020-08-20 17:00:00", user: users[1], warm_up: warmups[1], exercise: exercises[1], strech: stretches[1] }
Session3 = { difficulty: "intermédiaire", mode: "multi", video: "true", total_time: 20, date: "2020-08-20 17:00:00", user: users[0], warm_up: warmups[0], exercise: exercises[1], strech: stretches[1] }
Session4 = { difficulty: "débutant", mode: "multi", video: "true", total_time: 20, date: "2020-08-20 17:00:00", user: users[0], warm_up: warmups[1], exercise: exercises[0], strech: stretches[0] }
Session5 = { difficulty: "avancé", mode: "multi", video: "true", total_time: 20, date: "2020-08-20 17:00:00", user: users[0], warm_up: warmups[1], exercise: exercises[0], strech: stretches[0] }
sessions = []
[Session1, Session2, Session3, Session4, Session5].each_with_index do |attributes, index|
 current_session = Session.create!(attributes)
 sessions << current_session
end
puts "Created #{Session.count} Sessions" 

puts "Cleaning session participants..."
SessionParticipant.destroy_all
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








