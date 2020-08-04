require 'faker'
require 'open-uri'
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

  4.times do
    article = Article.new(
      author: user,
      title: Faker::Movie.title,
      text: Faker::Lorem.paragraphs(number: 20).map(&:to_s).join("\n\n"),
      categories: [category]
    )
    url = "https://source.unsplash.com/featured/?#{category.name}"
    article.remote_image_url = "https://source.unsplash.com/featured/?#{category.name}"
    sleep(1)
    URI.open(url)
    sleep(1)
    URI.open(url)
    sleep(1)
    article.save
    Vote.create(article: article, user: user)
    Vote.create(article: article, user: user) if category_name == 'Fashion'
  end
end
