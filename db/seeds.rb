# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

require 'faker';
require 'open-uri';

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


pets = [
  {name: "Beethoven", race: "Dog", price_per_day: 20, description: "lorem ipsum", targets: "rats", photo: "https://res.cloudinary.com/dmj0udbma/image/upload/v1741200049/production/b63oxwni70nz33ga6i5rlbwoop0u.png"},
  {name: "Berlioz", race: "Armadillo", price_per_day: 10, description: "lorem ipsum", targets: "rats", photo: "https://res.cloudinary.com/dmj0udbma/image/upload/v1741544278/production/7a06psfh8m2ilt6km0qc5hhy5may.webp"},
  {name: "Toulouse", race: "Rhino", price_per_day: 8, description: "lorem ipsum", targets: "weeds", photo: "https://res.cloudinary.com/dmj0udbma/image/upload/v1741544613/production/vlieio2b052f0ymiwml23f43hf8t.png"},
  {name: "Duchess", race: "Monkey", price_per_day: 25, description: "lorem ipsum", targets: "bananas", photo: "https://res.cloudinary.com/dmj0udbma/image/upload/v1741724879/production/dgipfm1x69ftt3eypi0xslj1r6a3.jpg"},
  {name: "Kayak", race: "Giraffe", price_per_day: 2, description: "lorem ipsum", targets: "bugs", photo: "https://res.cloudinary.com/dmj0udbma/image/upload/v1741544835/production/1vwtkce54h9ourvfldt2dv43gk18.jpg"},
  {name: "Garfield", race: "Mouse", price_per_day: 8, description: "lorem ipsum", targets: "bed bugs", photo: "https://res.cloudinary.com/dmj0udbma/image/upload/v1741544735/production/893x7l973ixzzwu4jc83sf2r8syz.jpg"},
  {name: "Scooby-Doo", race: "Dog", price_per_day: 25, description: "lorem ipsum", targets: "mosquitoes", photo: "https://res.cloudinary.com/dmj0udbma/image/upload/v1741545092/production/db27p0ayfca5xh0rpzzodhc134ye.jpg"},
  {name: "Sonic", race: "Hedghog", price_per_day: 100, description: "lorem ipsum", targets: "spiders", photo: "https://res.cloudinary.com/dmj0udbma/image/upload/v1741544517/production/16pk8u5u88nd180b6wvs2tioskga.jpg"},
  {name: "Raffaelo", race: "Bear", price_per_day: 500, description: "lorem ipsum", targets: "villains", photo: "https://res.cloudinary.com/dmj0udbma/image/upload/v1741629030/production/ebe1xdbme2aon98zh0rayof6zonf.jpg"},
  {name: "Roux", race: "Iguana", price_per_day: 300, description: "lorem ipsum", targets: "insects", photo: "https://res.cloudinary.com/dmj0udbma/image/upload/v1741255556/production/7mg4393nqozwf3gvzmn6dkcm7kb1.jpg"},
  {name: "Alex", race: "Lion", price_per_day: 30, description: "lorem ipsum", targets: "mice, birds, vermin", photo: "https://res.cloudinary.com/dmj0udbma/image/upload/v1741545522/production/66gwhawx6yrjcxgrdmk18jieuud5.jpg"},
]

pets.each do |pet_attributes|
  photo_url = pet_attributes.delete(:photo)

  pet = Pet.new(pet_attributes.merge(user: users.sample))

  file = URI.open(photo_url)

  pet.photo.attach(
    io: file,
    filename: File.basename(photo_url),
    content_type: "image/jpeg"
  )

  pet.save!
  puts "Created #{pet.name}"
end
