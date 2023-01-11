# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

puts "Cleaning database..."
Dream.destroy_all

puts"Base de donnée supprimée"

serge = User.create!(
  email: 'florian@leboss.com',
  password: '123456',
)
puts"User crée"

Dream.create!(
  name: 'hello',
  description: 'coucou je pense que c le meilleur drop du monde',
  user: serge,
  regions: 'PACA',
)


puts 'BDD créée!'
