FactoryBot.define do
  factory :article, class: Article do
    title { Faker::Movie.title }
    text { Faker::Lorem.paragraphs(number: 20).map(&:to_s).join("\n\n") }
  end
end
