require 'faker'
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

3.times do
  user = User.create(
    name: Faker::Name.unique.name
  )

  article = Article.create(author: user,
                 title: Faker::Movie.title,
                 text: Faker::Movie.quote
                )
  Vote.create(article: article, user: user)
end
