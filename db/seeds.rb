require 'random_data'

 # Create Wikis
 25.times do
   Wiki.create!(
     title:  RandomData.random_sentence,
     body:   RandomData.random_paragraph,
     private: false
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
 #puts "#{Comment.count} comments created"
