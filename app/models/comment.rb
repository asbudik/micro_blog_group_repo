class Comment < ActiveRecord::Base

  # acts_as_tree order: 'created_at DESC'
  belongs_to :commentable, :polymorphic => true
  has_many :comments, :as => :commentable
  belongs_to :post

  validates :content, length: {:minimum => 2}, length: {:maximum => 80}, presence: true

end
