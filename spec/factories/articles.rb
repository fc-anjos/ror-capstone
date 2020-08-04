FactoryBot.define do
  factory :article do
    user
    category
    author { user }
    title { Faker::Movie.title }
    text { Faker::Lorem.paragraphs(number: 20).map(&:to_s).join("\n\n") }
    categories { category }
    image { "https://source.unsplash.com/featured/?#{category.name}" }
  end
end
