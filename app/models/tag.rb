class Tag < ActiveRecord::Base
  has_many :posttags
  has_many :posts, :through => :posttags
  has_many :users, :through => :posts

  validates :tag, presence: true, uniqueness: true, length: {:minimum  => 2, :maximum => 20}
  #only allows letters
  validates_format_of :tag, with => /\A[a-zA-Z]*\z/
end
