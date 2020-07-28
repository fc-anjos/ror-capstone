class CreateVotes < ActiveRecord::Migration[6.0]
  def change
    create_table :votes do |t|
      t.integer :user_id, index: true, foreign_key: true
      t.integer :article_id, index: true, foreign_key: true
      t.timestamps
    end

    add_foreign_key :votes, :users, column: :user_id
    add_foreign_key :votes, :articles, column: :article_id
  end
end
