require 'rails_helper'

RSpec.describe Article, type: :model do
  context 'Fetch categories name' do
    let!(:category) { create :category, :priority_1, :fashion }
    let!(:user) { create :user }
    let!(:article1) { create :article, author: user, categories: [category], image: 'test' }
    let!(:article2) { create :article, author: user, categories: [category], image: 'test' }
    let!(:article2) { create :article, author: user, categories: [category], image: 'test' }
    let!(:vote) { create :vote, article: article1, user: user }
    it 'appends this category to categories name' do
      expect(Article.most_voted).to eql(article1)
    end
  end
end
