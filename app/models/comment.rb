class Comment < ActiveRecord::Base

  include ActsAsCommentable::Comment
  attr_accessor :comment
  belongs_to :commentable, :polymorphic => true
  has_many :comments, :as => :commentable
  belongs_to :post
  # default_scope -> { order('created_at ASC') }

  # NOTE: install the acts_as_votable plugin if you
  # want user to vote on the quality of comments.
  #acts_as_voteable

  # NOTE: Comments belong to a user
  belongs_to :user

  validates :comment, presence: true, length: {:maximum => 80}
end
