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

puts "Creating pets..."
Pet.create!(name: "Beethoven", race: "Dog", price_per_day: 20, description: "lorem ipsum", targets: "rats")
puts "Created Beethoven"
Pet.create!(name: "Berlioz", race: "Cat", price_per_day: 10, description: "lorem ipsum", targets: "rats")
puts "Created Berlioz"
Pet.create!(name: "Toulouse", race: "Cat", price_per_day: 8, description: "lorem ipsum", targets: "mice")
puts "Created Toulouse"
Pet.create!(name: "Duchess", race: "Cat", price_per_day: 25, description: "lorem ipsum", targets: "mice")
puts "Created Duchess"
Pet.create!(name: "Kayak", race: "Cat", price_per_day: 2, description: "lorem ipsum", targets: "bugs")
puts "Created Kayak"
Pet.create!(name: "Garfield", race: "Cat", price_per_day: 8, description: "lorem ipsum", targets: "bed bugs")
puts "Created Garfield"
Pet.create!(name: "Scooby-Doo", race: "Dog", price_per_day: 25, description: "lorem ipsum", targets: "mosquitoes")
puts "Created Scooby-Doo"
Pet.create!(name: "Godzilla", race: "Iguana", price_per_day: 100, description: "lorem ipsum", targets: "spiders")
puts "Created Godzilla"
Pet.create!(name: "Raffaelo", race: "Turtle", price_per_day: 500, description: "lorem ipsum", targets: "villains")
puts "Created Raffaelo"


puts "Created #{Pet.count} pets"
