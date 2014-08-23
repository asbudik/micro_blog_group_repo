class User < ActiveRecord::Base
  has_many :posts
  has_many :pages
  has_many :tags, :through => :posts

  validates :email, presence: true, uniqueness: true
  	validates :email, confirmation: true
  		validates :email_confirmation, presence: true
  		
 		validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i

  validates :first_name, length: {:minimum => 3}, presence: true
  validates :last_name, length: {:minimum => 2}, presence: true, uniqueness: true
  
  	ONLY_LETTERS_AND_START_WITH_CAP = /\A[A-Z][a-zA-Z]*\z/
  	validates_format_of :first_name, :with => ONLY_LETTERS_AND_START_WITH_CAP
  	validates_format_of :last_name, :with => ONLY_LETTERS_AND_START_WITH_CAP
end
