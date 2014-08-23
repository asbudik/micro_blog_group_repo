class Post < ActiveRecord::Base
  belongs_to :user
  has_many :comments, :as => :commentable
  has_many :posttags
  has_many :tags, :through => :posttags
end
