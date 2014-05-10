class User < ActiveRecord::Base
  
  authenticates_with_sorcery!

  validates :password, length: { minimum: 7 }, on: :new
  validates :password, confirmation: true, on: :new
  validates :password_confirmation, presence: true, on: :new

  validates :email, uniqueness: true

  has_many :articles
  
  attr_accessor :first_and_initials


  #paperclip --
  
  has_attached_file :avatar, :styles => { :medium => "300x220>", :thumb => "40x40>" }, :default_url => "/images/:style/missing.png"
    validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/
    
  #attr_accessor :email, :password, :password_confirmation


  #after_save :clear_password
  #after_create :send_welcome_email
  #before_destroy :set_deleted_flag
  
  
  #scope :published, where(articles.where(published: true).count > 0)
  #scope :recent, -> { order("created_at desc").limit(3) }
  
  
  #def send_welcome_email
 # end
  
  #def set_deleted_flag
  #  false
  #end
  
end