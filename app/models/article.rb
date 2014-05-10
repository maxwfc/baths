class Article < ActiveRecord::Base
  belongs_to :user
  
  validates :body, :presence => true
  validates :title, :presence => true
  has_attached_file :mainImage, :styles => { :main => "600x400>", :thumb => "150x80>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :mainImage, :content_type => /\Aimage\/.*\Z/
  
  attr_accessor :formatted_time
    
end