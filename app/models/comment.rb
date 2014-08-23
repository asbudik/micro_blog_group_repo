class Comment < ActiveRecord::Base
  belongs_to :commentable, polymorphic: true
  has_many :comments, as: :commentable

  validates :comment, presence: true, length: {:minimum => 2, :maximum => 250}
end
