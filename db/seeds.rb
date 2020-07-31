require 'faker'
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


User.create(
    {
      name: 'Felipe',
      email: 'felipe.anjos@usp.br',
      password: '123456',
      password_confirmation: '123456'
    }
  )

categories = %w[Fashion
                Business
                Sports
                Entertainment
                Magazine
                TV]

categories.each_with_index do |category_name, i|

  user = User.create(
    {
      name: Faker::Name.unique.name,
      email: Faker::Internet.unique.email,
      password: '123456',
      password_confirmation: '123456'
    }
  )

  category = Category.create(
    name: category_name,
    priority: i + 1
  )

  article = Article.create(
    author: user,
    title: Faker::Movie.title,
    text: Faker::Movie.quote,
    categories: [category],
    image: "https://source.unsplash.com/featured/?#{category.name}"
  )

  Vote.create(article: article, user: user)
  Vote.create(article: article, user: user) if category_name == 'Fashion'
end
