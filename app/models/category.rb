class Category < ApplicationRecord
  has_and_belongs_to_many :articles

  def self.categories_name
    Category.distinct.pluck(:name)
  end

  def most_recent_article
    articles.order('created_at desc').first
  end

  def self.top(number)
    order('priority').limit(number)
  end
end
