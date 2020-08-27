# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require "open-uri"

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
