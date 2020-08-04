require 'rails_helper'

RSpec.describe Category, type: :model do
  context 'Fetch categories name' do
    let(:category) { create :category }

    it 'appends this category to categories name' do
      byebug
      expect(category).to be_an(Category)
    end
  end
end
