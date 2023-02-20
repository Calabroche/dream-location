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

florian = User.create!(
  email: 'florian@leboss.com',
  password: '123456',
  nickname: "Florian",
)

helena = User.create!(
  email: 'helena@laboss.com',
  password: '123456',
  nickname: "Héléna",
)

puts"User crée"

Dream.create!(
  name: 'Journée de rêve dans un hélicopter',
  description: 'Bonjour, je m\'appelle Florian, j\'ai 59 ans et suis un passionné d\hélicopter. J\'ai la chance d\'en avoir un et je voudrais partager cette passion avec une personne qui rêve d\'en faire. Je serais très heureux de pouvoir rendre heureux quelqu\'un',
  user: florian,
  regions: 'PACA',
  img_url_one: 'https://cutt.ly/I2K1bq9',
  img_url_two: 'https://cutt.ly/v2LHxyb',
  img_url_three: 'https://cutt.ly/j2LHAlb',
  img_url_four: 'https://cutt.ly/I2K1bq9',
  img_url_five: 'https://cutt.ly/I2K1bq9',
  number_street: "10",
  name_street: "Quai du Port",
  post_code: "13002",
  city: "Marseille"
)

Dream.create!(
  name: 'Place V.I.P pour un match de l\'OL en loges',
  description: 'Bonjour, je propose deux places avc accès V.I.P pour match de l\'ol ',
  user: florian,
  regions: 'PACA',
  img_url_one: 'https://cutt.ly/v2LHxyb',
  img_url_two: 'https://images.unsplash.com/photo-1577223625816-7546f13df25d?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2070&q=80',
  img_url_three: 'https://images.unsplash.com/photo-1556816214-fda351e4a7fb?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2070&q=80',
  img_url_four: 'https://images.unsplash.com/photo-1522778119026-d647f0596c20?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2070&q=80',
  img_url_five: 'https://images.unsplash.com/photo-1431324155629-1a6deb1dec8d?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2070&q=80',
  number_street: "2",
  name_street: "Place de l'Hôtel de Ville",
  post_code: "83990",
  city: "Saint-Tropez"
)

Dream.create!(
  name: 'Traversée de l\'atlantique en catamaran',
  description: 'Bonjour à tous, je prépare une traversée de l\'atlantique dans un mois au départ Biarritz',
  user: florian,
  regions: 'PACA',
  img_url_one: 'https://cutt.ly/j2LHAlb',
  img_url_two: 'https://cutt.ly/I2K1bq9',
  img_url_three: 'https://cutt.ly/I2K1bq9',
  img_url_four: 'https://cutt.ly/I2K1bq9',
  img_url_five: 'https://cutt.ly/I2K1bq9',
  number_street: "10",
  name_street: "boulevard de la république",
  post_code: "06400",
  city: "Cannes"
)

Dream.create!(
  name: "Journée en jet ski",
  description: 'Bonjour, je propose une journée en jetski pour 2 personnes.',
  user: florian,
  regions: 'PACA',
  img_url_one: 'https://images.unsplash.com/photo-1583008585590-c4ed0010bed6?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80',
  img_url_two: 'https://cutt.ly/I2K1bq9',
  img_url_three: 'https://cutt.ly/I2K1bq9',
  img_url_four: 'https://cutt.ly/I2K1bq9',
  img_url_five: 'https://cutt.ly/I2K1bq9',
  number_street: "3001",
  name_street: "Route des Hauts du Camp",
  post_code: "83330",
  city: "Le Castellet"
)


Dream.create!(
  name: 'Journée dans une ferrari',
  description: 'Passionné d\'automobile, je propose une demi-journée au bord de ma ferrari sur Monaco et ses alentours',
  user: florian,
  regions: 'PACA',
  img_url_one: 'https://images.unsplash.com/photo-1554223090-7e482851df45?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1103&q=80',
  img_url_two: 'https://cutt.ly/I2K1bq9',
  img_url_three: 'https://cutt.ly/I2K1bq9',
  img_url_four: 'https://cutt.ly/I2K1bq9',
  img_url_five: 'https://cutt.ly/I2K1bq9',
  number_street: "10",
  name_street: "Place de la Mairie",
  post_code: "98000",
  city: "Monaco"
)


Dream.create!(
  name: 'Journée vélo dans les vignes',
  description: 'Bonjour, je propose une journée de vélo dans les vignes de la région d\'Avignon',
  user: florian,
  regions: 'PACA',
  img_url_one: 'https://images.unsplash.com/photo-1633707167682-9068729bc84c?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2071&q=80',
  img_url_two: 'https://images.unsplash.com/photo-1556221620-3616894469d9?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2070&q=80',
  img_url_three: 'https://images.unsplash.com/photo-1629056528325-f328b5f27ae7?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2070&q=80',
  img_url_four: 'https://images.unsplash.com/photo-1602608503778-70648b3e37cc?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2070&q=80',
  img_url_five: 'https://images.unsplash.com/photo-1453169753818-2feab4b4246d?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1974&q=80',
  number_street: "10",
  name_street: "Place de l'horloge",
  post_code: "84000",
  city: "Avignon"
)

Dream.create!(
  name: 'Soirée offert au casino',
  description: 'Offre de 1000€ pour aller jouer au casino de Cannes',
  user: florian,
  regions: 'PACA',
  img_url_one: 'https://images.unsplash.com/photo-1596838132731-3301c3fd4317?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80',
  img_url_two: 'https://cutt.ly/I2K1bq9',
  img_url_three: 'https://cutt.ly/I2K1bq9',
  img_url_four: 'https://cutt.ly/I2K1bq9',
  img_url_five: 'https://cutt.ly/I2K1bq9',
  number_street: "54",
  name_street: "Bd d’Alsace",
  post_code: "06400",
  city: "Cannes"
)

Dream.create!(
  name: 'Journée de chasse dans le Rhône(69)',
  description: 'Offre d\'une journée de chasse dans l\'ACCA de Dardilly',
  user: florian,
  regions: 'Auvergnes - Rhône-Alpes',
  img_url_one: 'https://images.unsplash.com/photo-1615226661904-a5ea74800579?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80',
  img_url_two: 'https://cutt.ly/I2K1bq9',
  img_url_three: 'https://cutt.ly/I2K1bq9',
  img_url_four: 'https://cutt.ly/I2K1bq9',
  img_url_five: 'https://cutt.ly/I2K1bq9',
  number_street: "17",
  name_street: "rue du pivert",
  post_code: "67076",
  city: "Strasbourg"
)

puts 'BDD créée!'
