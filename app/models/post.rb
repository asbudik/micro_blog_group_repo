class Post < ActiveRecord::Base
  belongs_to :user
  has_many :comments, :as => :commentable
  has_many :posttags
  has_many :tags, :through => :posttags

  validates :title, length: {:maximum => 50}, presence: true
  validates :body, length: {:maximum => 251}, presence: true

  acts_as_commentable
end