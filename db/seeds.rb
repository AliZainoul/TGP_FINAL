require 'faker'

User.destroy_all
Gossip.destroy_all
City.destroy_all
Tag.destroy_all
JoinTableGossipTag.destroy_all
Comment.destroy_all
#Like.destroy_all
#PrivateMessage.destroy_all



#Generate a bunch of cities
city1 = City.create(city_name: 'Montpellier', zip_code: "34000")
city2 = City.create(city_name: 'Angers', zip_code: "49000")
city3 = City.create(city_name: 'Paris', zip_code: "75000")
city4 = City.create(city_name: 'Noirmoutier', zip_code: "85330")
puts "4 cities generated"
city = [city1, city2, city3, city4].sample
User.create(first_name: 'Anonymous', last_name: 'Anonymous', age: 99, email: 'Anonymous@Anonymous.com', description: 'Hello, find me. :)', city_id: city.id, password: 'anonymous')
puts "Anonymous user created"

k = 10
k.times do
  #Generate k users
  city = [city1, city2, city3, city4].sample
  user = User.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, description: Faker::Lorem.sentence(word_count: 10, supplemental: true), email: Faker::Internet.email, age: rand(18..80), city_id: city.id,  password: 'seeds')
  #Create 2 gossips
  gossip1 = Gossip.create(title: Faker::Game.title, content: Faker::ChuckNorris.fact )
  gossip2 = Gossip.create(title: Faker::Game.title, content: Faker::ChuckNorris.fact )
  #Assign 2 gossips to 1 user
  user.gossips << gossip1
  user.gossips << gossip2
  #Create tags
  tag = Tag.create(title: "##{Faker::Verb.base}")
  tag.save
  #Assign tags to user
  gossip1.tags << tag
  gossip2.tags << tag
  #Create comments
  comment1 = Comment.new(gossip_id: gossip1.id, content: Faker::Lorem.sentence(word_count: 10, supplemental: true))
  comment2 = Comment.new(gossip_id: gossip2.id, content: Faker::Lorem.sentence(word_count: 10, supplemental: true))
  #Assign comments to user
  user.comments << comment1
  user.comments << comment2

  #Like randomly comment1 or comment2
  #if rand(0..1) == 0
  #  like1 = Like.create(user_id: user.id, gossip_id: gossip1.id) #like gossip
  #else
  #  like1 = Like.create(user_id: user.id, comment_id: comment1.id) #like comment
  #end
  #like randomly gossip1 or gossip2
  #if rand(0..1) == 0
  #  like1 = Like.create(user_id: user.id, gossip_id: gossip2.id) #like gossip
  #else
  #  like1 = Like.create(user_id: user.id, comment_id: comment2.id) #like comment
  #end
  
  user.save

  #create private message from current user to previous user
  #PrivateMessage.create(recipient_id: user.id - 1, sender_id: user.id, content: Faker::Lorem.sentence(word_count: 20, supplemental: true ))
end

puts "10 users generated"
puts "10 cities generated"
puts "20 gossips generated"
puts "10 tags generated"
#puts "10 private messages generated"
puts "20 comments generated"
#puts "20 random likes generated"
puts "All values have been generated!"
