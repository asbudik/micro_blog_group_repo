class Post < ActiveRecord::Base
  belongs_to :user
  has_many :comments, :as => :commentable
  has_many :posttags
  has_many :tags, :through => :posttags

  validate :title, presence: true, length: {:minimum => 2, :maximum => 40}
  validate :body, presence: true, length: {:minimum => 2, :maximum => 250} 
end
