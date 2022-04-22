# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
user = User.create(name: "test", email:"test@email.com", password:"test", address:"bandung", phone:"09777832")
admin = User.create(name: "admin", email:"admin@email.com", password:"admin", address:"bandung", phone:"987778271", role:"admin")

