class CreateArticles < ActiveRecord::Migration[6.0]
  def change
    create_table :articles do |t|
      t.integer :author_id, index: true, foreign_key: true
      t.integer :category_id, index: true, foreign_key: true
      t.string :title
      t.string :text
      t.string :image
      t.timestamps
    end

    add_foreign_key :articles, :users, column: :author_id
    add_foreign_key :articles, :categories, column: :category_id
  end
end
