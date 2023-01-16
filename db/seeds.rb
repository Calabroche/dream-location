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
  name: 'Journée de rêve dans un hélicopter',
  description: 'Bonjour, je m\'appelle Serge, j\'ai 59 ans et suis un passionné d\hélicopter. J\'ai la chance d\'en avoir un et je voudrais partager cette passion avec une personne qui rêve d\'en faire. Je serais très heureux de pouvoir rendre heureux quelqu\'un',
  user: serge,
  regions: 'PACA',
  img_url: 'https://cutt.ly/I2K1bq9',
  number_street: "10",
  name_street: "rue du paradis",
  post_code: "69001",
  city: "Lyon"
)

Dream.create!(
  name: 'Place V.I.P pour un match de l\'OL en loges',
  description: 'Bonjour, je propose deux places avc accès V.I.P pour match de l\'ol ',
  user: serge,
  regions: 'PACA',
  img_url: 'https://cutt.ly/v2LHxyb',
  number_street: "7",
  name_street: "Boulevard du Prince de Galles",
  post_code: "64200",
  city: "Biarritz"
)

Dream.create!(
  name: 'Traversée de l\'atlantique en catamaran',
  description: 'Bonjour à tous, je prépare une traversée de l\'atlantique dans un mois au départ Biarritz',
  user: serge,
  regions: 'Nouvelle-Aquitiane',
  img_url: 'https://cutt.ly/j2LHAlb',
  number_street: "3",
  name_street: "Rue Abbe Henri Gregoire",
  post_code: "35000",
  city: "Rennes"
)

Dream.create!(
  name: 'Journée dans une ferrari',
  description: 'Passionné d\'automobile, je propose une demi-journée au bord de ma ferrari sur Monac et ses alentours',
  user: serge,
  regions: 'PACA',
  img_url: 'https://urlz.fr/kpLd',
  number_street: "10",
  name_street: "Place de la Mairie",
  post_code: "98000",
  city: "Monaco"
)

Dream.create!(
  name: 'Journée de chasse dans le Rhône(69)',
  description: 'Offre d\'une journée de chasse dans l\'ACCA de Dardilly',
  user: serge,
  regions: 'Auvergnes - Rhône-Alpes',
  img_url: 'https://images.unsplash.com/photo-1615226661904-a5ea74800579?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80',
  number_street: "17",
  name_street: "rue du pivert",
  post_code: "67076",
  city: "Strasbourg"
)
puts 'BDD créée!'
