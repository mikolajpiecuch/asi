# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

50.times do
  User.create([{
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    email: Faker::Internet.email,
    password_digest: BCrypt::Password.create(Faker::Internet.password(5))
    }])
end


Faker::Base.numerify('(+48) ### ### ###')
500.times do
  Trip.create([{
      depdate: Faker::Date.backward(30),
      place: Faker::Address.city,
      description: Faker::Hipster.sentence,
      phone: Faker::PhoneNumber.phone_number,
      capacity: Faker::Number.between(1,10),
      car: Faker::StarWars.vehicle,
      creator: Faker::Number.between(1, 50)
    }])
end
