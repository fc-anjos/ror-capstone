class Category < ApplicationRecord
  has_and_belongs_to_many :articles

  def self.categories_name
    Category.distinct.pluck(:name)
  end
end
