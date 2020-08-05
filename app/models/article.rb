class Article < ApplicationRecord
  validates_presence_of :categories, :image, :title
  mount_uploader :image, ImageUploader
  belongs_to :author, class_name: 'User'
  has_and_belongs_to_many :categories
  has_many :votes
  scope :most_voted, lambda {
    left_joins(:votes)
      .group(:id)
      .order('COUNT(articles.id) DESC')
      .first
  }
  has_rich_text :text
end
