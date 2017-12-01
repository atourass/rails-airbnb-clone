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
BRANDS = %w(Honda Suzuki Harley BMW Kawasaki Vespa Yamaha Triumph Ducati Piaggio)
10.times do
  user = User.create!(
    email: Faker::Internet.email,
    password: Faker::Internet.password(8)
  )
  vehicle = Vehicle.new(
    brand:  BRANDS.sample,
    price:  (25..100).to_a.sample,
    description: "Trop bien",
    model: %w(125 250 350 500 750).to_a.sample
  )
    vehicle.user = user
    vehicle.save
end

antoine = User.create!(
  email: antoine.tourasse@gmail.com,
  password: testtest
)
