# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
user = User.create(name: "test", email:"test@email.com", password:"test", address:"bandung", phone:"09777832")
admin = User.create(name: "admin", email:"admin@email.com", password:"admin", address:"bandung", phone:"987778271", role:"admin")

category1 = Category.create(name: "Menu Utama", description: "menu yang disajikan sebagai sajian utama di isi dengan makana berat")
category2 = Category.create(name: "Minuman", description: "cairan untuk melepas dahaga")

menu1 = Menu.create(name:"Nasi Kuning", description:"nasi dengan pewarna alami dari kunyit", price: 10000, category_id:1)
menu2 = Menu.create(name:"Jus Jeruk", description:"minuman dari perasan jeruk asli", price: 5000, category_id: 2)
