class Vote < ApplicationRecord
  belongs_to :article
  belongs_to :user
  validates :user_id, uniqueness: { scope: :article_id, message: 'A user can only vote once in an article' }
end
