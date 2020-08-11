require 'rails_helper'

RSpec.describe Category, type: :model do
  context 'Fetch categories name' do
    let!(:category) { create :category, :priority_1, :fashion }

    it 'appends this category to categories name' do
      expect(Category.categories_name).to include(category.name)
    end
  end
  context 'Most recent article' do
    let(:user) { create :user }
    let(:category) { create :category, :priority_1, :fashion }
    let!(:article1) { create :article, author: user, categories: [category] }
    let!(:article2) { create :article, author: user, categories: [category] }

    it 'Grabs the most recent article of this category' do
      expect(category.most_recent_article).to eql(article2)
    end

    it 'And not the former one' do
      expect(category.most_recent_article).not_to eql(article1)
    end
  end

  context 'Fetch top category' do
    let!(:category1) { create :category, :priority_1, :fashion }
    let!(:category2) { create :category, :priority_2, :magazine }
    it 'Grabs the top rated category' do
      expect(Category.top(1).first).to eql(category1)
    end

    it 'And not the other ones' do
      expect(Category.top(1).first).not_to eql(category2)
    end
  end
end
