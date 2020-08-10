require 'rails_helper'

RSpec.describe Article, type: :model do
  context 'Fetch most voted article' do
    let(:user) { create :user }
    let(:category) { create :category, :priority_1, :fashion }
    let!(:article1) { create :article, author: user, categories: [category] }
    let!(:article2) { create :article, author: user, categories: [category] }
    let!(:article2) { create :article, author: user, categories: [category] }
    let!(:vote) { create :vote, user: user, article: article1 }

    it 'Grabs the most voted article' do
      expect(Article.most_voted).to eql(article1)
    end

    it 'And not the other ones' do
      expect(Article.most_voted).not_to eql(article2)
    end
  end
end
