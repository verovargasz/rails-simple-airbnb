# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

4.times do
  Flat.create!(
    name: "#{Faker::Company.buzzword} #{%w[apartment house].sample}",
    address: Faker::Address.full_address,
    description: Faker::Marketing.buzzwords,
    price_per_night: rand(5..200),
    number_of_guests: rand(1..10)
  )
end
puts 'done'
