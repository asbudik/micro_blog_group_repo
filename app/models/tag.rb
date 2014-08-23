class Tag < ActiveRecord::Base
  has_many :posttags
  has_many :posts, :through => :posttags
  has_many :users, :through => :posts
end
