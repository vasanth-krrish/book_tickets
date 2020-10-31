# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

['English', 'Tamil', 'Telugu', 'Malayalam', 'Kannada', 'Hindi'].each do |l|
  Language.create(language: l)
end

['Action', 'Horror', 'Sci-fi', 'Romance', 'Comedy', 'Drama'].each do |g|
  Genre.create(genre: g)
end

["Maisie Williams", "Stan Lee", "Simon", "Chris Evans"].each do |p|
  Person.create(name: p)
end

Theatre.create(name: "PVR", address: "Blore", city: "Blore", state: "Karnataka", pincode: "562352")
Screen.create(name: "Screen 1", theatre_id: 1, seats: 50)
Screen.create(name: "Screen 2", theatre_id: 1, seats: 50)
Timing.create(screen_id: 1, timing: "10:00")
Timing.create(screen_id: 1, timing: "13:00")
Timing.create(screen_id: 2, timing: "10:00")
Timing.create(screen_id: 2, timing: "13:00")
