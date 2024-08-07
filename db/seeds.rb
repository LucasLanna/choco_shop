if Rails.env.development?
  puts "Cleaning up database"
  User.destroy_all
  Product.destroy_all
  puts "Database cleaned"

  admin = User.create!(email: "admin@chocoshop.com", password: ENV["ADMIN_PASSWORD"])
  Product.create!(name: "Guylian", description: "Belgian Chocolate",price: 8.5, stock: 10, user: admin)
  Product.create!(name: "Lindt", description: "Swiss Chocolate", price: 7.5, stock: 8, user: admin)
  Product.create!(name: "Baci", description: "Italian Chocolate", price: 3.5, stock: 12, user: admin)
  Product.create!(name: "Tony's", description: "American Chocolate", price: 5.5, stock: 9, user: admin)
  puts "Products created"
end

if Rails.env.production?
  # Criar um seed de production caso necessário
end
