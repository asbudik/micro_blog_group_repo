class Comment < ActiveRecord::Base

  # acts_as_tree order: 'created_at DESC'
  belongs_to :commentable, :polymorphic => true
  has_many :comments, :as => :commentable
  belongs_to :post
  # default_scope -> { order('created_at ASC') }

  # NOTE: install the acts_as_votable plugin if you
  # want user to vote on the quality of comments.
  #acts_as_voteable
  validates :content, length: {:minimum => 2}, length: {:maximum => 80}, presence: true

end
