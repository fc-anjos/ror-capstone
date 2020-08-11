FactoryBot.define do
  factory :article, class: Article do
    title { Faker::Movie.title }
    text { Faker::Lorem.paragraphs(number: 20).map(&:to_s).join("\n\n") }
    image { Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec', 'factories', 'article_image.jpg')) }
  end
end
