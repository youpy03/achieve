# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

 10.times do |n|
  email = Faker::Internet.email
  name = Faker::Name.name
  password = "password"
  User.create!(email: email,
               password: password,
               password_confirmation: password,
               name: name,
               )
 end


10.times do |n|
	rand_id = 1
	until User.find_by_id(rand_id) != nil do
		rand_id = rand(1..2000)
	end	
	title = "heroku#{n+1}"
	content = "ないよう#{n+1}"
	Blog.create!(title: title, content: content, user_id: rand_id)	
end

# num = 1

# while num <= 100
#   Blog.create(
#     title: "herokuheroku",
#     user_id: num
#   )
#   num = num + 1
# end
