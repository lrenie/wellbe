# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require "open-uri"

puts "Cleaning exercises..."
Exercise.destroy_all
puts "Cleaning session participants..."
SessionParticipant.destroy_all
puts "Cleaning session exercises"
SessionExercise.destroy_all
puts "Cleaning sessions..."
Session.destroy_all
puts "Cleaning body areas..."
BodyArea.destroy_all
puts "Cleaning users..."
User.destroy_all


# cover = URI.open('https://images.unsplash.com/photo-1439853949127-fa647821eba0?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60')
# avatar = URI.open('https://images.unsplash.com/photo-1518020382113-a7e8fc38eac9?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60')
# user = User.new
# user.first_name = "bob"
# user.last_name = "johnny"
# user.email = "bob.j@hotmail.fr"
# user.password = "123456"
# user.cover.attach(io: cover, filename: 'cover.jpg', content_type: 'image/jpg')
# user.avatar.attach(io: avatar, filename: 'avatar.jpg', content_type: 'image/jpg')
# user.save!

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
User1 = { email: "cheewy@gmail.com", password: "123456", first_name: "Eugenie", last_name: "Solo" }
User2 = { email: "loulou@gmail.com", password: "123456", first_name: "Loulou", last_name: "Leaddev" }
User3 = { email: "corentin@gmail.com", password: "123456", first_name: "corentin", last_name: "leLeaddev" }

users = []


photos = [
"http://fr.web.img3.acsta.net/r_640_360/newsv7/19/12/19/18/02/0758868.jpg",
"https://assets.cineserie.com/wp-content/uploads/2016/08/Khal-Drogo.jpg",
"https://scontent-cdt1-1.xx.fbcdn.net/v/t1.0-9/309300_4214215714271_321428949_n.jpg?_nc_cat=110&_nc_sid=09cbfe&_nc_ohc=h0b30A6Z54cAX-RH_5-&_nc_ht=scontent-cdt1-1.xx&oh=9a0ca2a053666f4061ebddc30d379356&oe=5F7001FD"
]
covers = [
  "https://cdn.pixabay.com/photo/2017/12/26/07/36/nature-3039901_960_720.jpg",
  "https://www.photo-paysage.com/blog/wp-content/uploads/2018/02/cropped-rpin-bord-de-falaise-cap-canaille.jpg",
  "https://www.noizikidz.com/17984-large_nzk3/batterie-enfant-3-futs-12-rouge.jpg"
]

[User1, User2, User3].each_with_index do |attributes, index|
 current_user = User.create!(attributes)
 file_avatar = URI.open(photos[index])
 file_cover = URI.open(covers[index])
 current_user.avatar.attach(io: file_avatar, filename: 'image.png', content_type: 'image/png')
 current_user.cover.attach(io: file_cover, filename: 'image.png', content_type: 'image/png')
 users << current_user
end
puts "Created #{User.count} users"

puts "Creating sessions..."
Session1 = { difficulty: "débutant", mode: "solo", video: "false", total_time: 15, date: "2020-08-20 17:00:00", user: users[2], body_area: bodyareas[0] }
Session2 = { difficulty: "avancé", mode: "multi", video: "true", total_time: 1200, date: "2020-08-20 17:00:00", user: users[1], body_area: bodyareas[1] }
Session3 = { difficulty: "intermédiaire", mode: "multi", video: "true", total_time: 20, date: "2020-08-20 17:00:00", user: users[2], body_area: bodyareas[0] }
Session4 = { difficulty: "débutant", mode: "multi", video: "true", total_time: 20, date: "2020-08-20 17:00:00", user: users[2], body_area: bodyareas[1] }
Session5 = { difficulty: "avancé", mode: "multi", video: "true", total_time: 20, date: "2020-08-20 17:00:00", user: users[0], body_area: bodyareas[0] }
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
User.all.each do |user|
  5.times do
    stat = Stat.new
    stat.user = user
    stat.time = rand(15..60)
    stat.kcal = rand(150..600)
    stat.save!
  end
end










