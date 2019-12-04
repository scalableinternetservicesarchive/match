# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'
require "csv"
CSV.open("users.csv", "wb") do |csv|
csv << ["usernames"]
#Add the interests we support
supported_interests = ["Basketball", "Football", "Tennis", "Table Tennis", "Rugby", "Water Polo", "Polo", "Foosball", "Golf", "Pool", "Spikeball", "Chess", "Squash", "Cricket", "Soccer"]

supported_interests.each do |interest|
    Interest.create!(name: interest)
end

counter = 0
1000.times do
    random_first_name = Faker::Name.first_name
    random_last_name = Faker::Name.last_name
    random_username = random_first_name + "_" + random_last_name + counter.to_s
    random_email = random_username + "@gmail.com"
    counter += 1

    #Create User
    user = User.new()
    user.first_name = random_first_name
    user.last_name = random_last_name
    user.username = random_username
    user.email = random_email
    user.password = "123456"
    user.phone = Faker::PhoneNumber.phone_number

    #Check if user is unique by trying to save - always gonna be unique now tho!?
    if !user.save
        next
    end

    #Write username to csv 
    csv << [random_username]

    #Add Interests to User
    #Select random interests
    user_interests = []
    random_interest_seed = rand(1...supported_interests.length)
    for x in 1..5
        user_interests << supported_interests[(random_interest_seed + x) % supported_interests.length]
    end

    user_interests.each do |interest_name|
        #Map interest to player
        PlayerInterestMapping.create!(
            user_id: user.id, 
            interest: interest_name
        )
        #Create post for interest
        game = Game.create!(
            status: 0, #Change to the constant defined in game.rb in models
            venue: "UCLA Rec Center",
            date: Date.today + rand(1...365), 
            start_time: Time.now,
            end_time: (Time.now + 2*60*60),
            interest: interest_name,
            description: "This is a dummy description. We will replace this with Faker Lorem Ipsum eventually. But for now just trying to write enough to really stress test our application. Does it make a difference if this data is the same across games or different? Will there be caching if it is the same? Who knows?"
        )
        #put mapping from game to player
        PlayerGameMapping.create!(
            user_id: user.id,
            game_id: game.id,
            is_organizer: true
        )
    end    
end
end