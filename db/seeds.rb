# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create!(username: "tartan",
			 email: "tartan@cmu.edu",
			 password: "foobar",
			 password_confirmation: "foobar",
			 admin: true)

99.times do |n|
	username = Faker::Username.username
	email = "example-#{n+1}@cmu.edu"
	password = "password"
	User.create!(username: username,
				 email: email,
				 password: password,
				 password_confirmation: password)