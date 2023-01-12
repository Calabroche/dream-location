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
  img_url: 'https://images.unsplash.com/photo-1666335009171-3ddc17937d6d?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1470&q=80'
)


puts 'BDD créée!'
