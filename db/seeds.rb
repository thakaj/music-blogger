# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


taulant = User.create(username: "taulant", password: "test", password_confirmation: "test")


post_1 = Post.create(body: "this is a test", title: "test", user: taulant)



