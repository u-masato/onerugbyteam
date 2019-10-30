# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

15.times do |n|
    player = Player.new(name:'選手'+ n.to_s , position: PlayersHelper::POSITIONS[rand(10)], height: rand(160..210), weight: rand(60..140), birthday: Date.new(rand(1980..2000), rand(1..12), rand(1..28)), country_code: 'JP')
    player.save
end