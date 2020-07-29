require 'faker'
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

categories = %w[Fashion
                Business
                Sports
                Entertainment
                Magazine
                TV]
categories.each do |category_name|
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
    priority: rand(0..10)
  )

  article = Article.create(
    author: user,
    title: Faker::Movie.title,
    text: Faker::Movie.quote,
    categories: [category]
  )

  Vote.create(article: article, user: user)
end
