require 'rubygems'
require 'faker'

 # Create Users
 5.times do
   User.create!(
     username: Faker::Internet.user_name,
     email: Faker::Internet.safe_email,
     password: Faker::Lorem.characters(7),
     confirmed_at: "2017-10-07 16:38:08"
   )
 end

 users = User.all

 # Create Wikis
 25.times do
   Wiki.create!(
     title:  Faker::Lorem.sentence(5),
     body:   Faker::Lorem.paragraph(3),
     private: false,
     user: users.sample
   )
 end


 #wikis = Wiki.all

 # Create Comments
 #100.times do
   #Comment.create!(
 # #4
     #post: posts.sample,
     #body: RandomData.random_paragraph
   #)
 #end

 puts "Seed finished"
 puts "#{Wiki.count} wikis created"
 puts "#{User.count} users created"
 #puts "#{Comment.count} comments created"
