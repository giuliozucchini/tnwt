class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|

      t.string :title
      t.string :headline
      t.text :article_body
      t.string :brand
      t.datetime :date
      t.string :author
      t.string :url
      t.timestamps null: false
      
    end
  end
end
