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

bob = User.create!(
  email: "bob@gmail.com",
  password: "testtest",
  first_name: "Bob",
  last_name: "Moran"
)

bill = User.create!(
  email: "bill@gmail.com",
  password: "testtest",
  first_name: 'Bill',
  last_name: "Clontin"
)

michel = User.create!(
  email: "michel@gmail.com"
  password: "testtest",
  first_name: "Michel",
  last_name: "Blanc"
)

johnny = User.create!(
  email: "johnny@gmail.com",
  password: "testtest",
  first_name: "Johnny"
  last_name: "Holiday"
)

user = [bob, bill, michel, johnny]

10.times do

  vehicle = Vehicle.new(
    brand:  BRANDS.sample,
    price:  (25..100).to_a.sample,
    description: "Trop bien",
    model: %w(125 250 350 500 750).to_a.sample
  )
    vehicle.user = user.sample
    vehicle.save
end
