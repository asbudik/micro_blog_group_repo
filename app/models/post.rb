class Post < ActiveRecord::Base
  belongs_to :user
  has_many :comments, :as => :commentable, :dependent => :destroy
  has_many :posttags, dependent: :destroy
  has_many :tags, :through => :posttags, dependent: :destroy
  
  validates_associated :posttags
  validates :title, length: {:maximum => 50}, presence: true
  validates :body, length: {:maximum => 251}, presence: true
  def stringify_tags
    self.tags
      .map do |tag|
          tag.name
      end
      .join(", ")
  end
end