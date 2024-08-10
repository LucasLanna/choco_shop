require "open-uri"

if Rails.env.development?
  puts "Cleaning up database"
  User.destroy_all
  Product.destroy_all
  puts "Database cleaned"

  products = []
  admin = User.create!(email: "admin@chocoshop.com", password: ENV["ADMIN_PASSWORD"])
  products << Product.create!(name: "Guylian", description: "Belgian Chocolate",price: 8.5, stock: 10, user: admin)
  products << Product.create!(name: "Lindt", description: "Swiss Chocolate", price: 7.5, stock: 8, user: admin)
  products << Product.create!(name: "Baci", description: "Italian Chocolate", price: 3.5, stock: 12, user: admin)
  products << Product.create!(name: "Tony's", description: "American Chocolate", price: 5.5, stock: 9, user: admin)

  chocolates = [{ name: "Novi", description: "Italian Chocolate", price: 4.5, stock: 7 },
  { name: "Godiva", description: "Belgian Chocolate", price: 9.0, stock: 6 },
  { name: "Ferrero Rocher", description: "Italian Chocolate", price: 10.0, stock: 5 },
  { name: "Ghirardelli", description: "American Chocolate", price: 6.5, stock: 15 },
  { name: "Toblerone", description: "Swiss Chocolate", price: 7.0, stock: 10 },
  { name: "Milka", description: "German Chocolate", price: 4.0, stock: 12 },
  { name: "Cadbury", description: "British Chocolate", price: 5.0, stock: 11 },
  { name: "Mars", description: "American Chocolate", price: 3.0, stock: 20 },
  { name: "Nestle", description: "Swiss Chocolate", price: 5.5, stock: 14 },
  { name: "Hershey's", description: "American Chocolate", price: 4.5, stock: 18 },
  { name: "Green & Black's", description: "British Chocolate", price: 6.0, stock: 8 },
  { name: "Valrhona", description: "French Chocolate", price: 12.0, stock: 4 },
  { name: "Amedei", description: "Italian Chocolate", price: 15.0, stock: 3 },
  { name: "Côte d'Or", description: "Belgian Chocolate", price: 8.0, stock: 7 },
  { name: "Chuao", description: "Venezuelan Chocolate", price: 11.0, stock: 5 },
  { name: "Vosges", description: "American Chocolate", price: 14.0, stock: 2 },
  { name: "Leonidas", description: "Belgian Chocolate", price: 9.5, stock: 8 },
  { name: "Perugina", description: "Italian Chocolate", price: 5.0, stock: 10 },
  { name: "Michel Cluizel", description: "French Chocolate", price: 13.0, stock: 6 },
  { name: "Scharffen Berger", description: "American Chocolate", price: 7.5, stock: 12 },
  { name: "Charbonnel et Walker", description: "British Chocolate", price: 11.0, stock: 4 },
  { name: "La Maison du Chocolat", description: "French Chocolate", price: 14.5, stock: 5 },
  { name: "Patchi", description: "Lebanese Chocolate", price: 10.0, stock: 7 },
  { name: "Aero", description: "British Chocolate", price: 3.5, stock: 16 },
  { name: "Guittard", description: "American Chocolate", price: 6.0, stock: 9 },
  { name: "Dagoba", description: "American Chocolate", price: 7.0, stock: 11 },
  { name: "Divine", description: "British Chocolate", price: 8.0, stock: 10 },
  { name: "L'Artisan du Chocolat", description: "British Chocolate", price: 12.5, stock: 3 },
  { name: "Hotel Chocolat", description: "British Chocolate", price: 9.5, stock: 8 },
  { name: "El Rey", description: "Venezuelan Chocolate", price: 7.5, stock: 6 },
  { name: "Venchi", description: "Italian Chocolate", price: 6.5, stock: 12 },
  { name: "Ritter Sport", description: "German Chocolate", price: 4.5, stock: 14 },
  { name: "Callebaut", description: "Belgian Chocolate", price: 8.0, stock: 10 },
  { name: "Neuhaus", description: "Belgian Chocolate", price: 13.0, stock: 4 },
  { name: "Santander", description: "Colombian Chocolate", price: 8.5, stock: 9 },
  { name: "Chocolove", description: "American Chocolate", price: 5.5, stock: 15 }]

  chocolates.each do |chocolate|
    chocolate[:user] = admin
    products << Product.create!(chocolate)
  end

  # Passar por cada produto, pegar seu nome e baixar uma imagem especifica
  products.each do |product|
    # product_url = URI.open("https://picsum.photos/seed/picsum/200/300/?search=#{product.name.dowcase}")
   # product_url = URI.open("https://picsum.photos/seed/picsum/200/300/")
    product_url = URI.open("https://random.imagecdn.app/500/150")
    product.photo.attach(io: product_url, filename: "#{product.name.downcase}.png", content_type: "image/png")
    product.save!
  end

  puts "Products created"
end

if Rails.env.production?
  # Criar um seed de production caso necessário
  #
  #admin = User.create!(email: "admin@chocoshop.com", password: ENV["ADMIN_PASSWORD"])
  Product.create!(name: "Guylian", description: "Belgian Chocolate",price: 8.5, stock: 10, user: admin)
  Product.create!(name: "Lindt", description: "Swiss Chocolate", price: 7.5, stock: 8, user: admin)
  Product.create!(name: "Baci", description: "Italian Chocolate", price: 3.5, stock: 12, user: admin)
  Product.create!(name: "Tony's", description: "American Chocolate", price: 5.5, stock: 9, user: admin)
  # { name: "Novi", description: "Italian Chocolate", price: 4.5, stock: 7 },
  # { name: "Godiva", description: "Belgian Chocolate", price: 9.0, stock: 6 },
  # { name: "Ferrero Rocher", description: "Italian Chocolate", price: 10.0, stock: 5 },
  # { name: "Ghirardelli", description: "American Chocolate", price: 6.5, stock: 15 },
  # { name: "Toblerone", description: "Swiss Chocolate", price: 7.0, stock: 10 },
  # { name: "Milka", description: "German Chocolate", price: 4.0, stock: 12 },
  # { name: "Cadbury", description: "British Chocolate", price: 5.0, stock: 11 },
  # { name: "Mars", description: "American Chocolate", price: 3.0, stock: 20 },
  # { name: "Nestle", description: "Swiss Chocolate", price: 5.5, stock: 14 },
  # { name: "Hershey's", description: "American Chocolate", price: 4.5, stock: 18 },
  # { name: "Green & Black's", description: "British Chocolate", price: 6.0, stock: 8 },
  # { name: "Valrhona", description: "French Chocolate", price: 12.0, stock: 4 },
  # { name: "Amedei", description: "Italian Chocolate", price: 15.0, stock: 3 },
  # { name: "Côte d'Or", description: "Belgian Chocolate", price: 8.0, stock: 7 },
  # { name: "Chuao", description: "Venezuelan Chocolate", price: 11.0, stock: 5 },
  # { name: "Vosges", description: "American Chocolate", price: 14.0, stock: 2 },
  # { name: "Leonidas", description: "Belgian Chocolate", price: 9.5, stock: 8 },
  # { name: "Perugina", description: "Italian Chocolate", price: 5.0, stock: 10 },
  # { name: "Michel Cluizel", description: "French Chocolate", price: 13.0, stock: 6 },
  # { name: "Scharffen Berger", description: "American Chocolate", price: 7.5, stock: 12 },
  # { name: "Charbonnel et Walker", description: "British Chocolate", price: 11.0, stock: 4 },
  # { name: "La Maison du Chocolat", description: "French Chocolate", price: 14.5, stock: 5 },
  # { name: "Patchi", description: "Lebanese Chocolate", price: 10.0, stock: 7 },
  # { name: "Aero", description: "British Chocolate", price: 3.5, stock: 16 },
  # { name: "Guittard", description: "American Chocolate", price: 6.0, stock: 9 },
  # { name: "Dagoba", description: "American Chocolate", price: 7.0, stock: 11 },
  # { name: "Divine", description: "British Chocolate", price: 8.0, stock: 10 },
  # { name: "L'Artisan du Chocolat", description: "British Chocolate", price: 12.5, stock: 3 },
  # { name: "Hotel Chocolat", description: "British Chocolate", price: 9.5, stock: 8 },
  # { name: "El Rey", description: "Venezuelan Chocolate", price: 7.5, stock: 6 },
  # { name: "Venchi", description: "Italian Chocolate", price: 6.5, stock: 12 },
  # { name: "Ritter Sport", description: "German Chocolate", price: 4.5, stock: 14 },
  # { name: "Callebaut", description: "Belgian Chocolate", price: 8.0, stock: 10 },
  # { name: "Neuhaus", description: "Belgian Chocolate", price: 13.0, stock: 4 },
  # { name: "Santander", description: "Colombian Chocolate", price: 8.5, stock: 9 },
  # { name: "Chocolove", description: "American Chocolate", price: 5.5, stock: 15 }
end



# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end



puts "products created"
