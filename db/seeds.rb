# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts 'cleaning up database'
Flat.destroy_all
puts 'database is clean'

puts 'Creating flats...'
10.times do
  flat = Flat.create(
    name: ['Light & Spacious Garden Flat', 'Stylish House Close to River Thames', 'St Pancras Clock Tower Guest Suite'].sample,
    address: Faker::Address.street_address,
    description: "A lovely summer feel for this spacious garden flat. Two double bedrooms, open plan living area, large kitchen and a beautiful conservatory",
    price_per_night: rand(50..999),
    number_of_guests: rand(1..10),
    picture_url:
    ['https://images.unsplash.com/photo-1464890100898-a385f744067f?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80 870w', ]
  )

  puts "flat #{flat.id} is created"
end
puts 'done'
