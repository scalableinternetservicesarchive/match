# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

#Add the interests we support
supported_interests = ["Basketball", "Football", "Tennis", "Table Tennis", "Rugby", "Water Polo", "Polo", "Foosball", "Golf", "Pool", "Spikeball", "Chess", "Squash", "Cricket", "Soccer"]

supported_interests.each do |interest|
    Interest.create!(name: interest)
end

10.times do
    random_first_name = Faker::Name.unique.first_name
    random_last_name = Faker::Name.last_name
    random_username = random_first_name + "_" + random_last_name

    #Create User
    user = User.create!(
        first_name: random_first_name,
        last_name: random_last_name,
        username: random_username,
        email: Faker::Internet.unique.email,
        password: "123456",
        phone: Faker::PhoneNumber.phone_number
    )

    #Add Interests to User
    #Select random interests
    user_interests = []
    for x in 1..5
        user_interests << supported_interests[rand(1...supported_interests.length())]
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

    #Add Game Interest Mapping for the Games that this User just organized
    
end