class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.integer :user_id
      t.text :body
      t.string :title
      t.integer :views
      t.text :draft
      t.boolean :published
      t.timestamps
    end
    add_index(:articles, :user_id)
  end
end
