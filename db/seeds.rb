# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
puts "cleaning up database"
Product.destroy_all
puts "database cleaned"
products = [
  {name: "Guylian", description: "Belgian Chocolate", price: 8.5, stock: 10},
  {name: "Lindt", description: "Swiss Chocolate", price: 7.5, stock: 8},
  {name: "Baci", description: "Italian Chocolate", price: 3.5, stock: 12},
  {name: "Tony's", description: "American Chocolate", price: 5.5, stock: 9},
  {name: "Novi", description: "Italian Chocolate", price: 4.5, stock: 7}
  ]
puts "products created"
