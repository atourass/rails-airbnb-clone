# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Vehicle.destroy_all
User.destroy_all

require 'faker'

1.times do
  name = Faker::FamilyGuy.character.delete(' ')
  user = User.new(
    email: "#{name}@#{Faker::Music.instrument.delete(' ')}.com",
    password: "jeanluc",
    first_name: "John",
    last_name: name,
    address: "#{Faker::FamilyGuy.location}.com"
  )
  user.save!
  # puts user.errors.full_messages
  #
  puts 'Creating x fake VEHICLES...'

  (1..3).to_a.sample.times do
    vehicle = Vehicle.new(
      brand:  "HONDA",
      price:  (25..100).to_a.sample,
      description: "Scooter",
      model: %w(125 250 350 500 750).to_a.sample
    )
    vehicle.user = user
    puts vehicle
    vehicle.save
  end
end


puts 'Finished!'
