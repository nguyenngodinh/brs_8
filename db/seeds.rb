# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# Users
User.create!(name:  "Example User",
             email: "example@railstutorial.org",
             password:              "foobar",
             password_confirmation: "foobar")

User.create!(name:  "Đặng Minh Dũng",
             email: "dungdm93@example.com",
             password:              "qwerty",
             password_confirmation: "qwerty")

# Below user is unactivated
# It's used for test
User.create!(name:  "abc xyz",
             email: "abcxyz@gmail.com",
             password:              "123456",
             password_confirmation: "123456")

18.times do
  name     = Faker::Name.name
  email    = Faker::Internet.email
  password = "password"
  User.create!(name:  name,
               email: email,
               password:              password,
               password_confirmation: password)
end
