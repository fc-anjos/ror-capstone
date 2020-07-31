class Article < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_and_belongs_to_many :categories
  has_many :votes
  scope :most_voted, lambda {
    left_joins(:votes)
      .group(:id)
      .order('COUNT(articles.id) DESC')
      .first
  }
end
