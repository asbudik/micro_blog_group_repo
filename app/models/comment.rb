class Comment < ActiveRecord::Base
  belongs_to :commentable, polymorphic: true
  has_many :comments, :as => :commentable

  validates :content, length: {:minimum => 2}, length: {:maximum => 80}, presence: true
end
