 # This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require "open-uri"
require "faker"

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
puts "Cleaning friendships..."
Friendship.destroy_all
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
Incendie = { name: "Incendie", time: 20, diff_coef: 8, kcal: 250, body_area: bodyareas[2]}
Ciseau = { name: "Ciseau", time: 20, diff_coef: 5, kcal: 450, body_area: bodyareas[2]}
Planche = { name: "Planche", time: 20, diff_coef: 2, kcal: 150, body_area: bodyareas[2]}
Araignee = { name: "Araignée", time: 20, diff_coef: 2, kcal: 150, body_area: bodyareas[0]}
exercises = []
photos = [
  "https://cache.cosmopolitan.fr/data/fichiers/4i/1416945451-hydrantsfix2.gif",
  "https://cache.cosmopolitan.fr/data/fichiers/4i/1416944853-scissorlegsfix2.gif",
  "https://cache.cosmopolitan.fr/data/fichiers/4i/1416945187-planktoforearmfix2.gif",
  "https://cache.cosmopolitan.fr/data/fichiers/4i/1416945948-alternatingkneefix21.gif"
]
[Incendie, Ciseau, Planche, Araignee].each_with_index do |attributes, index|
    current_exercise = Exercise.create!(attributes)
    p exercise_photo = URI.open(photos[index])
    current_exercise.photo.attach(io: exercise_photo, filename: 'image.png', content_type: 'image/png')
    exercises << current_exercise
end
puts "Created #{Exercise.count} Exercises"

puts "Creating users..."
User1 = { email: "stephanie@gmail.com", password: "123456", first_name: "Stephanie", last_name: "Solo" }
User2 = { email: "loulou@gmail.com", password: "123456", first_name: "Loulou", last_name: "Leaddev" }
User3 = { email: "corentin@gmail.com", password: "123456", first_name: "Corentin", last_name: "leLeaddev" }
User4 = { email: "benou@gmail.com", password: "123456", first_name: "Benoit", last_name: "Graziani" }
User5 = { email: "eugenie@gmail.com", password: "123456", first_name: "Eugenie", last_name: "Johan" }
User6 = { email: "lomig@gmail.com", password: "123456", first_name: "Lomig", last_name: "TheBestTeacher" }

users = []


photos = [
"https://res.cloudinary.com/dax8lsbkx/image/upload/v1599209388/c8nl3gpfrpqhyyxspx0yj9nzyr1n.jpg",
"https://res.cloudinary.com/dax8lsbkx/image/upload/v1599211135/louis_ro7uoa.jpg",
"https://www.fredporez.com/wp-content/uploads/portfolio/2017/portrait-matt-nash.jpg",
"https://res.cloudinary.com/dax8lsbkx/image/upload/v1599211528/IMG-20200822-WA0016_ynhhxl.jpg",
"https://fr.web.img2.acsta.net/pictures/19/03/14/11/10/0992674.jpg",
"https://pbs.twimg.com/profile_images/1144264532812079106/92QOzKKG_400x400.jpg"
]
covers = [
  "https://cdn.pixabay.com/photo/2017/12/26/07/36/nature-3039901_960_720.jpg",
  "https://res.cloudinary.com/drk3m3rkb/image/upload/v1599150021/Louis_renie_osia6f.jpg",
  "https://www.noizikidz.com/17984-large_nzk3/batterie-enfant-3-futs-12-rouge.jpg",
  "https://www.altituderando.com/local/cache-vignettes/L1024xH575/randoon4932-a898c.jpg",
  "https://geeko.lesoir.be/wp-content/uploads/sites/58/2020/02/wc3-reforged-1280x720.jpg",
  "https://geeko.lesoir.be/wp-content/uploads/sites/58/2020/02/wc3-reforged-1280x720.jpg"
]


[User1, User2, User3, User4, User5, User6].each_with_index do |attributes, index|
 p current_user = User.create!(attributes)
 p file_avatar = URI.open(photos[index])
 p file_cover = URI.open(covers[index])
 p current_user.avatar.attach(io: file_avatar, filename: 'image.jpg', content_type: 'image/jpg')
 # puts"#{current_user} "
 current_user.cover.attach(io: file_cover, filename: 'image.jpg', content_type: 'image/jpg')
 users << current_user
end


pictures = [
  "https://i.pinimg.com/236x/6e/ae/6b/6eae6bdc37b5ed5701aca9d38d71c825--freckles-islamic-fashion.jpg",
  "https://i.pinimg.com/736x/ef/9d/80/ef9d800e07a159dec21bd4bdf45d9a6d.jpg",
  "https://www.joancanto.com/wp-content/uploads/2017/04/H10B1582-Edit.jpg",
  "https://www.joancanto.com/wp-content/uploads/2017/04/H10B0527.jpg",
  "https://www4.pictures.zimbio.com/gi/39th+Annual+People+Choice+Awards+Portraits+lza8vaU_QsZx.jpg"
]
5.times do
  i = 0
  fake_user = User.new
  fake_user.email = Faker::Internet.email
  fake_user.password = "123456"
  fake_user.first_name = Faker::Name.first_name
  fake_user.last_name = Faker::Name.last_name
  file_avatar = URI.open(pictures[0])
  file_cover = URI.open("https://source.unsplash.com/800x200/?landscape")
  fake_user.avatar.attach(io: file_avatar, filename: 'image.jpg', content_type: 'image/jpg')
  fake_user.cover.attach(io: file_cover, filename: 'image.jpg', content_type: 'image/jpg')
  fake_user.save
  puts "#{fake_user.first_name} created"
  puts "#{User.count}"
  i += 1
end

puts "Created #{User.count} users"

puts "Creating friendship ..."

friendship2 = Friendship.new
friendship2.status = "true"
friendship2.sender = users[0]
friendship2.recipient = users[1]
friendship2.save!
puts "friendship2 ok"

friendship2 = Friendship.new
friendship2.status = "true"
friendship2.sender = users[0]
friendship2.recipient = users[2]
friendship2.save!

friendship5 = Friendship.new
friendship5.status = "true"
friendship5.sender = users[0]
friendship5.recipient = users[3]
friendship5.save!

friendship6 = Friendship.new
friendship6.status = "true"
friendship6.sender = users[0]
friendship6.recipient = users[4]
friendship6.save!



friendship3 = Friendship.new
friendship3.status = "true"
friendship3.sender = users[1]
friendship3.recipient = User.find_by(first_name: "Corentin")
friendship3.save!

friendship4 = Friendship.new
friendship4.status = "true"
friendship4.sender = users[1]
friendship4.recipient = User.find_by(first_name: "Benoit")
friendship4.save!

friendship5 = Friendship.new
friendship5.status = "pending"
friendship5.sender = users[2]
friendship5.recipient = User.find_by(first_name: "Eugenie")
friendship5.save!


# User.all.each do |user|
#   4.times do
#     friendship = Friendship.new
#     friendship.status = "true"
#     friendship.sender = user
#     friendship.recipient = User.all.sample
#     friendship.save if (friendship.sender != friendship.recipient)
#   end
# end



puts "Creating sessions..."
Session1 = { difficulty: "débutant", mode: "solo", video: "false", total_time: 15, date: "2020-08-21 17:00:00", user: users[0], body_area: bodyareas[0] }
Session2 = { difficulty: "avancé", mode: "multi", video: "true", total_time: 120, date: "2020-08-30 17:00:00", user: users[0], body_area: bodyareas[1] }
Session3 = { difficulty: "intermédiaire", mode: "multi", video: "true", total_time: 20, date: "2020-08-15 17:00:00", user: users[0], body_area: bodyareas[0] }
Session4 = { difficulty: "débutant", mode: "multi", video: "true", total_time: 20, date: "2020-09-20 17:00:00", user: users[0], body_area: bodyareas[1] }
Session5 = { difficulty: "avancé", mode: "multi", video: "true", total_time: 20, date: "2020-09-08 17:00:00", user: users[0], body_area: bodyareas[0] }
Session7 = { difficulty: "débutant", mode: "solo", video: "false", total_time: 12, date: "2020-08-03 19:30:00", user: users[1], body_area: bodyareas[2] }
Session8 = { difficulty: "confirmé", mode: "multi", video: "true", total_time: 5, date: "2020-07-18 19:30:00", user: users[1], body_area: bodyareas[2] }
Session9 = { difficulty: "intermédiaire", mode: "solo", video: "false", total_time: 36, date: "2020-08-30 19:30:00", user: users[1], body_area: bodyareas[1] }
Session10 = { difficulty: "avancé", mode: "multi", video: "true", total_time: 40, date: "2020-09-02 19:30:00", user: users[1], body_area: bodyareas[0] }
Session6 = { difficulty: "intermédiaire", mode: "multi", video: "true", total_time: 25, date: "2020-07-15 19:30:00", user: users[1], body_area: bodyareas[2] }

sessions = []
[Session1, Session2, Session3, Session4, Session5, Session7, Session8, Session9, Session10, Session6].each_with_index do |attributes, index|
 current_session = Session.create!(attributes)
 sessions << current_session
end
puts "Created #{Session.count} Sessions"

puts "Creating session participants..."
Session_participant1 = { user: users[0], session: sessions[0], favorite_status: true }
Session_participant2 = { user: users[1], session: sessions[0], favorite_status: false }
Session_participant3 = { user: users[0], session: sessions[1], favorite_status: true }
Session_participant4 = { user: users[1], session: sessions[1], favorite_status: false }
Session_participant5 = { user: users[0], session: sessions[2], favorite_status: false}
Session_participant6 = { user: users[1], session: sessions[5], favorite_status: false}
Session_participant7 = { user: users[1], session: sessions[6], favorite_status: false}
Session_participant8 = { user: users[1], session: sessions[7], favorite_status: false}
Session_participant9 = { user: users[1], session: sessions[8], favorite_status: false}
Session_participant10 = { user: users[1], session: sessions[9], favorite_status: false}
session_participants = []
[Session_participant1, Session_participant2, Session_participant3, Session_participant4, Session_participant5, Session_participant6, Session_participant7, Session_participant8, Session_participant9, Session_participant10 ,Session_participant5].each_with_index do |attributes, index|
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
sessionexercise2.session = sessions[0]
sessionexercise2.save!

exo1_de_session_demo = SessionExercise.new
exo1_de_session_demo.session = sessions[-1]
exo1_de_session_demo.exercise = exercises[2]
exo1_de_session_demo.save!

exo2_de_session_demo = SessionExercise.new
exo2_de_session_demo.session = sessions[-1]
exo2_de_session_demo.exercise = exercises[3]
exo2_de_session_demo.save!


# SessionExercise.create!(exercise: exercises[0], session: sessions[0])
# SessionExercise.create!(exercise: exercises[1], session: sessions[1])

# Session_exercise1 = { exercise: exercises[0], session: sessions[0]}
# Session_exercise2 = { exercise: exercises[1], session: sessions[0]}
# Session_exercise3 = { exercise: exercises[2], session: sessions[5]}
# Session_exercise4 = { exercise: exercises[3], session: sessions[5]}

# session_exercises = []
# [Session_exercise1, Session_exercise2, Session_exercise3, Session_exercise4].each_with_index do |attributes, index|
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










