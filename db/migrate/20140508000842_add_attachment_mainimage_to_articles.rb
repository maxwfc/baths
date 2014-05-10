class AddAttachmentMainimageToArticles < ActiveRecord::Migration
  def self.up
    change_table :articles do |t|
      t.attachment :mainImage
    end
  end

  def self.down
    drop_attached_file :articles, :mainImage
  end
end
