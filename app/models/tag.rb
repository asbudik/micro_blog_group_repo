class Tag < ActiveRecord::Base
  has_many :posttags
  has_many :posts, :through => :posttags
  has_many :users, :through => :posts

  validates :name, presence: true, length: {:minimum => 3}, length: {:maximum => 12}
  validates_format_of :name, :with => /\A+[a-zA-Z]*\z/
end
