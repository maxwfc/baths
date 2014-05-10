class AddExcerptLengthToArticles < ActiveRecord::Migration
  def change
    add_column :articles, :excerpt_length, :int
  end
end
