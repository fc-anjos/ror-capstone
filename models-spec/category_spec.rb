require 'rails_helper'

RSpec.describe Category, type: :model do
  context 'Fetch categories name' do
    let!(:category) { create :category }

    it 'appends this category to categories name' do
      expect(Category.categories_name).to eql([category.name])
    end

    context 'Fetch most recent article' do
      let!(:article2) { create :article }

      it 'Grabs the last created article' do
        expect(category.most_recent_article).to eql(article2)
      end
    end
  end
end
