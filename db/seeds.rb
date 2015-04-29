# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
require 'faker'
  # Create Users
   5.times do
   user = User.new(
     name:     Faker::Name.name,
     email:    Faker::Internet.email,
     password: Faker::Lorem.characters(10)
   )
   user.skip_confirmation!
   user.save!
 end
 users = User.all
 # Create Wikis
   10.times do
   Wiki.create!(
     name:  Faker::Lorem.sentence,
     description:   Faker::Lorem.paragraph,
     user:   users.sample
   )
 end
 wikis = Wiki.all
 
user = User.new(name:'Mr. Standard', email:'standard@example.com', password:'helloworld', role:'standard')
  user.skip_confirmation!
  user.save!
 
user = User.new(name:'Mr. Premium', email:'premium@example.com', password:'helloworld', role:'premium')
  user.skip_confirmation!
  user.save!
 
 puts "Seed finished"
 puts "#{User.count} users created"
 puts "#{Wiki.count} wikis created"
