# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
require 'faker'
puts "Cleaning database..."
Pet.destroy_all

puts "Creating users"
users = 5.times.map do
  User.create!(
    email: Faker::Internet.email,
    password: 'password123',
    password_confirmation: 'password123'
  )
end

puts "Creating pets..."
[
  {name: "Beethoven", race: "Dog", price_per_day: 20, description: "lorem ipsum", targets: "rats"},
  {name: "Berlioz", race: "Cat", price_per_day: 10, description: "lorem ipsum", targets: "rats"},
  {name: "Toulouse", race: "Cat", price_per_day: 8, description: "lorem ipsum", targets: "mice"},
  {name: "Duchess", race: "Cat", price_per_day: 25, description: "lorem ipsum", targets: "mice"},
  {name: "Kayak", race: "Cat", price_per_day: 2, description: "lorem ipsum", targets: "bugs"},
  {name: "Garfield", race: "Cat", price_per_day: 8, description: "lorem ipsum", targets: "bed bugs"},
  {name: "Scooby-Doo", race: "Dog", price_per_day: 25, description: "lorem ipsum", targets: "mosquitoes"},
  {name: "Godzilla", race: "Iguana", price_per_day: 100, description: "lorem ipsum", targets: "spiders"},
  {name: "Raffaelo", race: "Turtle", price_per_day: 500, description: "lorem ipsum", targets: "villains"}
].each do |pet_attributes|
  pet = Pet.create!(pet_attributes.merge(user: users.sample))
  puts "Created #{pet.name}"
end

puts "Created #{Pet.count} pets"
